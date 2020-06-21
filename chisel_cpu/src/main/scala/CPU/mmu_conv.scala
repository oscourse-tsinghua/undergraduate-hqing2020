package CPU

import chisel3._
import chisel3.util._

class mmu_conv_io extends Bundle{
  val rst_n = Input(Bool())

  val tlb0_vpn_i  = Input(UInt(32.W));val tlb0_mask_i  = Input(UInt(32.W));val tlb0_pte_i  = Input(UInt(32.W))
  val tlb1_vpn_i  = Input(UInt(32.W));val tlb1_mask_i  = Input(UInt(32.W));val tlb1_pte_i  = Input(UInt(32.W))
  val tlb2_vpn_i  = Input(UInt(32.W));val tlb2_mask_i  = Input(UInt(32.W));val tlb2_pte_i  = Input(UInt(32.W))
  val tlb3_vpn_i  = Input(UInt(32.W));val tlb3_mask_i  = Input(UInt(32.W));val tlb3_pte_i  = Input(UInt(32.W))
  val tlb4_vpn_i  = Input(UInt(32.W));val tlb4_mask_i  = Input(UInt(32.W));val tlb4_pte_i  = Input(UInt(32.W))
  val tlb5_vpn_i  = Input(UInt(32.W));val tlb5_mask_i  = Input(UInt(32.W));val tlb5_pte_i  = Input(UInt(32.W))
  val tlb6_vpn_i  = Input(UInt(32.W));val tlb6_mask_i  = Input(UInt(32.W));val tlb6_pte_i  = Input(UInt(32.W))
  val tlb7_vpn_i  = Input(UInt(32.W));val tlb7_mask_i  = Input(UInt(32.W));val tlb7_pte_i  = Input(UInt(32.W))
  val tlb8_vpn_i  = Input(UInt(32.W));val tlb8_mask_i  = Input(UInt(32.W));val tlb8_pte_i  = Input(UInt(32.W))
  val tlb9_vpn_i  = Input(UInt(32.W));val tlb9_mask_i  = Input(UInt(32.W));val tlb9_pte_i  = Input(UInt(32.W))
  val tlb10_vpn_i = Input(UInt(32.W));val tlb10_mask_i = Input(UInt(32.W));val tlb10_pte_i = Input(UInt(32.W))
  val tlb11_vpn_i = Input(UInt(32.W));val tlb11_mask_i = Input(UInt(32.W));val tlb11_pte_i = Input(UInt(32.W))
  val tlb12_vpn_i = Input(UInt(32.W));val tlb12_mask_i = Input(UInt(32.W));val tlb12_pte_i = Input(UInt(32.W))
  val tlb13_vpn_i = Input(UInt(32.W));val tlb13_mask_i = Input(UInt(32.W));val tlb13_pte_i = Input(UInt(32.W))
  val tlb14_vpn_i = Input(UInt(32.W));val tlb14_mask_i = Input(UInt(32.W));val tlb14_pte_i = Input(UInt(32.W))
  val tlb15_vpn_i = Input(UInt(32.W));val tlb15_mask_i = Input(UInt(32.W));val tlb15_pte_i = Input(UInt(32.W))

  val vm_i = Input(UInt(5.W))// 28,24
  val prv_i = Input(UInt(2.W))
  val mxr_i = Input(Bool())

  val ce_i = Input(Bool())
  val ex_i = Input(Bool())
  val we_i = Input(Bool())
  val vir_addr_i = Input(UInt(32.W))

  val phy_addr_o = Output(UInt(34.W))

  val tlb_exception_o = Output(Bool())
  val tlb_update_o = Output(Bool())

  val hit_index_o = Output(UInt(4.W))
}

class mmu_conv extends Module{
  val io = IO(new mmu_conv_io)

  /**TLB LIST***************************************************************************/
  val tlb_vpn  = Reg(Vec(d.halfnumberOfRegisters, UInt(32.W)))
  val tlb_pte  = Reg(Vec(d.halfnumberOfRegisters, UInt(32.W)))
  val tlb_mask = Reg(Vec(d.halfnumberOfRegisters, UInt(32.W)))

  tlb_vpn(0)  := io.tlb0_vpn_i
  tlb_vpn(1)  := io.tlb1_vpn_i
  tlb_vpn(2)  := io.tlb2_vpn_i
  tlb_vpn(3)  := io.tlb3_vpn_i
  tlb_vpn(4)  := io.tlb4_vpn_i
  tlb_vpn(5)  := io.tlb5_vpn_i
  tlb_vpn(6)  := io.tlb6_vpn_i
  tlb_vpn(7)  := io.tlb7_vpn_i
  tlb_vpn(8)  := io.tlb8_vpn_i
  tlb_vpn(9)  := io.tlb9_vpn_i
  tlb_vpn(10) := io.tlb10_vpn_i
  tlb_vpn(11) := io.tlb11_vpn_i
  tlb_vpn(12) := io.tlb12_vpn_i
  tlb_vpn(13) := io.tlb13_vpn_i
  tlb_vpn(14) := io.tlb14_vpn_i
  tlb_vpn(15) := io.tlb15_vpn_i

  tlb_mask(0)  := io.tlb0_mask_i
  tlb_mask(1)  := io.tlb1_mask_i
  tlb_mask(2)  := io.tlb2_mask_i
  tlb_mask(3)  := io.tlb3_mask_i
  tlb_mask(4)  := io.tlb4_mask_i
  tlb_mask(5)  := io.tlb5_mask_i
  tlb_mask(6)  := io.tlb6_mask_i
  tlb_mask(7)  := io.tlb7_mask_i
  tlb_mask(8)  := io.tlb8_mask_i
  tlb_mask(9)  := io.tlb9_mask_i
  tlb_mask(10) := io.tlb10_mask_i
  tlb_mask(11) := io.tlb11_mask_i
  tlb_mask(12) := io.tlb12_mask_i
  tlb_mask(13) := io.tlb13_mask_i
  tlb_mask(14) := io.tlb14_mask_i
  tlb_mask(15) := io.tlb15_mask_i

  tlb_pte(0)  := io.tlb0_pte_i
  tlb_pte(1)  := io.tlb1_pte_i
  tlb_pte(2)  := io.tlb2_pte_i
  tlb_pte(3)  := io.tlb3_pte_i
  tlb_pte(4)  := io.tlb4_pte_i
  tlb_pte(5)  := io.tlb5_pte_i
  tlb_pte(6)  := io.tlb6_pte_i
  tlb_pte(7)  := io.tlb7_pte_i
  tlb_pte(8)  := io.tlb8_pte_i
  tlb_pte(9)  := io.tlb9_pte_i
  tlb_pte(10) := io.tlb10_pte_i
  tlb_pte(11) := io.tlb11_pte_i
  tlb_pte(12) := io.tlb12_pte_i
  tlb_pte(13) := io.tlb13_pte_i
  tlb_pte(14) := io.tlb14_pte_i
  tlb_pte(15) := io.tlb15_pte_i

  // hit the target?
  val hit = VecInit(0.U(16.W).asBools)
  val protect_exception = VecInit(0.U(16.W).asBools)
  val update_exception = VecInit(0.U(16.W).asBools)
  val phy_addr = Reg(Vec(d.halfnumberOfRegisters, UInt(34.W)))

  for (i <- 0 until 16){
    when(io.vm_i === d.CSR_mstatus_vm_Mbare){
        hit(i) := false.B

    }.elsewhen(io.vm_i === d.CSR_mstatus_vm_Sv32){
      hit(i) := ((io.vir_addr_i & tlb_mask(i)) === (tlb_vpn(i) & tlb_mask(i)))

    }.otherwise{
      hit(i) := false.B
    }

    when(tlb_pte(i)(0) === 0.U){
      hit(i) := false.B
    }

    protect_exception(i) := !hit(i)

    when(io.ex_i){
      when(tlb_pte(i)(3) === 0.U) {protect_exception(i) := true.B}

    }.elsewhen(io.we_i === d.WriteEnable){
      when(tlb_pte(i)(2) === 0.U) {protect_exception(i) := true.B}
      when(tlb_pte(i)(1) === 0.U) {protect_exception(i) := true.B}

    }.otherwise{
      when(io.mxr_i){
        when(tlb_pte(i)(1) === 0.U && tlb_pte(i)(3) === 0.U){
          protect_exception(i) := true.B
        }
      }.otherwise{
        when(tlb_pte(i)(1) === 0.U){
          protect_exception(i) := true.B
        }
      }
    }

    update_exception(i) := !hit(i)
    when(tlb_pte(i)(6) === 0.U){
      update_exception(i) := true.B
    }
    when(io.we_i === d.WriteEnable && tlb_pte(i)(7) === 0.U){
      update_exception(i) := true.B
    }

    phy_addr(i) := (Cat(tlb_pte(i), 0.U(2.W)) & tlb_mask(i)) | (io.vir_addr_i & (~tlb_mask(i)).asUInt)
  }

  val tlb_miss_exception = Wire(Bool())
  val tlb_exception = Wire(Bool())

  tlb_miss_exception := Mux(hit.asUInt.orR === 1.U, false.B ,true.B)

  io.hit_index_o := "d0".U(4.W)
  when(hit(15)) {io.hit_index_o := "d15".U(4.W)}
  when(hit(14)) {io.hit_index_o := "d14".U(4.W)}
  when(hit(13)) {io.hit_index_o := "d13".U(4.W)}
  when(hit(12)) {io.hit_index_o := "d12".U(4.W)}
  when(hit(11)) {io.hit_index_o := "d11".U(4.W)}
  when(hit(10)) {io.hit_index_o := "d10".U(4.W)}
  when(hit(9))  {io.hit_index_o := "d9".U(4.W)}
  when(hit(8))  {io.hit_index_o := "d8".U(4.W)}
  when(hit(7))  {io.hit_index_o := "d7".U(4.W)}
  when(hit(6))  {io.hit_index_o := "d6".U(4.W)}
  when(hit(5))  {io.hit_index_o := "d5".U(4.W)}
  when(hit(4))  {io.hit_index_o := "d4".U(4.W)}
  when(hit(3))  {io.hit_index_o := "d3".U(4.W)}
  when(hit(2))  {io.hit_index_o := "d2".U(4.W)}
  when(hit(1))  {io.hit_index_o := "d1".U(4.W)}
  when(hit(0))  {io.hit_index_o := "d0".U(4.W)}

  tlb_exception := tlb_miss_exception | protect_exception(io.hit_index_o) | update_exception(io.hit_index_o)

  // phy address
  when(io.rst_n === d.RstEnable){
    io.phy_addr_o := d.ZeroWord
    io.tlb_exception_o := false.B
    io.tlb_update_o := false.B

  }.elsewhen(io.ce_i === d.ChipDisable){
    io.phy_addr_o := d.ZeroWord
    io.tlb_exception_o := false.B
    io.tlb_update_o := false.B

  }.elsewhen(io.prv_i === d.PRV_M || io.vm_i === d.CSR_mstatus_vm_Mbare){
    io.phy_addr_o := d.ZeroWord
    io.phy_addr_o := io.vir_addr_i

    io.tlb_exception_o := false.B
    io.tlb_update_o := false.B

  }.elsewhen(io.vm_i === d.CSR_mstatus_vm_Sv32){
    io.phy_addr_o := d.ZeroWord
    when(tlb_exception === false.B){
      io.phy_addr_o := phy_addr(io.hit_index_o)
    }
    io.tlb_exception_o := tlb_exception
    when(tlb_miss_exception.asBool){
      io.tlb_update_o := false.B
    }.otherwise{
      io.tlb_update_o := update_exception(io.hit_index_o)
    }

  }.otherwise{
    io.phy_addr_o := d.ZeroWord
    io.tlb_exception_o := false.B
    io.tlb_update_o := false.B

  }
}
