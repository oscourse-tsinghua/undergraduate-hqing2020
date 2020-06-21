package CPU

import chisel3._
import chisel3.util._

class llbit_reg_io extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // is exc?
  val flush = Input(Bool())

  // write
  val we_i = Input(Bool())
  val LLbit_i = Input(Bool())
  val LLbit_addr_i = Input(UInt(34.W))

  // read
  val LLbit_o = Output(Bool())
  val LLbit_addr_o = Output(UInt(34.W))
}

class llbit_reg extends Module{
  val io = IO(new llbit_reg_io)

  // LL bit value
  val LLbit = Reg(Bool())
  val LLbit_addr = RegInit(0.U(34.W))

  withClock(io.clk){
    when(io.rst_n === d.RstEnable){
      LLbit := false.B
      LLbit_addr := d.ZeroWord
    }.elsewhen(io.flush === d.Flush){
      LLbit := false.B
      LLbit_addr := d.ZeroWord
    }.elsewhen(io.we_i === d.WriteEnable){
      LLbit := io.LLbit_i
      LLbit_addr := io.LLbit_addr_i
    }
  }

  when(io.rst_n === d.RstEnable){
    io.LLbit_o := false.B
    io.LLbit_addr_o := d.ZeroWord
  }.elsewhen(io.flush === d.Flush){
    io.LLbit_o := false.B
    io.LLbit_addr_o := d.ZeroWord
  }.elsewhen(io.we_i === d.WriteEnable){
    io.LLbit_o := io.LLbit_i
    io.LLbit_addr_o := io.LLbit_addr_i
  }.otherwise{
    io.LLbit_o := LLbit
    io.LLbit_addr_o := LLbit_addr
  }
}
