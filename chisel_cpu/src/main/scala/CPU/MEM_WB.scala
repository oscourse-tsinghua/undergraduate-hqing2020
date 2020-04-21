package CPU

import chisel3._
import chisel3.util._

class MEM_EX_io extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // from CU
  val stall = Input(UInt(6.W))
  val flush = Input(Bool())

  // mem
  val mem_wd          = Input(UInt(5.W))
  val mem_wreg        = Input(Bool())
  val mem_wdata       = Input(UInt(32.W))
  val mem_LLbit_we    = Input(Bool())
  val mem_LLbit_value = Input(Bool())
  val mem_LLbit_addr  = Input(UInt(34.W))

  val mem_csr_reg_we   = Input(Bool())
  val mem_csr_reg_addr = Input(UInt(12.W))
  val mem_csr_reg_data = Input(UInt(32.W))

  val mem_cnt_i = Input(UInt(2.W))
  val mem_original_data_i = Input(UInt(32.W))

  // wb
  val wb_wd          = Output(UInt(5.W))
  val wb_wreg        = Output(Bool())
  val wb_wdata       = Output(UInt(32.W))
  val wb_LLbit_we    = Output(Bool())
  val wb_LLbit_value = Output(Bool())
  val wb_LLbit_addr  = Output(UInt(34.W))

  val wb_csr_reg_we   = Output(Bool())
  val wb_csr_reg_addr = Output(UInt(12.W))
  val wb_csr_reg_data = Output(UInt(32.W))

  val mem_cnt_o = Output(UInt(2.W))
  val mem_original_data_o = Output(UInt(32.W))
}

class MEM_WB extends Module{
  val io = IO(new MEM_EX_io)

  io.wb_wd := d.NOPRegAddr
  io.wb_wreg := d.WriteDisable
  io.wb_wdata := d.ZeroWord
  io.wb_LLbit_we := false.B
  io.wb_LLbit_value := false.B
  io.wb_LLbit_addr := d.ZeroWord

  io.wb_csr_reg_we := d.CSRWriteDisable
  io.wb_csr_reg_addr := d.NOPRegAddr
  io.wb_csr_reg_data := d.ZeroWord

  io.mem_cnt_o := 0.U
  io.mem_original_data_o := d.ZeroWord
  withClockAndReset(io.clk, io.rst_n){
    when(io.rst_n || io.flush === d.Flush){
      io.wb_wd := d.NOPRegAddr
      io.wb_wreg := d.WriteDisable
      io.wb_wdata := d.ZeroWord
      io.wb_LLbit_we := false.B
      io.wb_LLbit_value := false.B
      io.wb_LLbit_addr := d.ZeroWord

      io.wb_csr_reg_we := d.CSRWriteDisable
      io.wb_csr_reg_addr := d.NOPRegAddr
      io.wb_csr_reg_data := d.ZeroWord

      io.mem_cnt_o := 0.U
      io.mem_original_data_o := d.ZeroWord

    }.elsewhen(io.stall(4) === 1.U && io.stall(5) === 0.U){
      io.wb_wd := d.NOPRegAddr
      io.wb_wreg := d.WriteDisable
      io.wb_wdata := d.ZeroWord
      io.wb_LLbit_we := false.B
      io.wb_LLbit_value := false.B
      io.wb_LLbit_addr := d.ZeroWord

      io.wb_csr_reg_we := d.CSRWriteDisable
      io.wb_csr_reg_addr := d.NOPRegAddr
      io.wb_csr_reg_data := d.ZeroWord

      io.mem_cnt_o := io.mem_cnt_i
      io.mem_original_data_o := io.mem_original_data_i

    }.elsewhen(io.stall(4) === 0.U){
      io.wb_wd := io.mem_wd
      io.wb_wreg := io.mem_wreg
      io.wb_wdata :=io.mem_wdata
      io.wb_LLbit_we := io.mem_LLbit_we
      io.wb_LLbit_value := io.mem_LLbit_value
      io.wb_LLbit_addr := io.mem_LLbit_addr

      io.wb_csr_reg_we := io.mem_csr_reg_we
      io.wb_csr_reg_addr := io.mem_csr_reg_addr
      io.wb_csr_reg_data := io.mem_csr_reg_data

      io.mem_cnt_o := 0.U
      io.mem_original_data_o := d.ZeroWord

    }.otherwise{
      io.mem_cnt_o := io.mem_cnt_i
      io.mem_original_data_o := io.mem_original_data_i
    }
  }
}
