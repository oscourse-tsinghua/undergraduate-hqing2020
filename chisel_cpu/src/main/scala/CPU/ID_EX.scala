package CPU

import chisel3._
import chisel3.util._

class ID_EX_io extends Bundle {
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // from CU
  val stall = Input(UInt(6.W))
  val flush = Input(Bool())

  //
  val id_aluop                = Input(UInt(8.W))
  val id_alusel               = Input(UInt(3.W))
  val id_reg1                 = Input(UInt(32.W))
  val id_reg2                 = Input(UInt(32.W))
  val id_mem_addr             = Input(UInt(32.W))
  val id_wd                   = Input(UInt(5.W))
  val id_wreg                 = Input(Bool())
  val id_link_address         = Input(UInt(32.W))
  val id_is_in_delayslot      = Input(Bool())
  val id_inst                 = Input(UInt(32.W))
  val id_current_inst_address = Input(UInt(32.W))
  val id_not_stall            = Input(Bool())
  val id_excepttype           = Input(UInt(32.W))

  val id_csr_reg_we   = Input(Bool())
  val id_csr_reg_addr = Input(UInt(12.W))
  val id_csr_reg_data = Input(UInt(32.W))

  val next_inst_in_delayslot_i = Input(Bool())
  val step_i = Input(Bool())

  //
  val ex_aluop                = Output(UInt(8.W))
  val ex_alusel               = Output(UInt(3.W))
  val ex_reg1                 = Output(UInt(32.W))
  val ex_reg2                 = Output(UInt(32.W))
  val ex_mem_addr             = Output(UInt(32.W))
  val ex_wd                   = Output(UInt(5.W))
  val ex_wreg                 = Output(Bool())
  val ex_link_address         = Output(UInt(32.W))
  val ex_is_in_delayslot      = Output(Bool())
  val ex_inst                 = Output(UInt(32.W))
  val ex_current_inst_address = Output(UInt(32.W))
  val ex_not_stall            = Output(Bool())
  val ex_excepttype           = Output(UInt(32.W))

  val ex_csr_reg_we   = Output(Bool())
  val ex_csr_reg_addr = Output(UInt(12.W))
  val ex_csr_reg_data = Output(UInt(32.W))

  val is_in_delayslot_o = Output(Bool())
  val step_o = Output(Bool())
}

class ID_EX extends Module{
  val io =IO(new ID_EX_io)
  io.ex_aluop := d.EXE_NOP_OP;
  io.ex_alusel := d.EXE_RES_NOP;
  io.ex_reg1 := d.ZeroWord;
  io.ex_reg2 := d.ZeroWord;
  io.ex_mem_addr := d.ZeroWord;
  io.ex_wd := d.NOPRegAddr;
  io.ex_wreg := d.WriteDisable;

  io.ex_link_address := d.ZeroWord;
  io.ex_is_in_delayslot := d.NotInDelaySlot;
  io.ex_inst := d.ZeroWord;
  io.ex_excepttype := d.ZeroWord;
  io.ex_current_inst_address := d.ZeroWord;
  io.ex_not_stall := false.B

  io.ex_csr_reg_we := d.CSRWriteDisable;
  io.ex_csr_reg_addr := d.ZeroWord;
  io.ex_csr_reg_data := d.ZeroWord;

  io.is_in_delayslot_o := d.NotInDelaySlot;
  io.step_o := 0.U
  withClockAndReset(io.clk, io.rst_n){
    when(io.flush === d.Flush){
      io.ex_aluop := d.EXE_NOP_OP;
      io.ex_alusel := d.EXE_RES_NOP;
      io.ex_reg1 := d.ZeroWord;
      io.ex_reg2 := d.ZeroWord;
      io.ex_mem_addr := d.ZeroWord;
      io.ex_wd := d.NOPRegAddr;
      io.ex_wreg := d.WriteDisable;

      io.ex_link_address := d.ZeroWord;
      io.ex_is_in_delayslot := d.NotInDelaySlot;
      io.ex_inst := d.ZeroWord;
      io.ex_excepttype := d.ZeroWord;
      io.ex_current_inst_address := d.ZeroWord;
      io.ex_not_stall := false.B

      io.ex_csr_reg_we := d.CSRWriteDisable;
      io.ex_csr_reg_addr := d.ZeroWord;
      io.ex_csr_reg_data := d.ZeroWord;

      io.is_in_delayslot_o := d.NotInDelaySlot;
      io.step_o := 0.U

    }.elsewhen(io.stall(2) === 1.U && io.stall(3) === 0.U){
      io.ex_aluop := d.EXE_NOP_OP;
      io.ex_alusel := d.EXE_RES_NOP;
      io.ex_reg1 := d.ZeroWord;
      io.ex_reg2 := d.ZeroWord;
      io.ex_mem_addr := d.ZeroWord;
      io.ex_wd := d.NOPRegAddr;
      io.ex_wreg := d.WriteDisable;

      io.ex_link_address := d.ZeroWord;
      io.ex_is_in_delayslot := d.NotInDelaySlot;
      io.ex_inst := d.ZeroWord;
      io.ex_excepttype := d.ZeroWord;
      io.ex_current_inst_address := d.ZeroWord;
      io.ex_not_stall := false.B

      io.ex_csr_reg_we := d.CSRWriteDisable;
      io.ex_csr_reg_addr := d.ZeroWord;
      io.ex_csr_reg_data := d.ZeroWord;

      //io.is_in_delayslot_o := d.NotInDelaySlot;
      io.step_o := io.step_i

    }.elsewhen(io.stall(2) === 0.U){
      io.ex_aluop := io.id_aluop
      io.ex_alusel := io.id_alusel
      io.ex_reg1 := io.id_reg1
      io.ex_reg2 := io.id_reg2
      io.ex_mem_addr := io.id_mem_addr
      io.ex_wd := io.id_wd
      io.ex_wreg := io.id_wreg

      io.ex_link_address := io.id_link_address
      io.ex_is_in_delayslot := io.id_is_in_delayslot
      io.ex_inst := io.id_inst
      io.ex_excepttype := io.id_excepttype
      io.ex_current_inst_address := io.id_current_inst_address
      io.ex_not_stall := io.id_not_stall

      io.ex_csr_reg_we := io.id_csr_reg_we
      io.ex_csr_reg_addr := io.id_csr_reg_addr
      io.ex_csr_reg_data := io.id_csr_reg_data

      io.is_in_delayslot_o := io.next_inst_in_delayslot_i
      io.step_o := 0.U

    }.otherwise{
      io.step_o := io.step_i
    }
  }
}
