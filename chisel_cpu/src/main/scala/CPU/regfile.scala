package CPU

import chisel3._
import chisel3.util._

class regfileIO extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  //port1
  val re1 = Input(Bool())
  val raddr1 = Input(UInt(5.W))
  val rdata1 = Output(UInt(32.W))

  //port2
  val re2 = Input(Bool())
  val raddr2 = Input(UInt(5.W))
  val rdata2 = Output(UInt(32.W))

  val we = Input(Bool())
  val waddr = Input(UInt(5.W))
  val wdata = Input(UInt(32.W))
}

class regfile extends Module{
  val io = IO(new regfileIO)

  val registers = Mem(32, UInt(32.W))

  when(io.we === d.WriteEnable && io.waddr =/= "h0".U(5.W)){
    registers(io.waddr) := io.wdata
  }

  // port1
  when(io.rst_n === d.RstEnable){
    io.rdata1 := d.ZeroWord

  }.elsewhen(io.raddr1 === "h0".U(5.W)){
    io.rdata1 := d.ZeroWord

  }.elsewhen(io.raddr1 === io.waddr && io.we === d.WriteEnable && io.re1 === d.ReadEnable){
    io.rdata1 := io.wdata

  }.elsewhen(io.re1 === d.ReadEnable){
    io.rdata1 := registers(io.raddr1)

  }.otherwise{
    io.rdata1 := d.ZeroWord
  }

  // port2
  when(io.rst_n === d.RstEnable){
    io.rdata2 := d.ZeroWord

  }.elsewhen(io.raddr2 === "h0".U(5.W)){
    io.rdata2 := d.ZeroWord

  }.elsewhen(io.raddr2 === io.waddr && io.we === d.WriteEnable && io.re2 === d.ReadEnable){
    io.rdata2 := io.wdata

  }.elsewhen(io.re2 === d.ReadEnable){
    io.rdata2 := registers(io.raddr2)

  }.otherwise {
    io.rdata2 := d.ZeroWord
  }
}
