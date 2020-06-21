package CPU

import chisel3._
import chisel3.util._

import scala.collection.mutable.ArrayBuffer
import chisel3.experimental.ChiselEnum

object ins {

 def BEQ                = BitPat("b?????????????????000?????1100011")
 def BNE                = BitPat("b?????????????????001?????1100011")
 def BLT                = BitPat("b?????????????????100?????1100011")
 def BGE                = BitPat("b?????????????????101?????1100011")
 def BLTU               = BitPat("b?????????????????110?????1100011")
 def BGEU               = BitPat("b?????????????????111?????1100011")
 def JALR               = BitPat("b?????????????????000?????1100111")
 def JAL                = BitPat("b?????????????????????????1101111")
 def LUI                = BitPat("b?????????????????????????0110111")
 def AUIPC              = BitPat("b?????????????????????????0010111")
 def ADDI               = BitPat("b?????????????????000?????0010011")
 def SLLI               = BitPat("b000000???????????001?????0010011")
 def SLTI               = BitPat("b?????????????????010?????0010011")
 def SLTIU              = BitPat("b?????????????????011?????0010011")
 def XORI               = BitPat("b?????????????????100?????0010011")
 def SRLI               = BitPat("b000000???????????101?????0010011")
 def SRAI               = BitPat("b010000???????????101?????0010011")
 def ORI                = BitPat("b?????????????????110?????0010011")
 def ANDI               = BitPat("b?????????????????111?????0010011")
 def ADD                = BitPat("b0000000??????????000?????0110011")
 def SUB                = BitPat("b0100000??????????000?????0110011")
 def SLL                = BitPat("b0000000??????????001?????0110011")
 def SLT                = BitPat("b0000000??????????010?????0110011")
 def SLTU               = BitPat("b0000000??????????011?????0110011")
 def XOR                = BitPat("b0000000??????????100?????0110011")
 def SRL                = BitPat("b0000000??????????101?????0110011")
 def SRA                = BitPat("b0100000??????????101?????0110011")
 def OR                 = BitPat("b0000000??????????110?????0110011")
 def AND                = BitPat("b0000000??????????111?????0110011")
 def ADDIW              = BitPat("b?????????????????000?????0011011")
 def SLLIW              = BitPat("b0000000??????????001?????0011011")
 def SRLIW              = BitPat("b0000000??????????101?????0011011")
 def SRAIW              = BitPat("b0100000??????????101?????0011011")
 def ADDW               = BitPat("b0000000??????????000?????0111011")
 def SUBW               = BitPat("b0100000??????????000?????0111011")
 def SLLW               = BitPat("b0000000??????????001?????0111011")
 def SRLW               = BitPat("b0000000??????????101?????0111011")
 def SRAW               = BitPat("b0100000??????????101?????0111011")
 def LB                 = BitPat("b?????????????????000?????0000011")
 def LH                 = BitPat("b?????????????????001?????0000011")
 def LW                 = BitPat("b?????????????????010?????0000011")
 def LD                 = BitPat("b?????????????????011?????0000011")
 def LBU                = BitPat("b?????????????????100?????0000011")
 def LHU                = BitPat("b?????????????????101?????0000011")
 def LWU                = BitPat("b?????????????????110?????0000011")
 def SB                 = BitPat("b?????????????????000?????0100011")
 def SH                 = BitPat("b?????????????????001?????0100011")
 def SW                 = BitPat("b?????????????????010?????0100011")
 def SD                 = BitPat("b?????????????????011?????0100011")
 def FENCE              = BitPat("b?????????????????000?????0001111")
 def FENCE_I            = BitPat("b00000000000000000001000000001111")
 def MUL                = BitPat("b0000001??????????000?????0110011")
 def MULH               = BitPat("b0000001??????????001?????0110011")
 def MULHSU             = BitPat("b0000001??????????010?????0110011")
 def MULHU              = BitPat("b0000001??????????011?????0110011")
 def DIV                = BitPat("b0000001??????????100?????0110011")
 def DIVU               = BitPat("b0000001??????????101?????0110011")
 def REM                = BitPat("b0000001??????????110?????0110011")
 def REMU               = BitPat("b0000001??????????111?????0110011")
 def MULW               = BitPat("b0000001??????????000?????0111011")
 def DIVW               = BitPat("b0000001??????????100?????0111011")
 def DIVUW              = BitPat("b0000001??????????101?????0111011")
 def REMW               = BitPat("b0000001??????????110?????0111011")
 def REMUW              = BitPat("b0000001??????????111?????0111011")
 def AMOADD             = BitPat("b00000????????????010?????0101111")
 def AMOXOR             = BitPat("b00100????????????010?????0101111")
 def AMOOR              = BitPat("b01000????????????010?????0101111")
 def AMOAND             = BitPat("b01100????????????010?????0101111")
 def AMOMIN             = BitPat("b10000????????????010?????0101111")
 def AMOMAX             = BitPat("b10100????????????010?????0101111")
 def AMOMINU            = BitPat("b11000????????????010?????0101111")
 def AMOMAXU            = BitPat("b11100????????????010?????0101111")
 def AMOSWAP            = BitPat("b00001????????????010?????0101111")
 def LR                 = BitPat("b00010??00000?????010?????0101111")
 def SC                 = BitPat("b00011????????????010?????0101111")

 def ECALL              = BitPat("b00000000000000000000000001110011")
 def EBREAK             = BitPat("b00000000000100000000000001110011")
 def WFI                = BitPat("b00010000010100000000000001110011")
 def URET               = BitPat("b00000000001000000000000001110011")
 def SRET               = BitPat("b00010000001000000000000001110011")
 def MRET               = BitPat("b00110000001000000000000001110011")
 def CSRRW              = BitPat("b?????????????????001?????1110011")
 def CSRRS              = BitPat("b?????????????????010?????1110011")
 def CSRRC              = BitPat("b?????????????????011?????1110011")
 def CSRRWI             = BitPat("b?????????????????101?????1110011")
 def CSRRSI             = BitPat("b?????????????????110?????1110011")
 def CSRRCI             = BitPat("b?????????????????111?????1110011")
 def SLLI_RV32          = BitPat("b0000000??????????001?????0010011")
 def SRLI_RV32          = BitPat("b0000000??????????101?????0010011")
 def SRAI_RV32          = BitPat("b0100000??????????101?????0010011")
 def SFENCE_VMA         = BitPat("b0001001??????????000000001110011")
}

class id_io extends Bundle{
 val rst_n = Input(Bool())

 val pc_i = Input(UInt(32.W))
 val inst_i = Input(UInt(32.W))

 val excepttype_i = Input(UInt(32.W))

 val not_stall_i = Input(Bool())

 // ex
 val ex_aluop_i = Input(UInt(8.W))
 val ex_wreg_i = Input(Bool())
 val ex_wdata_i = Input(UInt(32.W))
 val ex_wd_i = Input(UInt(5.W))

 // mem
 val mem_wreg_i = Input(Bool())
 val mem_wdata_i = Input(UInt(32.W))
 val mem_wd_i = Input(UInt(5.W))

 val ex_csr_reg_we_i = Input(Bool())
 val mem_csr_reg_we_i = Input(Bool())
 val wb_csr_reg_we_i = Input(Bool())
 val ex_not_stall_i = Input(Bool())
 val mem_not_stall_i = Input(Bool())

 val reg1_data_i = Input(UInt(32.W))
 val reg2_data_i = Input(UInt(32.W))

 val is_in_delayslot_i = Input(Bool())
 val step_i = Input(Bool())

 val prv_i = Input(UInt(2.W))
 val csr_reg_data_i = Input(UInt(32.W))
 val csr_protect_i = Input(Bool())
 val csr_reg_data_o = Output(UInt(32.W))
 val csr_reg_read_o = Output(Bool())
 val csr_reg_we_o = Output(Bool())
 val csr_reg_addr_o = Output(UInt(12.W))

 val reg1_read_o = Output(Bool())
 val reg2_read_o = Output(Bool())
 val reg1_addr_o = Output(UInt(5.W))
 val reg2_addr_o = Output(UInt(5.W))

 val aluop_o = Output(UInt(8.W))
 val alusel_o = Output(UInt(3.W))
 val reg1_o = Output(UInt(32.W))
 val reg2_o = Output(UInt(32.W))

 val mem_addr_o = Output(UInt(32.W))
 val wd_o = Output(UInt(5.W))
 val wreg_o = Output(Bool())

 val inst_o = Output(UInt(32.W))

 val next_inst_in_delayslot_o = Output(Bool())

 val branch_flag_o = Output(Bool())
 val branch_target_address_o = Output(UInt(32.W))
 val link_addr_o = Output(UInt(32.W))

 val is_in_delayslot_o = Output(Bool())

 val excepttype_o = Output(UInt(32.W))
 val current_inst_address_o = Output(UInt(32.W))
 val not_stall_o = Output(Bool())

 val step_o = Output(Bool())
 val stallreq = Output(Bool())
}

class IDecode extends Module{
 val io = IO(new id_io)

 val opcode = Reg(UInt(7.W))
 val funct3 = Reg(UInt(3.W))
 val AMO_func5 = Reg(UInt(5.W))
 val SYSTEM_func12 = Reg(UInt(12.W))

 opcode := io.inst_i(6,0)
 funct3 := io.inst_i(14,12)
 AMO_func5 := io.inst_i(31,27)
 SYSTEM_func12 := io.inst_i(31,20)

 // reg
 io.reg1_addr_o := io.inst_i(19,15)
 io.reg2_addr_o := io.inst_i(24,20)
 io.csr_reg_addr_o := io.inst_i(31,20)

 io.wd_o := io.inst_i(11,7)

 io.csr_reg_data_o := io.csr_reg_data_i
 io.link_addr_o := io.pc_i + 4.U
 io.inst_o := io.inst_i
 io.current_inst_address_o := io.pc_i

 val imm = Reg(UInt(32.W))
 val imm_i_type = Reg(UInt(32.W))
 val imm_s_type = Reg(UInt(32.W))
 val imm_u_type = Reg(UInt(32.W))
 val imm_sb_type = Reg(UInt(32.W))
 val imm_uj_type = Reg(UInt(32.W))
 val zimm = Reg(UInt(32.W))

 imm_i_type := Cat(Fill(20, io.inst_i(31)), io.inst_i(31,20))
 imm_s_type := Cat(Cat(Fill(20, io.inst_i(31)), io.inst_i(31,25)), io.inst_i(11,7))
 imm_u_type := Cat(io.inst_i(31,12), Fill(12, "b0".U(1.W)))
 imm_sb_type:= Cat(Cat(Cat(Cat(Cat(Fill(19, io.inst_i(31)), io.inst_i(31)), io.inst_i(7)), io.inst_i(30,25)), io.inst_i(11,8)), 0.U(1.W))
 imm_uj_type:= Cat(Cat(Cat(Cat(Cat(Fill(11, io.inst_i(31)), io.inst_i(31)), io.inst_i(19,12)), io.inst_i(20)), io.inst_i(30,21)), 0.U(1.W))
 zimm := Cat(Fill(27, 0.U(1.W)), io.inst_i(19,15))


 val instvalid = Reg(Bool())

 val stallreq_for_reg1_loadrelate = Reg(Bool())
 val stallreq_for_reg2_loadrelate = Reg(Bool())

 val stallreq_for_csr_write_relate = Reg(Bool())
 val stallreq_for_csr_read_relate = Reg(Bool())
 val pre_inst_is_load = Reg(Bool())
 val excepttype_is_syscall = Reg(Bool())
 val excepttype_is_break = Reg(Bool())
 val excepttype_is_sret = Reg(Bool())
 val excepttype_is_mret = Reg(Bool())
 val excepttype_is_fence_i = Reg(Bool())



 stallreq_for_csr_write_relate := Mux(
  io.ex_csr_reg_we_i === d.CSRWriteDisable && io.mem_csr_reg_we_i === d.CSRWriteDisable && io.wb_csr_reg_we_i === d.CSRWriteDisable,
  false.B, true.B)

 stallreq_for_csr_read_relate := ((io.csr_reg_read_o === d.ReadEnable) && (io.ex_not_stall_i || io.mem_not_stall_i))

 io.stallreq := stallreq_for_reg1_loadrelate | stallreq_for_reg2_loadrelate | stallreq_for_csr_write_relate | stallreq_for_csr_read_relate

 pre_inst_is_load := Mux(
   ((io.ex_aluop_i === d.EXE_LB_OP) || (io.ex_aluop_i === d.EXE_LBU_OP) || (io.ex_aluop_i === d.EXE_LH_OP) ||
    (io.ex_aluop_i === d.EXE_LHU_OP) || (io.ex_aluop_i === d.EXE_LW_OP) || (io.ex_aluop_i === d.EXE_LR_OP) ||
    (io.ex_aluop_i === d.EXE_SC_OP) || (io.ex_aluop_i === d.EXE_AMOSWAP_W_OP) || (io.ex_aluop_i === d.EXE_AMOADD_W_OP) ||
    (io.ex_aluop_i === d.EXE_AMOXOR_W_OP) || (io.ex_aluop_i === d.EXE_AMOAND_W_OP) || (io.ex_aluop_i === d.EXE_AMOOR_W_OP) ||
    (io.ex_aluop_i === d.EXE_AMOMIN_W_OP) || (io.ex_aluop_i === d.EXE_AMOMAX_W_OP) || (io.ex_aluop_i === d.EXE_AMOMINU_W_OP) ||
    (io.ex_aluop_i === d.EXE_AMOMAXU_W_OP)),
  true.B, false.B
 )

 // exc *****************************************************************
 val excepttype_b = VecInit(d.ZeroWord.asBools)
  io.excepttype_o := d.ZeroWord
 when(io.rst_n === d.RstEnable){
  //io.excepttype_o := d.ZeroWord
  io.not_stall_o := false.B
 }.elsewhen(io.is_in_delayslot_i === d.InDelaySlot){
  //io.excepttype_o := d.ZeroWord
  io.not_stall_o := false.B
 }.otherwise{
   excepttype_b := io.excepttype_i.asBools

   excepttype_b(d.Exception_INST_ILLEGAL) := instvalid | io.csr_protect_i
   excepttype_b(d.Exception_BREAK) := excepttype_is_break

   excepttype_b(d.Exception_ERET_FROM_S) := excepttype_is_sret
   excepttype_b(d.Exception_ERET_FROM_M) := excepttype_is_mret

   excepttype_b(d.Exception_FENCEI) := excepttype_is_fence_i

  switch(io.prv_i){
   is(d.PRV_U) {excepttype_b(d.Exception_ECALL_FROM_U) := excepttype_is_syscall}
   is(d.PRV_S) {excepttype_b(d.Exception_ECALL_FROM_S) := excepttype_is_syscall}
   is(d.PRV_M) {excepttype_b(d.Exception_ECALL_FROM_M) := excepttype_is_syscall}
  }
  io.excepttype_o := excepttype_b.asUInt
  io.not_stall_o := io.not_stall_i
 }

 /*decoed******************************************************************************************************/
 // (|excepttype_i) == 1'b1
 //
 when(io.rst_n === d.RstEnable || io.is_in_delayslot_i === d.InDelaySlot || io.excepttype_i.orR.asBool){
  io.aluop_o := d.EXE_NOP_OP
  io.alusel_o := d.EXE_RES_NOP
  instvalid := false.B

  io.wreg_o := d.WriteDisable
  io.reg1_read_o := d.ReadDisable
  io.reg2_read_o := d.ReadDisable

  imm := d.ZeroWord

  io.mem_addr_o := d.ZeroWord

  io.branch_target_address_o := d.ZeroWord
  io.branch_flag_o := false.B
  io.next_inst_in_delayslot_o := d.NotInDelaySlot
  io.step_o := false.B

  excepttype_is_syscall := false.B
  excepttype_is_break := false.B
  excepttype_is_sret := false.B
  excepttype_is_mret := false.B
  excepttype_is_fence_i := false.B

  io.csr_reg_read_o := d.ReadDisable
  io.csr_reg_we_o := d.CSRWriteDisable

 }.otherwise{

  io.aluop_o := d.EXE_NOP_OP
  io.alusel_o := d.EXE_RES_NOP
  instvalid := true.B

  io.wreg_o := d.WriteDisable
  io.reg1_read_o := d.ReadDisable
  io.reg2_read_o := d.ReadDisable

  imm := d.ZeroWord

  io.mem_addr_o := d.ZeroWord

  io.branch_target_address_o := d.ZeroWord
  io.branch_flag_o := false.B
  io.next_inst_in_delayslot_o := d.NotInDelaySlot
  io.step_o := false.B

  excepttype_is_syscall := false.B
  excepttype_is_break := false.B
  excepttype_is_sret := false.B
  excepttype_is_mret := false.B
  excepttype_is_fence_i := false.B

  io.csr_reg_read_o := d.ReadDisable
  io.csr_reg_we_o := d.CSRWriteDisable

  def default = List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.Y,// aluop、alusel、ins
                     d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg、reg1、reg2
                     d.ZeroWord,// imm
                     d.ZeroWord,// mem_addr
                     d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr、jflag、delay、step
                     d.X, d.X, d.X, d.X, d.X,// sys、bre、sret、mret、fence
                     d.ReadDisable, d.CSRWriteDisable)// csr_read、csr_we

  val table = Array(
   
   ins.ADDI ->
     List(d.EXE_ADD_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SLTI ->
     List(d.EXE_SLT_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SLTIU ->
     List(d.EXE_SLTU_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.ANDI ->
     List(d.EXE_AND_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.ORI ->
     List(d.EXE_OR_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.XORI ->
     List(d.EXE_XOR_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SLLI ->
     List(d.EXE_SLL_OP, d.EXE_RES_SHIFT, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SRLI ->
     List(d.EXE_SRL_OP, d.EXE_RES_SHIFT, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SRAI ->
     List(d.EXE_SRA_OP, d.EXE_RES_SHIFT, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadDisable,
      imm_i_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   //
   ins.LUI ->
     List(d.EXE_OR_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadDisable, d.ReadDisable,
      imm_u_type,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.AUIPC ->
     List(d.EXE_OR_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadDisable, d.ReadDisable,
      (imm_u_type + io.pc_i),
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.ADD ->
     List(d.EXE_ADD_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),


   ins.SUB ->
     List(d.EXE_SUB_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),


   ins.MUL ->
     List(d.EXE_MUL_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SLL ->
     List(d.EXE_SLL_OP, d.EXE_RES_SHIFT, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.MULH ->
     List(d.EXE_MULH_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SLT ->
     List(d.EXE_SLT_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.MULHSU ->
     List(d.EXE_MULHSU_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SLTU ->
     List(d.EXE_SLTU_OP, d.EXE_RES_ARITHMETIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.MULHU ->
     List(d.EXE_MULHU_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.XOR ->
     List(d.EXE_XOR_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.DIV ->
     List(d.EXE_DIV_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SRL ->
     List(d.EXE_SRL_OP, d.EXE_RES_SHIFT, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.SRA ->
     List(d.EXE_SRA_OP, d.EXE_RES_SHIFT, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.DIVU ->
     List(d.EXE_DIVU_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.OR ->
     List(d.EXE_OR_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.REM ->
     List(d.EXE_REM_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.AND ->
     List(d.EXE_AND_OP, d.EXE_RES_LOGIC, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.REMU ->
     List(d.EXE_REMU_OP, d.EXE_RES_MUL, d.X,
      d.WriteEnable, d.ReadEnable, d.ReadEnable,
      d.ZeroWord,
      d.ZeroWord,
      d.ZeroWord, d.X, d.NotInDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   // J
   ins.JAL ->
     List(d.EXE_JAL_OP, d.EXE_RES_JUMP_BRANCH, d.X,
      d.WriteEnable, d.ReadDisable, d.ReadDisable,
      d.ZeroWord,
      d.ZeroWord,
      (io.pc_i + imm_uj_type), d.Y, d.InDelaySlot, d.X,
      d.X, d.X, d.X, d.X, d.X,
      d.ReadDisable, d.CSRWriteDisable),

   ins.JALR ->
     List(d.EXE_JAL_OP, d.EXE_RES_JUMP_BRANCH, d.X,// aluop alusel ins
      d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
      d.ZeroWord,// imm
      d.ZeroWord,// mem_addr
      Cat(0.U(1.W), (io.reg1_o + imm_i_type)(30,0)), d.Y, d.InDelaySlot, d.X,// jaddr jflag delay step
      d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
      d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

   // B
    ins.BEQ ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        Mux(io.reg1_o === io.reg2_o, io.pc_i + imm_sb_type, d.ZeroWord), Mux(io.reg1_o === io.reg2_o, d.Y, d.X), Mux(io.reg1_o === io.reg2_o, d.InDelaySlot, d.NotInDelaySlot), d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.BNE ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        Mux(io.reg1_o =/= io.reg2_o, io.pc_i + imm_sb_type, d.ZeroWord), Mux(io.reg1_o =/= io.reg2_o, d.Y, d.X), Mux(io.reg1_o =/= io.reg2_o, d.InDelaySlot, d.NotInDelaySlot), d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.BLT ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        Mux(io.reg1_o.asSInt < io.reg2_o.asSInt, io.pc_i + imm_sb_type, d.ZeroWord), Mux(io.reg1_o.asSInt < io.reg2_o.asSInt, d.Y, d.X), Mux(io.reg1_o.asSInt < io.reg2_o.asSInt, d.InDelaySlot, d.NotInDelaySlot), d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.BLTU ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        Mux(io.reg1_o < io.reg2_o, io.pc_i + imm_sb_type, d.ZeroWord), Mux(io.reg1_o < io.reg2_o, d.Y, d.X), Mux(io.reg1_o < io.reg2_o, d.InDelaySlot, d.NotInDelaySlot), d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.BGE ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        Mux(io.reg1_o.asSInt >= io.reg2_o.asSInt, io.pc_i + imm_sb_type, d.ZeroWord), Mux(io.reg1_o.asSInt >= io.reg2_o.asSInt, d.Y, d.X), Mux(io.reg1_o.asSInt >= io.reg2_o.asSInt, d.InDelaySlot, d.NotInDelaySlot), d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.BGEU ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        Mux(io.reg1_o >= io.reg2_o, io.pc_i + imm_sb_type, d.ZeroWord), Mux(io.reg1_o >= io.reg2_o, d.Y, d.X), Mux(io.reg1_o >= io.reg2_o, d.InDelaySlot, d.NotInDelaySlot), d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    // load
    ins.LB ->
      List(d.EXE_LB_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_i_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.LH ->
      List(d.EXE_LH_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_i_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.LW ->
      List(d.EXE_LW_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_i_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.LBU ->
      List(d.EXE_LBU_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_i_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.LHU ->
      List(d.EXE_LHU_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_i_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    // store
    ins.SB ->
      List(d.EXE_SB_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_s_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.SH ->
      List(d.EXE_SH_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_s_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.SW ->
      List(d.EXE_SW_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        (imm_s_type + io.reg1_o),// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    // EXE_MISC_MEM
    ins.FENCE ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, Mux(io.reg1_addr_o === d.ZeroRegAddr && io.wd_o === d.ZeroRegAddr && io.inst_i(31,28) === 0.U(4.W), d.X, d.Y),// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.FENCE_I ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, Mux(io.reg1_addr_o === d.ZeroRegAddr && io.wd_o === d.ZeroRegAddr && imm_i_type === 0.U, d.X, d.Y),// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, Mux(io.reg1_addr_o === d.ZeroRegAddr && io.wd_o === d.ZeroRegAddr && imm_i_type === 0.U, d.Y, d.X),// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    // EXE_SYSTEM
    ins.ECALL ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.Y, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.EBREAK ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.Y, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.SRET ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.Y, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.MRET ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, Mux(io.prv_i >= d.PRV_M, d.X, d.Y),// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, Mux(io.prv_i >= d.PRV_M, d.Y, d.X), d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.WFI ->
      List(d.EXE_NOP_OP, d.EXE_RES_NOP, d.X,// aluop alusel ins
        d.WriteDisable, d.ReadDisable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    // EXE_CSRRW
    ins.CSRRW ->
      List(d.EXE_CSRRW_OP, d.EXE_RES_MOVE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        Mux(io.wd_o =/= d.ZeroRegAddr, d.ReadEnable, d.ReadDisable), d.CSRWrite),// csr_read  csr_we

    ins.CSRRS ->
      List(d.EXE_CSRRS_OP, d.EXE_RES_MOVE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadEnable, Mux(io.reg1_addr_o =/= d.ZeroRegAddr, d.CSRWrite, d.CSRWriteDisable)),// csr_read  csr_we

    ins.CSRRC ->
      List(d.EXE_CSRRC_OP, d.EXE_RES_MOVE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadEnable, Mux(io.reg1_addr_o =/= d.ZeroRegAddr, d.CSRWrite, d.CSRWriteDisable)),// csr_read  csr_we

    ins.CSRRWI ->
      List(d.EXE_CSRRW_OP, d.EXE_RES_MOVE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        zimm,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        Mux(io.wd_o =/= d.ZeroRegAddr, d.ReadEnable, d.ReadDisable), d.CSRWrite),// csr_read  csr_we

    ins.CSRRSI ->
      List(d.EXE_CSRRS_OP, d.EXE_RES_MOVE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        zimm,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadEnable, Mux(io.reg1_addr_o =/= d.ZeroRegAddr, d.CSRWrite, d.CSRWriteDisable)),// csr_read  csr_we

    ins.CSRRCI ->
      List(d.EXE_CSRRC_OP, d.EXE_RES_MOVE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        zimm,// imm
        d.ZeroWord,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadEnable, Mux(io.reg1_addr_o =/= d.ZeroRegAddr, d.CSRWrite, d.CSRWriteDisable)),// csr_read  csr_we

    // EXE_AMO
    ins.LR ->
      List(d.EXE_LR_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadDisable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.SC ->
      List(d.EXE_SC_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOSWAP ->
      List(d.EXE_AMOSWAP_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOADD ->
      List(d.EXE_AMOADD_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOXOR ->
      List(d.EXE_AMOXOR_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOAND ->
      List(d.EXE_AMOAND_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOOR ->
      List(d.EXE_AMOOR_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOMIN ->
      List(d.EXE_AMOMIN_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOMAX ->
      List(d.EXE_AMOMAX_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOMINU ->
      List(d.EXE_AMOMINU_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable),// csr_read  csr_we

    ins.AMOMAXU ->
      List(d.EXE_AMOMAXU_W_OP, d.EXE_RES_LOAD_STORE, d.X,// aluop alusel ins
        d.WriteEnable, d.ReadEnable, d.ReadEnable,// wreg reg1 reg2
        d.ZeroWord,// imm
        io.reg1_o,// mem_addr
        d.ZeroWord, d.X, d.NotInDelaySlot, d.X,// jaddr jflag delay step
        d.X, d.X, d.X, d.X, d.X,// sys bre sret mret fence
        d.ReadDisable, d.CSRWriteDisable)// csr_read  csr_we
  )

   val controlSignals = ListLookup(io.inst_i, default, table)
   io.aluop_o     := controlSignals(0)
   io.alusel_o    := controlSignals(1)
   instvalid      := controlSignals(2)

   io.wreg_o      := controlSignals(3)

   io.reg1_read_o := controlSignals(4)
   io.reg2_read_o := controlSignals(5)

   imm            := controlSignals(6)

   io.mem_addr_o  := controlSignals(7)

   io.branch_target_address_o  := controlSignals(8)
   io.branch_flag_o            := controlSignals(9)
   io.next_inst_in_delayslot_o := controlSignals(10)
   io.step_o                   := controlSignals(11)

   excepttype_is_syscall := controlSignals(12)
   excepttype_is_break   := controlSignals(13)
   excepttype_is_sret    := controlSignals(14)
   excepttype_is_mret    := controlSignals(15)
   excepttype_is_fence_i := controlSignals(16)

   io.csr_reg_read_o := controlSignals(17)
   io.csr_reg_we_o   := controlSignals(18)
 }

  // opr1
  stallreq_for_reg1_loadrelate := d.NoStop
  when(io.rst_n === d.RstEnable){
    io.reg1_o := d.ZeroWord
  }.elsewhen(io.reg1_read_o === true.B && io.reg1_addr_o === d.ZeroRegAddr){
    io.reg1_o := d.ZeroWord
  }.elsewhen(io.reg1_read_o === true.B && pre_inst_is_load === true.B && io.ex_wreg_i === true.B && io.ex_wd_i === io.reg1_addr_o){
    stallreq_for_reg1_loadrelate := d.Stop
    io.reg1_o := d.ZeroWord
  }.elsewhen(io.reg1_read_o === true.B && io.ex_wreg_i === true.B && io.ex_wd_i === io.reg1_addr_o){
    io.reg1_o := io.ex_wdata_i
  }.elsewhen(io.reg1_read_o === true.B && io.mem_wreg_i === true.B && io.mem_wd_i === io.reg1_addr_o){
    io.reg1_o := io.mem_wdata_i
  }.elsewhen(io.reg1_read_o === true.B){
    io.reg1_o := io.reg1_data_i
  }.elsewhen(io.reg1_read_o === false.B){
    io.reg1_o := imm
  }.otherwise{
    io.reg1_o := d.ZeroWord
  }

  // opr2
  stallreq_for_reg2_loadrelate := d.NoStop
  when(io.rst_n === d.RstEnable){
    io.reg2_o := d.ZeroWord
  }.elsewhen(io.reg2_read_o === true.B && io.reg2_addr_o === d.ZeroRegAddr){
    io.reg2_o := d.ZeroWord
  }.elsewhen(io.reg2_read_o === true.B && pre_inst_is_load === true.B && io.ex_wreg_i === true.B && io.ex_wd_i === io.reg2_addr_o){
    stallreq_for_reg2_loadrelate := d.Stop
    io.reg2_o := d.ZeroWord
  }.elsewhen(io.reg2_read_o === true.B && io.ex_wreg_i === true.B && io.ex_wd_i === io.reg2_addr_o){
    io.reg2_o := io.ex_wdata_i
  }.elsewhen(io.reg2_read_o === true.B && io.mem_wreg_i === true.B && io.mem_wd_i === io.reg2_addr_o){
    io.reg2_o := io.mem_wdata_i
  }.elsewhen(io.reg2_read_o === true.B){
    io.reg2_o := io.reg2_data_i
  }.elsewhen(io.reg2_read_o === false.B){
    io.reg2_o := imm
  }.otherwise{
    io.reg2_o := d.ZeroWord
  }

  // indelay
  when(io.rst_n === d.RstEnable){
    io.is_in_delayslot_o := d.NotInDelaySlot
  }.otherwise{
    io.is_in_delayslot_o := io.is_in_delayslot_i
  }
}



