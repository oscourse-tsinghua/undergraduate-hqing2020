package CPU

import chisel3._
import chisel3.util._


class IF_ID_io extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // from CU
  val stall = Input(UInt(6.W))
  val flush = Input(Bool())

  // if
  val if_excepttype = Input(UInt(32.W))

  val if_pc      = Input(UInt(32.W))
  val if_inst    = Input(UInt(32.W))
  val if_inst_ce = Input(Bool())

  // if
  val id_excepttype = Output(UInt(32.W))

  val id_pc      = Output(UInt(32.W))
  val id_inst    = Output(UInt(32.W))
  val id_not_stall = Output(Bool())
}

class IF_ID extends Module{
  val io = IO(new IF_ID_io)

  withClock(io.clk){
    def onReset(): Unit = {
      io.id_pc := d.ZeroWord
      io.id_inst := d.ZeroWord
      io.id_not_stall := false.B
      io.id_excepttype := d.ZeroWord
    }
    onReset()
    when(io.rst_n === d.RstEnable){
      onReset()
    }.elsewhen(io.if_inst_ce === d.ChipDisable){
      onReset()
    }.elsewhen(io.flush === d.Flush){
      onReset()
    }.elsewhen(io.stall(1) === 1.U && io.stall(2) === 0.U){
      onReset()

    }.elsewhen(io.stall(1) === 0.U){
      io.id_pc := io.if_pc
      io.id_inst := io.if_inst
      io.id_not_stall := true.B
      io.id_excepttype := io.if_excepttype
    }
  }
}
