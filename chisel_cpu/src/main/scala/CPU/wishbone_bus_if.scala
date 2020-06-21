package CPU

import chisel3._
import chisel3.util._

class wishbone_bus_if_io extends Bundle{
  val wishbone_clk   = Input(Clock())
  val cpu_clk   = Input(Clock())
  val rst_n = Input(Bool())

  // from ctrl
  val stall_i = Input(UInt(6.W))
  val stall_this_i = Input(Bool())
  val flush_i = Input(Bool())

  // CPU interface
  val cpu_ce_i   = Input(Bool())
  val cpu_data_i = Input(UInt(32.W))
  val cpu_addr_i = Input(UInt(34.W))
  val cpu_we_i   = Input(Bool())
  val cpu_sel_i  = Input(UInt(4.W))
  val cpu_data_o = Output(UInt(32.W))

  // Wishbone interface
  val wishbone_data_i = Input(UInt(32.W))
  val wishbone_ack_i  = Input(Bool())
  val wishbone_addr_o = Output(UInt(34.W))
  val wishbone_data_o = Output(UInt(32.W))
  val wishbone_we_o   = Output(Bool())
  val wishbone_sel_o  = Output(UInt(4.W))
  val wishbone_stb_o  = Output(Bool())
  val wishbone_cyc_o  = Output(Bool())

  val stallreq   = Output(Bool())
}

class wishbone_bus_if extends Module{
  val io = IO(new wishbone_bus_if_io)

  val process = Reg(Bool())
  process := (io.cpu_ce_i === true.B) && (io.flush_i === d.NoFlush)

  // shake hand protocol:
  //     cpu req,
  //     cpu ack(what wants wishbone to ack)
  //     wishbone ack(ack response from wishbone)
  //
  // def what_wants_wishbone_to_ack:
  //     if process:
  //         ack = req + 1
  //     else:
  //         ack = req
  //     return ack
  val cpu_ack_id = Reg(Bool())
  val cpu_req_id = Reg(Bool())
  val wishbone_ack_id = Reg(Bool())
  cpu_req_id := Mux(process === true.B, cpu_ack_id ^ 1.U, cpu_ack_id)

  // wishbone acked or not
  val wishbone_ack_valid = Reg(Bool())

  // is requesting or not
  //
  // if process == 0:
  //     not req
  //
  // if ack == req && wishbone_ack_valid == 1:
  //     not req
  // else
  //     req
  val request_bus = Reg(Bool())
  request_bus := (process === true.B) && (wishbone_ack_id =/= cpu_req_id || wishbone_ack_valid === false.B)

  // request for maximum 2^cyc_len_log_2 consequential bus access
  val req_cnt = Reg(UInt(8.W))
  withClock(io.cpu_clk){
    when(io.rst_n === d.RstEnable){
      cpu_ack_id := false.B
      req_cnt := Fill(8, 0.U(1.W))
    }.elsewhen(io.stallreq =/= d.Stop && (io.stall_this_i =/= d.Stop || io.flush_i === d.NoFlush)){
      cpu_ack_id := wishbone_ack_id
      req_cnt := req_cnt + 1.U
    }
  }

  io.cpu_data_o := d.ZeroWord

  withClock(io.wishbone_clk){
    when(io.rst_n === d.RstEnable){
      wishbone_ack_valid := false.B
      wishbone_ack_id := false.B
    }.elsewhen((io.wishbone_ack_i.asUInt & request_bus.asUInt).asBool){
      wishbone_ack_valid := true.B
      wishbone_ack_id := cpu_req_id

      io.cpu_data_o := io.wishbone_data_i
    }
  }

  io.wishbone_addr_o := io.cpu_addr_i
  io.wishbone_data_o := io.cpu_data_i(31,0)

  // 归约运算问题
  io.wishbone_cyc_o := (request_bus | ((io.flush_i === d.NoFlush) & (~req_cnt.andR).asUInt & (io.stallreq === d.Stop || io.stall_this_i === d.NoStop)))
  io.wishbone_stb_o := request_bus
  io.wishbone_we_o := io.cpu_we_i
  io.wishbone_sel_o := io.cpu_sel_i(3,0)

  val stall_delay = Reg(UInt(11.W))
  val not_use = Reg(Bool())

  withClockAndReset(io.wishbone_clk, io.rst_n){
    when(io.rst_n === d.RstEnable){
      stall_delay := 0.U
    }.elsewhen(io.flush_i === d.Flush){
      stall_delay := 0.U
    }.elsewhen((io.wishbone_ack_i.asUInt & request_bus.asUInt) === 1.U){
      not_use := stall_delay(10)
      stall_delay := Cat(stall_delay(9,0), 0.U)
    }.otherwise{
      not_use := stall_delay(10)
      stall_delay := Cat(stall_delay(9,0), request_bus.asUInt)
    }
  }

  io.stallreq := false.B
  io.stallreq := stall_delay.orR && (io.flush_i === d.NoFlush)
}
