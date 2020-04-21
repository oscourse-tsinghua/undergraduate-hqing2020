package CPU

import chisel3._

class CUIO extends Bundle{
  val rst_n = Input(Bool())

  val flushreq_from_csr = Input(Bool())

  val stallreq_from_if = Input(Bool())
  val stallreq_from_id = Input(Bool())
  val stallreq_from_ex = Input(Bool())
  val stallreq_from_mem = Input(Bool())
  val stallreq_from_wb = Input(Bool())

  val flush = Output(Bool())
  val stall = Output(UInt(6.W))
}

class ControlUnit extends Module{
  val io = IO(new CUIO)
  val stall_b = VecInit(d.ZeroWord.asBools)
  when(io.rst_n === d.RstEnable){
    io.stall := "b000000".U(6.W)
  }.elsewhen(io.flushreq_from_csr === true.B){
    io.stall := "b000000".U(6.W)
  }.otherwise{
    stall_b(0) := Mux((io.stallreq_from_wb === d.Stop  || io.stallreq_from_mem === d.Stop  || io.stallreq_from_ex === d.Stop  || io.stallreq_from_id === d.Stop  || io.stallreq_from_if === d.Stop ), d.Stop, d.NoStop)
    stall_b(1) := Mux((io.stallreq_from_wb === d.Stop  || io.stallreq_from_mem === d.Stop  || io.stallreq_from_ex === d.Stop  || io.stallreq_from_id === d.Stop  || io.stallreq_from_if === d.Stop ), d.Stop, d.NoStop)
    stall_b(2) := Mux((io.stallreq_from_wb === d.Stop  || io.stallreq_from_mem === d.Stop  || io.stallreq_from_ex === d.Stop  || io.stallreq_from_id === d.Stop  || io.stallreq_from_if === d.Stop ), d.Stop, d.NoStop)
    stall_b(3) := Mux((io.stallreq_from_wb === d.Stop  || io.stallreq_from_mem === d.Stop  || io.stallreq_from_ex === d.Stop ), d.Stop, d.NoStop)
    stall_b(4) := Mux(io.stallreq_from_wb === d.Stop || io.stallreq_from_mem === d.Stop, d.Stop, d.NoStop)
    stall_b(5) := Mux(io.stallreq_from_wb === d.Stop, d.Stop, d.NoStop)
  }
  io.stall := stall_b.asUInt
  io.flush := io.flushreq_from_csr

}
