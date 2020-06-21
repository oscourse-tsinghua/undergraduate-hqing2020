package CPU

import chisel3._
import chisel3.util._


object d {
  def X = false.B
  def N = false.B
  def Y = true.B

  //
  def numberOfRegisters = 32
  def halfnumberOfRegisters = 16
  def ZeroWord   = 0.U(32.W)
  def PhyZeroWord   = 0.U(34.W)
  def SCSucceed  = "h0".U(32.W)
  def SCFail     = "h1".U(32.W)
  def NOPRegAddr = "b00000".U(5.W)
  def ZeroRegAddr= "b00000".U(5.W)

  def RstEnable     = false.B
  def RstDisable    = true.B
  def WriteEnable   = true.B
  def WriteDisable  = false.B
  def ReadEnable    = true.B
  def ReadDisable   = false.B
  def ChipEnable    = true.B
  def ChipDisable   = false.B
  def Flush         = true.B
  def NoFlush       = false.B
  def InDelaySlot   = true.B
  def NotInDelaySlot= false.B
  def NoStop        = false.B
  def Stop          = true.B
  // op
  def EXE_NOP_OP = "b00000000".U(8.W)

  def EXE_ADD_OP = "b00100000".U(8.W)
  def EXE_SUB_OP = "b00100010".U(8.W)
  def EXE_SLT_OP = "b00101010".U(8.W)
  def EXE_SLTU_OP= "b00101011".U(8.W)

  def EXE_SLL_OP = "b01111100".U(8.W)
  def EXE_SRL_OP = "b00000010".U(8.W)
  def EXE_SRA_OP = "b00000011".U(8.W)

  def EXE_JAL_OP = "b01010000".U(8.W)

  def EXE_OR_OP  = "b00100101".U(8.W)
  def EXE_AND_OP = "b00100100".U(8.W)
  def EXE_XOR_OP = "b00100110".U(8.W)

  def EXE_MUL_OP    = "b00011000".U(8.W)
  def EXE_MULH_OP   = "b00011001".U(8.W)
  def EXE_MULHSU_OP = "b10101001".U(8.W)
  def EXE_MULHU_OP  = "b10100110".U(8.W)
  def EXE_DIV_OP  = "b00011010".U(8.W)
  def EXE_DIVU_OP = "b00011011".U(8.W)
  def EXE_REM_OP  = "b10101000".U(8.W)
  def EXE_REMU_OP = "b10101010".U(8.W)

  def EXE_LB_OP   = "b11100000".U(8.W)
  def EXE_LBU_OP  = "b11100100".U(8.W)
  def EXE_LH_OP   = "b11100001".U(8.W)
  def EXE_LHU_OP  = "b11100101".U(8.W)
  def EXE_LW_OP   = "b11100011".U(8.W)
  def EXE_LR_OP   = "b11110000".U(8.W)
  def EXE_SB_OP   = "b11101000".U(8.W)
  def EXE_SH_OP   = "b11101001".U(8.W)
  def EXE_SW_OP   = "b11101011".U(8.W)
  def EXE_SC_OP   = "b11111000".U(8.W)
  def EXE_AMOSWAP_W_OP  = "b01000001".U(8.W)
  def EXE_AMOADD_W_OP   = "b01000000".U(8.W)
  def EXE_AMOXOR_W_OP   = "b01000100".U(8.W)
  def EXE_AMOAND_W_OP   = "b01001100".U(8.W)
  def EXE_AMOOR_W_OP    = "b01001000".U(8.W)
  def EXE_AMOMIN_W_OP   = "b01110000".U(8.W)
  def EXE_AMOMAX_W_OP   = "b01010100".U(8.W)
  def EXE_AMOMINU_W_OP  = "b01111001".U(8.W)
  def EXE_AMOMAXU_W_OP  = "b01011100".U(8.W)

  def EXE_CSRRW_OP = "b01011000".U(8.W)
  def EXE_CSRRS_OP = "b01011001".U(8.W)
  def EXE_CSRRC_OP = "b01011010".U(8.W)

  // AluSel
  def EXE_RES_LOGIC       = "b001".U(3.W)
  def EXE_RES_SHIFT       = "b010".U(3.W)
  def EXE_RES_MOVE        = "b011".U(3.W)
  def EXE_RES_ARITHMETIC  = "b100".U(3.W)
  def EXE_RES_MUL         = "b101".U(3.W)
  def EXE_RES_JUMP_BRANCH = "b110".U(3.W)
  def EXE_RES_LOAD_STORE  = "b111".U(3.W)
  def EXE_RES_NOP         = "b000".U(3.W)

  // Privilege
  def PRV_M = "h3".U(2.W)
  def PRV_H = "h2".U(2.W)
  def PRV_S = "h1".U(2.W)
  def PRV_S_1 = "h1".U(2.W)
  def PRV_U = "h0".U(2.W)
  def PRV_U_1 = "h0".U(1.W)


  // exc type
  def Exception_INST_MISALIGNED     = 0.U
  def Exception_INST_ACCESS_FAULT   = 1.U
  def Exception_INST_ILLEGAL        = 2.U
  def Exception_BREAK               = 3.U
  def Exception_LOAD_MISALIGNED     = 4.U
  def Exception_LOAD_ACCESS_FAULT   = 5.U
  def Exception_STORE_MISALIGNED    = 6.U
  def Exception_STORE_ACCESS_FAULT  = 7.U
  def Exception_ECALL_FROM_U        = 8.U
  def Exception_ECALL_FROM_S        = 9.U
  def Exception_ECALL_FROM_H        = 10.U
  def Exception_ECALL_FROM_M        = 11.U
  def Exception_ERET_FROM_U         = 12.U
  def Exception_ERET_FROM_S         = 13.U
  def Exception_ERET_FROM_H         = 14.U
  def Exception_ERET_FROM_M         = 15.U
  def Exception_FENCEI              = 21.U

  // csr listing
  def CSRWriteDisable = false.B
  def CSRWrite        = true.B

  def CSR_sstatus     = "h100".U(12.W)
  def CSR_sie         = "h104".U(12.W)
  def CSR_stvec       = "h105".U(12.W)
  def CSR_sscratch    = "h140".U(12.W)
  def CSR_sepc        = "h141".U(12.W)
  def CSR_scause      = "h142".U(12.W)
  def CSR_sbadaddr    = "h143".U(12.W)
  def CSR_sip         = "h144".U(12.W)
  def CSR_sptbr       = "h180".U(12.W)
  def CSR_mstatus     = "h300".U(12.W)
  def CSR_misa        = "h301".U(12.W)
  def CSR_medeleg     = "h302".U(12.W)
  def CSR_mideleg     = "h303".U(12.W)
  def CSR_mie         = "h304".U(12.W)
  def CSR_mtvec       = "h305".U(12.W)
  def CSR_mucounteren = "h320".U(12.W)
  def CSR_mscounteren = "h321".U(12.W)
  def CSR_mscratch    = "h340".U(12.W)
  def CSR_mepc        = "h341".U(12.W)
  def CSR_mcause      = "h342".U(12.W)
  def CSR_mbadaddr    = "h343".U(12.W)
  def CSR_mip         = "h344".U(12.W)

  def CSR_mtlbindex   = "h7c0".U(12.W)
  def CSR_mtlbvpn     = "h7c1".U(12.W)
  def CSR_mtlbmask    = "h7c2".U(12.W)
  def CSR_mtlbpte     = "h7c3".U(12.W)
  def CSR_mtlbptevaddr= "h7c4".U(12.W)

  def CSR_mvendorid   = "hF11".U(12.W)
  def CSR_marchid     = "hF12".U(12.W)
  def CSR_mimpid      = "hF13".U(12.W)
  def CSR_mhartid     = "hF14".U(12.W)

  // mstatus
  def CSR_mstatus_vm_Mbare = "h0".U(5.W)
  def CSR_mstatus_vm_Sv32 = "h8".U(5.W)
}
