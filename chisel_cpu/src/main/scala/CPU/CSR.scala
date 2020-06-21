package CPU

import chisel3._
import chisel3.util._


class CSR_IO extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // CSR write port
  val we_i = Input(Bool())
  val waddr_i = Input(UInt(12.W))
  val data_i = Input(UInt(32.W))

  // CSR read port
  val re_i = Input(Bool())
  val will_write_in_mem_i = Input(Bool())
  val raddr_i = Input(UInt(12.W))
  val data_o = Output(UInt(32.W))
  val protect_o = Output(Bool())

  // MMU IO
  val inst_ce_i = Input(Bool())
  val inst_vir_addr_i = Input(UInt(32.W))
  val inst_phy_addr_o = Output(UInt(34.W))
  val inst_tlb_exception_o = Output(Bool())

  val data_ce_i = Input(Bool())
  val data_we_i = Input(Bool())
  val data_vir_addr_i = Input(UInt(32.W))
  val data_phy_addr_o = Output(UInt(34.W))
  val data_tlb_exception_o = Output(Bool())

  // exc
  val excepttype_i = Input(UInt(32.W))

  // Interrupt source
  val timer_int_i = Input(Bool())
  val external_int_i = Input(Bool())
  val software_int_i = Input(Bool())

  // inst vaddr & data vaddr
  val current_inst_addr_i = Input(UInt(32.W))
  val current_data_addr_i = Input(UInt(32.W))

  val not_stall_i = Input(Bool())

  // delatslot(TODO: FIXME)
  val is_in_delayslot_i = Input(Bool())

  // next pc for excpetion
  val flushreq = Output(Bool())
  val exception_new_pc_o = Output(UInt(32.W))
  val prv_o = Output(UInt(2.W))


}

class CSR extends Module{
  val io = IO(new CSR_IO)

  /*******************************************************************************/
  val misa = Reg(UInt(32.W))
  misa := Cat("b010000".U(6.W), "h0141101".U(26.W))

  val mvendorid = RegInit(UInt(32.W), d.ZeroWord)
  val marchid   = RegInit(UInt(32.W), d.ZeroWord)
  val mimpid    = RegInit(UInt(32.W), d.ZeroWord)
  val mhartid   = RegInit(UInt(32.W), d.ZeroWord)

  val mstatus_vm    = Reg(UInt(5.W))
  val mstatus_mxr   = Reg(UInt(1.W))
  val mstatus_mprv  = Reg(UInt(1.W))
  val mstatus_fs    = Reg(UInt(2.W))
  val mstatus_sd    = RegInit(UInt(1.W),(mstatus_fs === "h3".U(2.W)).asUInt)
  val mstatus_mpp   = Reg(UInt(2.W))
  val mstatus_spp   = Reg(UInt(1.W))
  val mstatus_mpie  = Reg(UInt(1.W))
  val mstatus_spie  = Reg(UInt(1.W))
  val mstatus_mie   = Reg(UInt(1.W))
  val mstatus_sie   = Reg(UInt(1.W))
  val mstatus_uie   = RegInit(UInt(1.W),0.U(1.W))

  val mip_mtip   = RegInit(UInt(1.W),io.timer_int_i.asUInt)
  val mip_stip   = Reg(UInt(1.W))
  val mie_mtie   = Reg(UInt(1.W))
  val mie_stie   = Reg(UInt(1.W))
  val mip_msip   = RegInit(UInt(1.W),io.software_int_i.asUInt)
  val mip_ssip   = Reg(UInt(1.W))
  val mie_msie   = Reg(UInt(1.W))
  val mie_ssie   = Reg(UInt(1.W))
  val mip_meip   = RegInit(UInt(1.W),io.external_int_i.asUInt)
  val mie_meie   = Reg(UInt(1.W))

  val mucounteren_tm   = Reg(UInt(1.W))
  val mscounteren_tm   = Reg(UInt(1.W))

  val mscratch    = Reg(UInt(32.W))
  val mepc_addr   = Reg(UInt(30.W))//31:2

  val mtvec_addr  = Reg(UInt(30.W))//31:2
  val medeleg     = Reg(UInt(12.W))//11:0
  val mideleg     = Reg(UInt(12.W))//11:0

  val mcause_intr = Reg(UInt(1.W))//31:31
  val mcause_code = Reg(UInt(4.W))//3:0
  val mbadaddr    = Reg(UInt(32.W))

  val stvec_addr  = Reg(UInt(30.W))//31:2
  val sscratch    = Reg(UInt(32.W))
  val sepc_addr   = Reg(UInt(30.W))//31:2
  val scause_intr = Reg(UInt(1.W))//31:31
  val scause_code = Reg(UInt(4.W))//3:0
  val sbadaddr    = Reg(UInt(32.W))

  val sptbr_ppn   = Reg(UInt(22.W))//21:0

  val mtlbindex         = Reg(UInt(4.W))//3:0
  val mtlbindex_update  = Reg(UInt(1.W))//31:31
  val mtlbvpn       = Mem(16, UInt(32.W))
  val mtlbmask      = Mem(16, UInt(32.W))
  val mtlbpte       = Mem(16, UInt(32.W))
  val mtlbptevaddr  = Mem(16, UInt(32.W))

  val inst_tlb_index     = Reg(UInt(4.W))
  val inst_tlb_update    = Reg(UInt(1.W))
  val inst_tlb_exception = Reg(UInt(1.W))
  val data_tlb_index     = Reg(UInt(4.W))
  val data_tlb_update    = Reg(UInt(1.W))
  val data_tlb_exception = Reg(UInt(1.W))

  val m_intr_globally_enabled = ((
    io.not_stall_i === true.B)
    && ((io.prv_o < "h3".U(2.W)) || (io.prv_o === "h3".U(2.W) && mstatus_mie === 1.U))
    ).asUInt

  val s_intr_globally_enabled = ((
    io.not_stall_i === true.B)
    && ((io.prv_o < "h1".U(2.W)) || (io.prv_o === "h1".U(2.W) && mstatus_sie === 1.U))
    ).asUInt


  val m_mtime_intr = mip_mtip & mie_mtie & m_intr_globally_enabled.asUInt & (~mideleg(7)).asUInt
  val m_msoft_intr = mip_msip & mie_msie & m_intr_globally_enabled.asUInt & (~mideleg(3)).asUInt
  val m_mextr_intr = mip_meip & mie_meie & m_intr_globally_enabled.asUInt & (~mideleg(11)).asUInt
  val m_stime_intr = mip_stip & mie_stie & m_intr_globally_enabled.asUInt & (~mideleg(5)).asUInt
  val m_ssoft_intr = mip_ssip & mie_ssie & m_intr_globally_enabled.asUInt & (~mideleg(1)).asUInt

  val m_intr = m_mtime_intr | m_msoft_intr | m_mextr_intr | m_stime_intr | m_ssoft_intr

  val s_mtime_intr = mip_mtip & mie_mtie & s_intr_globally_enabled.asUInt & mideleg(7)
  val s_msoft_intr = mip_msip & mie_msie & s_intr_globally_enabled.asUInt & mideleg(3)
  val s_mextr_intr = mip_meip & mie_meie & s_intr_globally_enabled.asUInt & mideleg(11)
  val s_stime_intr = mip_stip & mie_stie & s_intr_globally_enabled.asUInt & mideleg(5)
  val s_ssoft_intr = mip_ssip & mie_ssie & s_intr_globally_enabled.asUInt & mideleg(1)

  val s_intr = s_mtime_intr | s_msoft_intr | s_mextr_intr | s_stime_intr | s_ssoft_intr

  val m_inst_misaligned_trap    = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_INST_MISALIGNED)    & (~medeleg(0)).asUInt).asUInt

  val m_inst_access_fault_trap  = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_INST_ACCESS_FAULT)  & (~medeleg(1)).asUInt).asUInt

  val m_inst_illegal_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_INST_ILLEGAL)       & (~medeleg(2)).asUInt).asUInt

  val m_break_trap              = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_BREAK)              & (~medeleg(3)).asUInt).asUInt

  val m_load_misaligned_trap    = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_LOAD_MISALIGNED)    & (~medeleg(4)).asUInt).asUInt

  val m_load_access_fault_trap  = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_LOAD_ACCESS_FAULT)  & (~medeleg(5)).asUInt).asUInt

  val m_store_misaligned_trap   = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_STORE_MISALIGNED)   & (~medeleg(6)).asUInt).asUInt

  val m_store_access_fault_trap = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_STORE_ACCESS_FAULT) & (~medeleg(7)).asUInt).asUInt

  val m_ecall_from_u_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ECALL_FROM_U)       & (~medeleg(8)).asUInt).asUInt

  val m_ecall_from_s_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ECALL_FROM_S)       & (~medeleg(9)).asUInt).asUInt

  val m_ecall_from_m_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ECALL_FROM_M)).asUInt

  val m_trap =
      m_inst_misaligned_trap |
      m_inst_access_fault_trap |
      m_inst_illegal_trap |
      m_break_trap |
      m_load_misaligned_trap |
      m_load_access_fault_trap |
      m_store_misaligned_trap |
      m_store_access_fault_trap |
      m_ecall_from_u_trap |
      m_ecall_from_s_trap |
      m_ecall_from_m_trap

  val eret_from_m_trap = (io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ERET_FROM_M)
  val eret_from_s_trap = (io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ERET_FROM_S)
  val fence_i_trap     = (io.not_stall_i).asUInt & io.excepttype_i(d.Exception_FENCEI)

  val s_inst_misaligned_trap    = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_INST_MISALIGNED)    & medeleg(0)).asUInt

  val s_inst_access_fault_trap  = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_INST_ACCESS_FAULT)  & medeleg(1)).asUInt

  val s_inst_illegal_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_INST_ILLEGAL)       & medeleg(2)).asUInt

  val s_break_trap              = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_BREAK)              & medeleg(3)).asUInt

  val s_load_misaligned_trap    = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_LOAD_MISALIGNED)    & medeleg(4)).asUInt

  val s_load_access_fault_trap  = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_LOAD_ACCESS_FAULT)  & medeleg(5)).asUInt

  val s_store_misaligned_trap   = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_STORE_MISALIGNED)   & medeleg(6)).asUInt

  val s_store_access_fault_trap = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_STORE_ACCESS_FAULT) & medeleg(7)).asUInt

  val s_ecall_from_u_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ECALL_FROM_U)       & medeleg(8)).asUInt

  val s_ecall_from_s_trap       = ((io.not_stall_i).asUInt & io.excepttype_i(d.Exception_ECALL_FROM_S)       & medeleg(9)).asUInt

  val s_trap =
      s_inst_misaligned_trap |
      s_inst_access_fault_trap |
      s_inst_illegal_trap |
      s_break_trap |
      s_load_misaligned_trap |
      s_load_access_fault_trap |
      s_store_misaligned_trap |
      s_store_access_fault_trap |
      s_ecall_from_u_trap |
      s_ecall_from_s_trap

  io.data_tlb_exception_o := data_tlb_exception
  io.inst_tlb_exception_o := inst_tlb_exception
  /*******************************************************************************/

  /* privilege transfer */
  val next_prv = Reg(UInt(2.W))
  val pro_x = Reg(UInt(2.W))
  pro_x := io.prv_o
  io.flushreq := false.B
  io.exception_new_pc_o := d.ZeroWord
  next_prv := d.PRV_M

  next_prv := pro_x
  when(io.not_stall_i === true.B){
    when(m_intr.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := Cat(mtvec_addr, 0.U(1.W))
      next_prv := d.PRV_M
    }.elsewhen(s_intr.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := Cat(stvec_addr, 0.U(1.W))
      next_prv := d.PRV_S
    }.elsewhen(m_trap.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := Cat(mtvec_addr, 0.U(1.W))
      next_prv := d.PRV_M
    }.elsewhen(s_trap.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := Cat(stvec_addr, 0.U(1.W))
      next_prv := d.PRV_S
    }.elsewhen(eret_from_s_trap.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := Cat(sepc_addr, 0.U(1.W))
      switch(mstatus_spp){
        is(d.PRV_U) {next_prv := d.PRV_U}
        is(d.PRV_S) {next_prv := d.PRV_S}
      }
    }.elsewhen(eret_from_m_trap.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := Cat(mepc_addr, 0.U(1.W))
      switch(mstatus_mpp){
        is(d.PRV_U) {next_prv := d.PRV_U}
        is(d.PRV_S) {next_prv := d.PRV_S}
        is(d.PRV_M) {next_prv := d.PRV_M}
      }
    }.elsewhen(fence_i_trap.asBool){
      io.flushreq := true.B
      io.exception_new_pc_o := io.current_inst_addr_i + "d4".U(4.W)
    }
  }

  // write & modify CSR
  // rst
 when(io.rst_n === d.RstEnable){
  mstatus_vm   := 0.U//"h0".U(5.W)
  mstatus_mxr  := 0.U
  mstatus_mprv := 0.U
  mstatus_fs   := 0.U//"h0".U(2.W)
  mstatus_mpp  := d.PRV_U
  mstatus_spp  := d.PRV_U
  mstatus_mpie := 0.U
  mstatus_spie := 0.U
  mstatus_mie  := 0.U
  mstatus_sie  := 0.U

  mip_stip     := 0.U
  mie_mtie     := 0.U
  mie_stie     := 0.U
  mip_ssip     := 0.U
  mie_msie     := 0.U
  mie_ssie     := 0.U
  mie_meie     := 0.U

  mucounteren_tm := 0.U
  mscounteren_tm := 0.U

  mscratch    := d.ZeroWord
  mepc_addr   := d.ZeroWord

  mtvec_addr  := d.ZeroWord
  medeleg     := d.ZeroWord
  mideleg     := d.ZeroWord

  mcause_intr := 0.U
  mcause_code := d.ZeroWord

  mbadaddr    := d.ZeroWord

  stvec_addr  := d.ZeroWord
  sscratch    := d.ZeroWord
  sepc_addr   := d.ZeroWord
  scause_intr := 0.U
  scause_code := d.ZeroWord
  sbadaddr    := d.ZeroWord

  sptbr_ppn   := d.ZeroWord
  mtlbindex   := d.ZeroWord
  mtlbindex_update := 0.U
  mtlbvpn(0)  := d.ZeroWord; mtlbmask(0)  := d.ZeroWord; mtlbpte(0)  := d.ZeroWord; mtlbptevaddr(0)  := d.ZeroWord;
  mtlbvpn(1)  := d.ZeroWord; mtlbmask(1)  := d.ZeroWord; mtlbpte(1)  := d.ZeroWord; mtlbptevaddr(1)  := d.ZeroWord;
  mtlbvpn(2)  := d.ZeroWord; mtlbmask(2)  := d.ZeroWord; mtlbpte(2)  := d.ZeroWord; mtlbptevaddr(2)  := d.ZeroWord;
  mtlbvpn(3)  := d.ZeroWord; mtlbmask(3)  := d.ZeroWord; mtlbpte(3)  := d.ZeroWord; mtlbptevaddr(3)  := d.ZeroWord;
  mtlbvpn(4)  := d.ZeroWord; mtlbmask(4)  := d.ZeroWord; mtlbpte(4)  := d.ZeroWord; mtlbptevaddr(4)  := d.ZeroWord;
  mtlbvpn(5)  := d.ZeroWord; mtlbmask(5)  := d.ZeroWord; mtlbpte(5)  := d.ZeroWord; mtlbptevaddr(5)  := d.ZeroWord;
  mtlbvpn(6)  := d.ZeroWord; mtlbmask(6)  := d.ZeroWord; mtlbpte(6)  := d.ZeroWord; mtlbptevaddr(6)  := d.ZeroWord;
  mtlbvpn(7)  := d.ZeroWord; mtlbmask(7)  := d.ZeroWord; mtlbpte(7)  := d.ZeroWord; mtlbptevaddr(7)  := d.ZeroWord;
  mtlbvpn(8)  := d.ZeroWord; mtlbmask(8)  := d.ZeroWord; mtlbpte(8)  := d.ZeroWord; mtlbptevaddr(8)  := d.ZeroWord;
  mtlbvpn(9)  := d.ZeroWord; mtlbmask(9)  := d.ZeroWord; mtlbpte(9)  := d.ZeroWord; mtlbptevaddr(9)  := d.ZeroWord;
  mtlbvpn(10) := d.ZeroWord; mtlbmask(10) := d.ZeroWord; mtlbpte(10) := d.ZeroWord; mtlbptevaddr(10) := d.ZeroWord;
  mtlbvpn(11) := d.ZeroWord; mtlbmask(11) := d.ZeroWord; mtlbpte(11) := d.ZeroWord; mtlbptevaddr(11) := d.ZeroWord;
  mtlbvpn(12) := d.ZeroWord; mtlbmask(12) := d.ZeroWord; mtlbpte(12) := d.ZeroWord; mtlbptevaddr(12) := d.ZeroWord;
  mtlbvpn(13) := d.ZeroWord; mtlbmask(13) := d.ZeroWord; mtlbpte(13) := d.ZeroWord; mtlbptevaddr(13) := d.ZeroWord;
  mtlbvpn(14) := d.ZeroWord; mtlbmask(14) := d.ZeroWord; mtlbpte(14) := d.ZeroWord; mtlbptevaddr(14) := d.ZeroWord;
  mtlbvpn(15) := d.ZeroWord; mtlbmask(15) := d.ZeroWord; mtlbpte(15) := d.ZeroWord; mtlbptevaddr(15) := d.ZeroWord;

  io.prv_o := d.PRV_M
 }.otherwise{
   // not rst
   when(!io.not_stall_i){
     // blank
   }.elsewhen(m_intr.asBool){
     mepc_addr := io.current_inst_addr_i(31,2)

     when(m_ssoft_intr.asBool){
       mcause_intr := "b1".U(1.W)
       mcause_code := "d1".U(4.W)
     }.elsewhen(m_msoft_intr.asBool){
       mcause_intr := "b1".U(1.W)
       mcause_code := "d3".U(4.W)
     }.elsewhen(m_stime_intr.asBool){
       mcause_intr := "b1".U(1.W)
       mcause_code := "d5".U(4.W)
     }.elsewhen(m_mtime_intr.asBool){
       mcause_intr := "b1".U(1.W)
       mcause_code := "d7".U(4.W)
     }.elsewhen(m_mextr_intr.asBool){
       mcause_intr := "b1".U(1.W)
       mcause_code := "d11".U(4.W)
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_mpie := mstatus_uie}
       is(d.PRV_S){mstatus_mpie := mstatus_sie}
       is(d.PRV_M){mstatus_mpie := mstatus_mie}
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_mpp := d.PRV_U}
       is(d.PRV_S){mstatus_mpp := d.PRV_S}
       is(d.PRV_M){mstatus_mpp := d.PRV_M}
     }

     mstatus_mie := 0.U

   }.elsewhen(s_intr.asBool){
     sepc_addr := io.current_inst_addr_i(31,2)

     when(s_ssoft_intr.asBool){
       scause_intr := "b1".U(1.W)
       scause_code := "d1".U(4.W)
     }.elsewhen(s_msoft_intr.asBool){
       scause_intr := "b1".U(1.W)
       scause_code := "d1".U(4.W)
     }.elsewhen(s_stime_intr.asBool){
       scause_intr := "b1".U(1.W)
       scause_code := "d5".U(4.W)
     }.elsewhen(s_mtime_intr.asBool){
       scause_intr := "b1".U(1.W)
       scause_code := "d5".U(4.W)
     }.elsewhen(s_mextr_intr.asBool){
       scause_intr := "b1".U(1.W)
       scause_code := "d5".U(4.W)
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_spie := mstatus_uie}
       is(d.PRV_S){mstatus_spie := mstatus_sie}
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_spp := d.PRV_U}
       is(d.PRV_S){mstatus_spp := d.PRV_S}
     }

     mstatus_sie := 0.U

   }.elsewhen(m_trap.asBool){
     mepc_addr := io.current_inst_addr_i(31,2)

     when(m_inst_misaligned_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d0".U(4.W)
       mbadaddr := io.current_inst_addr_i
     }.elsewhen(m_inst_access_fault_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d1".U(4.W)
       mbadaddr := io.current_inst_addr_i
     }.elsewhen(m_inst_illegal_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d2".U(4.W)
     }.elsewhen(m_break_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d3".U(4.W)
     }.elsewhen(m_load_misaligned_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d4".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(m_load_access_fault_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d5".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(m_store_misaligned_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d6".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(m_store_access_fault_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d7".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(m_ecall_from_u_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d8".U(4.W)
     }.elsewhen(m_ecall_from_s_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d9".U(4.W)
     }.elsewhen(m_ecall_from_m_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d11".U(4.W)
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_mpie := mstatus_uie}
       is(d.PRV_S){mstatus_mpie := mstatus_sie}
       is(d.PRV_M){mstatus_mpie := mstatus_mie}
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_mpp := d.PRV_U}
       is(d.PRV_S){mstatus_mpp := d.PRV_S}
       is(d.PRV_M){mstatus_mpp := d.PRV_M}
     }

     mstatus_mie := 0.U

   }.elsewhen(s_trap.asBool){
     sepc_addr := io.current_inst_addr_i(31,2)

     when(s_inst_misaligned_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d0".U(4.W)
       mbadaddr := io.current_inst_addr_i
     }.elsewhen(s_inst_access_fault_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d1".U(4.W)
       mbadaddr := io.current_inst_addr_i
     }.elsewhen(s_inst_illegal_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d2".U(4.W)
     }.elsewhen(s_break_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d3".U(4.W)
     }.elsewhen(s_load_misaligned_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d4".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(s_load_access_fault_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d5".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(s_store_misaligned_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d6".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(s_store_access_fault_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d7".U(4.W)
       mbadaddr := io.current_data_addr_i
     }.elsewhen(s_ecall_from_u_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d8".U(4.W)
     }.elsewhen(s_ecall_from_s_trap.asBool){
       mcause_intr := "b0".U(1.W)
       mcause_code := "d9".U(4.W)
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_spie := mstatus_uie}
       is(d.PRV_S){mstatus_spie := mstatus_sie}
     }

     switch(io.prv_o){
       is(d.PRV_U){mstatus_spp := d.PRV_U}
       is(d.PRV_S){mstatus_spp := d.PRV_S}
     }

     mstatus_sie := 0.U

   }.elsewhen(eret_from_s_trap.asBool){
     switch(mstatus_spp){
       is(d.PRV_U){
         mstatus_spie := 1.U
         mstatus_spp := d.PRV_U_1
       }

       is(d.PRV_S){
         mstatus_sie := mstatus_spie
         mstatus_spie := 1.U
         mstatus_spp := d.PRV_U_1
       }
     }
   }.elsewhen(eret_from_m_trap.asBool){
     switch(mstatus_mpp){
       is(d.PRV_U){
         mstatus_mpie := 1.U
         mstatus_mpp := d.PRV_U_1
       }

       is(d.PRV_S){
         mstatus_mie := mstatus_mpie
         mstatus_mpie := 1.U
         mstatus_mpp := d.PRV_U_1
       }

       is(d.PRV_M){
         mstatus_mie := mstatus_mpie
         mstatus_mpie := 1.U
         mstatus_mpp := d.PRV_U_1
       }
     }
   }.elsewhen(fence_i_trap.asBool){
     //null
   }.elsewhen(io.we_i === true.B){
     switch(io.waddr_i){
       is(d.CSR_mstatus){
         switch(io.data_i(28,24)){//CSR_mstatus_vm_bus
           is("h0".U(5.W), "h8".U(5.W)){//CSR_mstatus_vm_Mbare, CSR_mstatus_vm_Sv32
             mstatus_vm := io.data_i(28,24)
           }
         }

         mstatus_mxr := io.data_i(19)
         mstatus_mprv := io.data_i(17)
         mstatus_fs := io.data_i(14,13)

         switch(io.data_i(12,11)){//CSR_mstatus_mpp_bus
           is(d.PRV_M, d.PRV_S, d.PRV_U){
             mstatus_mpp := io.data_i(12,11)
           }
         }

         switch(Cat(0.U(1.W), io.data_i(8))){//CSR_mstatus_spp_bus
           is(d.PRV_S, d.PRV_U){
             mstatus_spp := io.data_i(8)
           }
         }

         mstatus_mpie := io.data_i(7)
         mstatus_spie := io.data_i(5)
         mstatus_mie  := io.data_i(3)
         mstatus_sie  := io.data_i(1)
       }

       is(d.CSR_mip){
         mip_stip := io.data_i(5)
         mip_ssip := io.data_i(1)
       }

       is(d.CSR_mie){
         mie_mtie := io.data_i(7)
         mie_stie := io.data_i(5)
         mie_msie := io.data_i(3)
         mie_ssie := io.data_i(1)
         mie_meie := io.data_i(11)
       }

       is(d.CSR_mscounteren) {mscounteren_tm := io.data_i(1)   }
       is(d.CSR_mucounteren) {mucounteren_tm := io.data_i(1)   }
       is(d.CSR_mscratch)    {mscratch       := io.data_i      }
       is(d.CSR_mepc)        {mepc_addr      := io.data_i(31,2)}
       is(d.CSR_mtvec)       {mtvec_addr     := io.data_i(31,2)}
       is(d.CSR_medeleg)     {medeleg        := io.data_i(11,0)}
       is(d.CSR_mideleg)     {mideleg        := io.data_i(11,0)}

       is(d.CSR_mcause){
         switch(Cat(io.data_i(31), io.data_i(3,0))){
           is(
             "b00000".U(5.W),// CSR_mcause_INST_MISALIGNED
             "b00001".U(5.W),// CSR_mcause_INST_ACCESS_FAULT
             "b00010".U(5.W),// CSR_mcause_INST_ILLEGAL
             "b00011".U(5.W),// CSR_mcause_BREAK
             "b00100".U(5.W),// CSR_mcause_LOAD_MISALIGNED
             "b00101".U(5.W),// CSR_mcause_LOAD_ACCESS_FAULT
             "b00110".U(5.W),// CSR_mcause_STORE_MISALIGNED
             "b00111".U(5.W),// CSR_mcause_STORE_ACCESS_FAULT
             "b01000".U(5.W),// CSR_mcause_ECALL_FROM_U
             "b01001".U(5.W),// CSR_mcause_ECALL_FROM_S
             "b01010".U(5.W),// CSR_mcause_ECALL_FROM_H
             "b01011".U(5.W),// CSR_mcause_ECALL_FROM_M
             "b10001".U(5.W),// CSR_mcause_IRQ_S_SOFT
             "b10011".U(5.W),// CSR_mcause_IRQ_M_SOFT
             "b10101".U(5.W),// CSR_mcause_IRQ_S_TIMER
             "b10111".U(5.W),// CSR_mcause_IRQ_M_TIMER
             "b11011".U(5.W)// CSR_mcause_IRQ_M_EXTERNAL
           ){
             mcause_intr := io.data_i(31)
             mcause_code := io.data_i(3,0)
           }
         }
       }

       is(d.CSR_mbadaddr){
         mbadaddr := io.data_i
       }

       is(d.CSR_sstatus){
         mstatus_fs := io.data_i(14,13)
         switch(Cat(0.U(1.W), io.data_i(8))){
           is(d.PRV_S, d.PRV_U){
             mstatus_spp := io.data_i(8)
           }
         }
         mstatus_spie := io.data_i(5)
         mstatus_sie  := io.data_i(1)
       }

       is(d.CSR_stvec){
         stvec_addr := io.data_i(31,2)
       }

       is(d.CSR_sip){
         mip_stip := io.data_i(5)
         mip_ssip := io.data_i(1)
       }

       is(d.CSR_sie){
         mie_stie := io.data_i(5)
         mie_ssie := io.data_i(1)
       }

       is(d.CSR_sscratch){
         sscratch := io.data_i
       }

       is(d.CSR_sepc){
         sepc_addr := io.data_i(31,2)
       }

       is(d.CSR_scause){
         switch(Cat(io.data_i(31), io.data_i(3,0))){
           is(
             "b00000".U(5.W),// CSR_scause_INST_MISALIGNED
             "b00001".U(5.W),// CSR_scause_INST_ACCESS_FAULT
             "b00010".U(5.W),// CSR_scause_INST_ILLEGAL
             "b00011".U(5.W),// CSR_scause_BREAK
             "b00100".U(5.W),// CSR_scause_LOAD_MISALIGNED
             "b00101".U(5.W),// CSR_scause_LOAD_ACCESS_FAULT
             "b00110".U(5.W),// CSR_scause_STORE_MISALIGNED
             "b00111".U(5.W),// CSR_scause_STORE_ACCESS_FAULT
             "b01000".U(5.W),// CSR_scause_ECALL_FROM_U
             "b01001".U(5.W),// CSR_scause_ECALL_FROM_S
             "b10001".U(5.W),// CSR_scause_IRQ_S_SOFT
             "b10101".U(5.W)// CSR_scause_IRQ_S_TIMER
           ){
             scause_intr := io.data_i(31)
             scause_code := io.data_i(3,0)
           }
         }
       }

       is(d.CSR_sbadaddr){
         sbadaddr := io.data_i
       }

       is(d.CSR_sptbr){
         sptbr_ppn := io.data_i(21,0)
         /*mtlbpte(0)(0) := 0.U(1.W)
         mtlbpte(1)(0) := 0.U(1.W)
         mtlbpte(2)(0) := 0.U(1.W)
         mtlbpte(3)(0) := 0.U(1.W)
         mtlbpte(4)(0) := 0.U(1.W)
         mtlbpte(5)(0) := 0.U(1.W)
         mtlbpte(6)(0) := 0.U(1.W)
         mtlbpte(7)(0) := 0.U(1.W)
         mtlbpte(8)(0) := 0.U(1.W)
         mtlbpte(9)(0) := 0.U(1.W)
         mtlbpte(10)(0) := 0.U(1.W)
         mtlbpte(11)(0) := 0.U(1.W)
         mtlbpte(12)(0) := 0.U(1.W)
         mtlbpte(13)(0) := 0.U(1.W)
         mtlbpte(14)(0) := 0.U(1.W)
         mtlbpte(15)(0) := 0.U(1.W)*/
       }

       is(d.CSR_mtlbindex){
         mtlbindex := io.data_i(3,0)
         mtlbindex_update := 0.U
       }

       is(d.CSR_mtlbvpn){
         mtlbvpn(mtlbindex) := io.data_i
       }

       is(d.CSR_mtlbmask){
         mtlbmask(mtlbindex) := io.data_i
       }

       is(d.CSR_mtlbpte){
         mtlbpte(mtlbindex) := io.data_i
       }

       is(d.CSR_mtlbptevaddr){
         mtlbptevaddr(mtlbindex) := io.data_i
       }
     }
   }

   when(data_tlb_update.asBool){
     mtlbindex := data_tlb_index
     mtlbindex_update := 1.U
   }.elsewhen(data_tlb_exception.asBool){
     mtlbindex_update := 0.U
   }.elsewhen(inst_tlb_update.asBool){
     mtlbindex := inst_tlb_index
     mtlbindex_update := 1.U
   }.elsewhen(inst_tlb_exception.asBool){
     mtlbindex_update := 0.U
   }

   io.prv_o := next_prv
 }

  // import mmu_conv0
  import CPU.mmu_conv
  val mmu_conv0 = Module(new mmu_conv)
  mmu_conv0.io.rst_n := io.rst_n
  mmu_conv0.io.tlb0_vpn_i  := mtlbvpn(0);  mmu_conv0.io.tlb0_pte_i  := mtlbpte(0);  mmu_conv0.io.tlb0_mask_i := mtlbmask(0);
  mmu_conv0.io.tlb1_vpn_i  := mtlbvpn(1);  mmu_conv0.io.tlb1_pte_i  := mtlbpte(1);  mmu_conv0.io.tlb1_mask_i := mtlbmask(1);
  mmu_conv0.io.tlb2_vpn_i  := mtlbvpn(2);  mmu_conv0.io.tlb2_pte_i  := mtlbpte(2);  mmu_conv0.io.tlb2_mask_i := mtlbmask(2);
  mmu_conv0.io.tlb3_vpn_i  := mtlbvpn(3);  mmu_conv0.io.tlb3_pte_i  := mtlbpte(3);  mmu_conv0.io.tlb3_mask_i := mtlbmask(3);
  mmu_conv0.io.tlb4_vpn_i  := mtlbvpn(4);  mmu_conv0.io.tlb4_pte_i  := mtlbpte(4);  mmu_conv0.io.tlb4_mask_i := mtlbmask(4);
  mmu_conv0.io.tlb5_vpn_i  := mtlbvpn(5);  mmu_conv0.io.tlb5_pte_i  := mtlbpte(5);  mmu_conv0.io.tlb5_mask_i := mtlbmask(5);
  mmu_conv0.io.tlb6_vpn_i  := mtlbvpn(6);  mmu_conv0.io.tlb6_pte_i  := mtlbpte(6);  mmu_conv0.io.tlb6_mask_i := mtlbmask(6);
  mmu_conv0.io.tlb7_vpn_i  := mtlbvpn(7);  mmu_conv0.io.tlb7_pte_i  := mtlbpte(7);  mmu_conv0.io.tlb7_mask_i := mtlbmask(7);
  mmu_conv0.io.tlb8_vpn_i  := mtlbvpn(8);  mmu_conv0.io.tlb8_pte_i  := mtlbpte(8);  mmu_conv0.io.tlb8_mask_i := mtlbmask(8);
  mmu_conv0.io.tlb9_vpn_i  := mtlbvpn(9);  mmu_conv0.io.tlb9_pte_i  := mtlbpte(9);  mmu_conv0.io.tlb9_mask_i := mtlbmask(9);
  mmu_conv0.io.tlb10_vpn_i := mtlbvpn(10); mmu_conv0.io.tlb10_pte_i := mtlbpte(10); mmu_conv0.io.tlb10_mask_i := mtlbmask(10);
  mmu_conv0.io.tlb11_vpn_i := mtlbvpn(11); mmu_conv0.io.tlb11_pte_i := mtlbpte(11); mmu_conv0.io.tlb11_mask_i := mtlbmask(11);
  mmu_conv0.io.tlb12_vpn_i := mtlbvpn(12); mmu_conv0.io.tlb12_pte_i := mtlbpte(12); mmu_conv0.io.tlb12_mask_i := mtlbmask(12);
  mmu_conv0.io.tlb13_vpn_i := mtlbvpn(13); mmu_conv0.io.tlb13_pte_i := mtlbpte(13); mmu_conv0.io.tlb13_mask_i := mtlbmask(13);
  mmu_conv0.io.tlb14_vpn_i := mtlbvpn(14); mmu_conv0.io.tlb14_pte_i := mtlbpte(14); mmu_conv0.io.tlb14_mask_i := mtlbmask(14);
  mmu_conv0.io.tlb15_vpn_i := mtlbvpn(15); mmu_conv0.io.tlb15_pte_i := mtlbpte(15); mmu_conv0.io.tlb15_mask_i := mtlbmask(15);

  mmu_conv0.io.vm_i := mstatus_vm
  mmu_conv0.io.prv_i := next_prv
  mmu_conv0.io.mxr_i := mstatus_mxr

  mmu_conv0.io.ce_i := io.inst_ce_i
  mmu_conv0.io.ex_i := true.B
  mmu_conv0.io.we_i := d.WriteDisable

  mmu_conv0.io.vir_addr_i := io.inst_vir_addr_i
  io.inst_phy_addr_o := mmu_conv0.io.phy_addr_o

  inst_tlb_exception := mmu_conv0.io.tlb_exception_o
  inst_tlb_update := mmu_conv0.io.tlb_update_o

  inst_tlb_index := mmu_conv0.io.hit_index_o

  // import mmu_conv1
  val mmu_conv1 = Module(new mmu_conv)
  mmu_conv1.io.rst_n := io.rst_n
  mmu_conv1.io.tlb0_vpn_i  := mtlbvpn(0);  mmu_conv1.io.tlb0_pte_i  := mtlbpte(0);  mmu_conv1.io.tlb0_mask_i := mtlbmask(0);
  mmu_conv1.io.tlb1_vpn_i  := mtlbvpn(1);  mmu_conv1.io.tlb1_pte_i  := mtlbpte(1);  mmu_conv1.io.tlb1_mask_i := mtlbmask(1);
  mmu_conv1.io.tlb2_vpn_i  := mtlbvpn(2);  mmu_conv1.io.tlb2_pte_i  := mtlbpte(2);  mmu_conv1.io.tlb2_mask_i := mtlbmask(2);
  mmu_conv1.io.tlb3_vpn_i  := mtlbvpn(3);  mmu_conv1.io.tlb3_pte_i  := mtlbpte(3);  mmu_conv1.io.tlb3_mask_i := mtlbmask(3);
  mmu_conv1.io.tlb4_vpn_i  := mtlbvpn(4);  mmu_conv1.io.tlb4_pte_i  := mtlbpte(4);  mmu_conv1.io.tlb4_mask_i := mtlbmask(4);
  mmu_conv1.io.tlb5_vpn_i  := mtlbvpn(5);  mmu_conv1.io.tlb5_pte_i  := mtlbpte(5);  mmu_conv1.io.tlb5_mask_i := mtlbmask(5);
  mmu_conv1.io.tlb6_vpn_i  := mtlbvpn(6);  mmu_conv1.io.tlb6_pte_i  := mtlbpte(6);  mmu_conv1.io.tlb6_mask_i := mtlbmask(6);
  mmu_conv1.io.tlb7_vpn_i  := mtlbvpn(7);  mmu_conv1.io.tlb7_pte_i  := mtlbpte(7);  mmu_conv1.io.tlb7_mask_i := mtlbmask(7);
  mmu_conv1.io.tlb8_vpn_i  := mtlbvpn(8);  mmu_conv1.io.tlb8_pte_i  := mtlbpte(8);  mmu_conv1.io.tlb8_mask_i := mtlbmask(8);
  mmu_conv1.io.tlb9_vpn_i  := mtlbvpn(9);  mmu_conv1.io.tlb9_pte_i  := mtlbpte(9);  mmu_conv1.io.tlb9_mask_i := mtlbmask(9);
  mmu_conv1.io.tlb10_vpn_i := mtlbvpn(10); mmu_conv1.io.tlb10_pte_i := mtlbpte(10); mmu_conv1.io.tlb10_mask_i := mtlbmask(10);
  mmu_conv1.io.tlb11_vpn_i := mtlbvpn(11); mmu_conv1.io.tlb11_pte_i := mtlbpte(11); mmu_conv1.io.tlb11_mask_i := mtlbmask(11);
  mmu_conv1.io.tlb12_vpn_i := mtlbvpn(12); mmu_conv1.io.tlb12_pte_i := mtlbpte(12); mmu_conv1.io.tlb12_mask_i := mtlbmask(12);
  mmu_conv1.io.tlb13_vpn_i := mtlbvpn(13); mmu_conv1.io.tlb13_pte_i := mtlbpte(13); mmu_conv1.io.tlb13_mask_i := mtlbmask(13);
  mmu_conv1.io.tlb14_vpn_i := mtlbvpn(14); mmu_conv1.io.tlb14_pte_i := mtlbpte(14); mmu_conv1.io.tlb14_mask_i := mtlbmask(14);
  mmu_conv1.io.tlb15_vpn_i := mtlbvpn(15); mmu_conv1.io.tlb15_pte_i := mtlbpte(15); mmu_conv1.io.tlb15_mask_i := mtlbmask(15);

  mmu_conv1.io.vm_i := mstatus_vm
  mmu_conv1.io.prv_i := Mux(mstatus_mprv === 1.U, mstatus_mpp, next_prv)
  mmu_conv1.io.mxr_i := mstatus_mxr.asBool

  mmu_conv1.io.ce_i := io.data_ce_i
  mmu_conv1.io.ex_i := false.B
  mmu_conv1.io.we_i := io.data_we_i
  mmu_conv1.io.vir_addr_i := io.data_vir_addr_i
  io.data_phy_addr_o := mmu_conv1.io.phy_addr_o

  data_tlb_exception := mmu_conv1.io.tlb_exception_o
  data_tlb_update := mmu_conv1.io.tlb_update_o

  data_tlb_index := mmu_conv1.io.hit_index_o



  // CSR protect
  when(io.rst_n === d.RstEnable){
    io.protect_o := 0.U
  }.elsewhen(io.re_i === d.ReadDisable && io.will_write_in_mem_i === d.CSRWriteDisable) {
    io.protect_o := 0.U
  }.elsewhen(io.prv_o < io.raddr_i(9,8)){
    io.protect_o := 1.U
  }.elsewhen(io.will_write_in_mem_i === d.CSRWrite && io.raddr_i(11,10) === "b11".U(2.W)){
    io.protect_o := 1.U
  }.otherwise{
    io.protect_o := 0.U

    switch(io.raddr_i){
      is(
        d.CSR_misa,

        d.CSR_mvendorid,
        d.CSR_marchid,
        d.CSR_mimpid,
        d.CSR_mhartid,

        d.CSR_mstatus,
        d.CSR_mtvec,
        d.CSR_medeleg,
        d.CSR_mideleg,
        d.CSR_mie,
        d.CSR_mip,
        d.CSR_mscounteren,
        d.CSR_mucounteren,
        d.CSR_mscratch,
        d.CSR_mepc,
        d.CSR_mcause,
        d.CSR_mbadaddr,

        d.CSR_sstatus,
        d.CSR_stvec,
        d.CSR_sip,
        d.CSR_sie,
        d.CSR_sscratch,
        d.CSR_sepc,
        d.CSR_scause,
        d.CSR_sbadaddr,
        d.CSR_sptbr,

        d.CSR_mtlbindex,
        d.CSR_mtlbvpn,
        d.CSR_mtlbmask,
        d.CSR_mtlbpte,
        d.CSR_mtlbptevaddr
      ){
        io.protect_o := 1.U
      }
    }
  }

  // CSR read
  when(io.rst_n === d.RstEnable){
    io.data_o := d.ZeroWord
  }.elsewhen(io.re_i === d.ReadDisable) {
    io.data_o := d.ZeroWord
  }.otherwise{
    io.data_o := d.ZeroWord

    switch(io.raddr_i){
      is(d.CSR_misa)      {io.data_o := misa}
      is(d.CSR_mvendorid) {io.data_o := mvendorid}
      is(d.CSR_marchid)   {io.data_o := marchid}
      is(d.CSR_mimpid)    {io.data_o := mimpid}
      is(d.CSR_mhartid)   {io.data_o := mhartid}

      is(d.CSR_mstatus) {
        io.data_o := Cat(Cat(Cat(Cat(Cat(mstatus_sd, 0.U(2.W)), Cat(mstatus_vm, 0.U(4.W))), Cat(Cat(mstatus_mxr, 0.U(1.W)), Cat(mstatus_mprv, 0.U(2.W)))), Cat(Cat(Cat(mstatus_fs, mstatus_mpp), Cat(0.U(1.W), mstatus_spp)), Cat(Cat(mstatus_mpie, 0.U(1.W)), Cat(mstatus_spie, 0.U(1.W))))), Cat(Cat(mstatus_mie, 0.U(1.W)), Cat(mstatus_sie, 0.U(1.W))))

        /*
        io.data_o(31)    := mstatus_sd    // CSR_mstatus_sd_bus
        io.data_o(28,24) := mstatus_vm    // CSR_mstatus_vm_bus
        io.data_o(19)    := mstatus_mxr   // CSR_mstatus_mxr_bus
        io.data_o(17)    := mstatus_mprv  // CSR_mstatus_mprv_bus
        io.data_o(14,13) := mstatus_fs    // CSR_mstatus_fs_bus
        io.data_o(12,11) := mstatus_mpp   // CSR_mstatus_mpp_bus
        io.data_o(8)     := mstatus_spp   // CSR_mstatus_spp_bus
        io.data_o(7)     := mstatus_mpie  // CSR_mstatus_mpie_bus
        io.data_o(5)     := mstatus_spie  // CSR_mstatus_spie_bus
        io.data_o(3)     := mstatus_mie   // CSR_mstatus_mie_bus
        io.data_o(1)     := mstatus_sie   // CSR_mstatus_sie_bus
        */
      }

      is(d.CSR_mtvec)  {io.data_o := Cat(mtvec_addr, 0.U(2.W))}
      is(d.CSR_medeleg){io.data_o := Cat(0.U(20.W),medeleg)}
      is(d.CSR_mideleg){io.data_o := Cat(0.U(20.W),mideleg)}

      is(d.CSR_mip){
        io.data_o := Cat(0.U(20.W),
          Cat(mip_meip,
            Cat(0.U(3.W),
              Cat(mip_mtip,
                Cat(0.U(1.W),
                  Cat(mip_stip,
                    Cat(0.U(1.W),
                      Cat(mip_msip,
                        Cat(0.U(1.W),
                          Cat(mip_ssip,
                            0.U(1.W)))))))))))
        /*io.data_o(11) := mip_meip // CSR_mip_meip_bus
        io.data_o(7)  := mip_mtip // CSR_mip_mtip_bus
        io.data_o(5)  := mip_stip // CSR_mip_stip_bus
        io.data_o(3)  := mip_msip // CSR_mip_msip_bus
        io.data_o(1)  := mip_ssip // CSR_mip_ssip_bus*/
      }

      is(d.CSR_mie){
        io.data_o := Cat(0.U(20.W),
          Cat(mie_meie,
            Cat(0.U(3.W),
              Cat(mie_mtie,
                Cat(0.U(1.W),
                  Cat(mie_stie,
                    Cat(0.U(1.W),
                      Cat(mie_msie,
                        Cat(0.U(1.W),
                          Cat(mie_ssie,
                            0.U(1.W)))))))))))
        /*io.data_o(11) := mie_meie // CSR_mie_meie_bus
        io.data_o(7)  := mie_mtie // CSR_mie_mtie_bus
        io.data_o(5)  := mie_stie // CSR_mie_stie_bus
        io.data_o(3)  := mie_msie // CSR_mie_msie_bus
        io.data_o(1)  := mie_ssie // CSR_mie_ssie_bus*/
      }

      is(d.CSR_mscounteren) {io.data_o := Cat(0.U(30.W),Cat(mscounteren_tm, 0.U(1.W)))}
      is(d.CSR_mucounteren) {io.data_o := Cat(0.U(30.W),Cat(mucounteren_tm, 0.U(1.W)))}
      is(d.CSR_mscratch)    {io.data_o := mscratch}
      is(d.CSR_mepc)        {io.data_o := Cat(mepc_addr, 0.U(2.W))}

      is(d.CSR_mcause){
        io.data_o := Cat(Cat(mcause_intr, 0.U(27.W)),mcause_code)
      }

      is(d.CSR_mbadaddr)    {io.data_o := mbadaddr}

      is(d.CSR_sstatus){
        io.data_o := Cat(Cat(Cat(mstatus_sd, 0.U(16.W)),
        Cat(mstatus_fs, 0.U(4.W))),
        Cat(Cat(Cat(mstatus_spp, 0.U(2.W)),
        Cat(mstatus_spie, 0.U(3.W))),
        Cat(mstatus_sie, 0.U(1.W))))
        /*io.data_o(31)    := mstatus_sd   // CSR_mstatus_sd_bus
        io.data_o(14,13) := mstatus_fs   // CSR_mstatus_fs_bus
        io.data_o(8)     := mstatus_spp  // CSR_mstatus_spp_bus
        io.data_o(5)     := mstatus_spie // CSR_mstatus_spie_bus
        io.data_o(1)     := mstatus_sie  // CSR_mstatus_sie_bus*/
      }

      is(d.CSR_stvec)    {io.data_o := Cat(stvec_addr, 0.U(2.W))}

      is(d.CSR_sip){
        io.data_o := Cat(0.U(25.W),
        Cat(Cat(mip_stip, 0.U(3.W)),
        Cat(mip_ssip, 0.U(1.W))))
        /*io.data_o(5) := mip_stip // CSR_mip_stip_bus
        io.data_o(1) := mip_ssip// CSR_mip_ssip_bus*/
      }

      is(d.CSR_sie){
        io.data_o := Cat(0.U(25.W),
          Cat(Cat(mie_stie, 0.U(3.W)),
            Cat(mie_ssie, 0.U(1.W))))
        /*io.data_o(5) := mie_stie // CSR_mie_stie_bus
        io.data_o(1) := mie_ssie // CSR_mie_ssie_bus*/
      }

      is(d.CSR_sscratch) {io.data_o := sscratch}
      is(d.CSR_sepc)     {io.data_o := Cat(sepc_addr, 0.U(2.W))}

      is(d.CSR_scause){
        io.data_o := Cat(Cat(scause_intr, 0.U(27.W)), scause_code)
        /*io.data_o(31)  := scause_intr // CSR_scause_intr_bus
        io.data_o(3,0) := scause_code // CSR_scause_code_bus*/
      }

      is(d.CSR_sbadaddr)  {io.data_o := sbadaddr}
      is(d.CSR_sptbr)     {io.data_o := Cat(0.U(9.W), sptbr_ppn)}

      is(d.CSR_mtlbindex){
        io.data_o := Cat(Cat(mtlbindex_update, 0.U(27.W)), mtlbindex)
        /*io.data_o(3,0)  := mtlbindex // CSR_mtlbindex_bus
        io.data_o(31)   := mtlbindex_update // CSR_mtlbindex_update_bus*/
      }

      is(d.CSR_mtlbvpn)          {io.data_o := mtlbvpn(mtlbindex)}
      is(d.CSR_mtlbmask)         {io.data_o := mtlbmask(mtlbindex)}
      is(d.CSR_mtlbpte)          {io.data_o := mtlbpte(mtlbindex)}
      is(d.CSR_mtlbptevaddr)     {io.data_o := mtlbptevaddr(mtlbindex)}
    }
  }
}
