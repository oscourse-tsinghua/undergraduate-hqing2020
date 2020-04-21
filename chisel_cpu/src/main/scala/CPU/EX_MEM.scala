package CPU

import chisel3._
import chisel3.util._

class EX_MEM_io extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // from CU
  val stall = Input(UInt(6.W))
  val flush = Input(Bool())

  // from ex
  val ex_wd    = Input(UInt(5.W))
  val ex_wreg  = Input(Bool())
  val ex_wdata = Input(UInt(32.W))
  // load store
  val ex_aluop    = Input(UInt(8.W))
  val ex_mem_addr = Input(UInt(32.W))
  val ex_reg2     = Input(UInt(32.W))

  // last ex
  val cnt_i    = Input(UInt(2.W))
  val div_started_i  = Input(Bool())

  // write to CSR
  val ex_csr_reg_we      = Input(Bool())
  val ex_csr_reg_addr    = Input(UInt(12.W))
  val ex_csr_reg_data    = Input(UInt(32.W))

  // write phy addr
  val ex_mem_phy_addr    = Input(UInt(34.W))
  val ex_data_tlb_r_exception      = Input(Bool())
  val ex_data_tlb_w_exception      = Input(Bool())

  // exc
  val ex_excepttype           = Input(UInt(32.W))
  val ex_is_in_delayslot      = Input(Bool())
  val ex_current_inst_address = Input(UInt(32.W))
  val ex_not_stall            = Input(Bool())

  // to mem
  val mem_wd    = Output(UInt(5.W))
  val mem_wreg  = Output(Bool())
  val mem_wdata = Output(UInt(32.W))
  //
  val mem_aluop    = Output(UInt(8.W))
  val mem_mem_addr = Output(UInt(32.W))
  val mem_reg2     = Output(UInt(32.W))

  // write to CSR
  val mem_csr_reg_we      = Output(Bool())
  val mem_csr_reg_addr    = Output(UInt(12.W))
  val mem_csr_reg_data    = Output(UInt(32.W))

  // exc
  val mem_excepttype           = Output(UInt(32.W))
  val mem_is_in_delayslot      = Output(Bool())
  val mem_current_inst_address = Output(UInt(32.W))
  val mem_not_stall            = Output(Bool())

  // write phy addr
  val mem_mem_phy_addr    = Output(UInt(34.W))
  val mem_data_tlb_r_exception      = Output(Bool())
  val mem_data_tlb_w_exception      = Output(Bool())

  // next ex
  val cnt_o    = Output(UInt(2.W))
  val div_started_o  = Output(Bool())
}

class EX_MEM extends Module{
  val io = IO(new EX_MEM_io)

  io.mem_wd := d.NOPRegAddr
  io.mem_wreg := d.WriteDisable
  io.mem_wdata := d.ZeroWord

  io.mem_aluop := d.EXE_NOP_OP
  io.mem_mem_addr := d.ZeroWord
  io.mem_reg2 := d.ZeroWord

  io.mem_csr_reg_we := d.CSRWriteDisable
  io.mem_csr_reg_addr := d.NOPRegAddr
  io.mem_csr_reg_data := d.ZeroWord

  io.mem_excepttype := d.ZeroWord
  io.mem_is_in_delayslot := d.NotInDelaySlot
  io.mem_current_inst_address := d.ZeroWord
  io.mem_not_stall := false.B

  io.mem_mem_phy_addr := d.ZeroWord
  io.mem_data_tlb_r_exception := false.B
  io.mem_data_tlb_w_exception := false.B

  io.cnt_o := 0.U(2.W)
  io.div_started_o := false.B
  withClockAndReset(io.clk, io.rst_n){
    when(io.rst_n || io.flush === d.Flush){
      io.mem_wd := d.NOPRegAddr
      io.mem_wreg := d.WriteDisable
      io.mem_wdata := d.ZeroWord

      io.mem_aluop := d.EXE_NOP_OP
      io.mem_mem_addr := d.ZeroWord
      io.mem_reg2 := d.ZeroWord

      io.mem_csr_reg_we := d.CSRWriteDisable
      io.mem_csr_reg_addr := d.NOPRegAddr
      io.mem_csr_reg_data := d.ZeroWord

      io.mem_excepttype := d.ZeroWord
      io.mem_is_in_delayslot := d.NotInDelaySlot
      io.mem_current_inst_address := d.ZeroWord
      io.mem_not_stall := false.B

      io.mem_mem_phy_addr := d.ZeroWord
      io.mem_data_tlb_r_exception := false.B
      io.mem_data_tlb_w_exception := false.B

      io.cnt_o := 0.U(2.W)
      io.div_started_o := false.B

    }.elsewhen(io.stall(3) === 1.U && io.stall(4) === 0.U){
      io.mem_wd := d.NOPRegAddr
      io.mem_wreg := d.WriteDisable
      io.mem_wdata := d.ZeroWord

      io.mem_aluop := d.EXE_NOP_OP
      io.mem_mem_addr := d.ZeroWord
      io.mem_reg2 := d.ZeroWord

      io.mem_csr_reg_we := d.CSRWriteDisable
      io.mem_csr_reg_addr := d.NOPRegAddr
      io.mem_csr_reg_data := d.ZeroWord

      io.mem_excepttype := d.ZeroWord
      io.mem_is_in_delayslot := d.NotInDelaySlot
      io.mem_current_inst_address := d.ZeroWord
      io.mem_not_stall := false.B

      io.mem_mem_phy_addr := d.ZeroWord
      io.mem_data_tlb_r_exception := false.B
      io.mem_data_tlb_w_exception := false.B

      io.cnt_o := io.cnt_i
      io.div_started_o := io.div_started_i

    }.elsewhen(io.stall(3) === 0.U){
      io.mem_wd := io.ex_wd
      io.mem_wreg := io.ex_wreg
      io.mem_wdata := io.ex_wdata

      io.mem_aluop := io.ex_aluop
      io.mem_mem_addr := io.ex_mem_addr
      io.mem_reg2 := io.ex_reg2

      io.mem_csr_reg_we := io.ex_csr_reg_we
      io.mem_csr_reg_addr := io.ex_csr_reg_addr
      io.mem_csr_reg_data := io.ex_csr_reg_data

      io.mem_excepttype := io.ex_excepttype
      io.mem_is_in_delayslot := io.ex_is_in_delayslot
      io.mem_current_inst_address := io.ex_current_inst_address
      io.mem_not_stall := io.ex_not_stall

      io.mem_mem_phy_addr := io.ex_mem_phy_addr
      io.mem_data_tlb_r_exception := io.ex_data_tlb_r_exception
      io.mem_data_tlb_w_exception := io.ex_data_tlb_w_exception

      io.cnt_o := 0.U(2.W)
      io.div_started_o := false.B

    }.otherwise{
      io.cnt_o := io.cnt_i
      io.div_started_o := io.div_started_i
    }
  }
}
