package CPU

import chisel3._
import chisel3.util._
import chisel3.experimental.ChiselEnum

class PC_ADDR extends Bundle {
  val pc = Reg(UInt(32.W))
}

class PC_IO extends Bundle{
    val clk   = Input(Clock())
    val rst_n = Input(Bool())

    // from control
    val stall = Input(UInt(6.W))
    val flush = Input(Bool())
    val exception_new_pc = Input(UInt(32.W))

    // from decode
    val branch_flag_i = Input(Bool())
    val branch_target_address_i = Input(UInt(32.W))

    // TLB physical address
    val next_inst_phy_addr_i = Input(UInt(34.W))
    val next_inst_tlb_exception_i = Input(Bool())

    // CPU.PC
    val pc = Output(UInt(32.W))
    val inst_phy_addr_o = Output(UInt(34.W))

    // ins enable
    val ce = Output(Bool())

    // MMU query physical address
    val next_inst_vir_addr_o = Output(UInt(32.W))
    val pc_ce_o = Output(Bool())

    // exception
    val excepttype_o = Output(UInt(32.W))

}

class PC extends Module{
  val io = IO(new PC_IO)


  val npc_o = RegInit(UInt(32.W), "h1000".U(32.W) - 4.U)
  val pc_o  = RegInit(UInt(32.W), "h1000".U(32.W)- 4.U)
  val ce_o  = RegInit(Bool(), false.B)
  val inst_phy_addr_o = RegInit(UInt(32.W), d.ZeroWord)


  io.pc_ce_o := d.ChipEnable
  io.ce := ce_o
  io.inst_phy_addr_o := inst_phy_addr_o
  io.excepttype_o := d.ZeroWord
  io.pc := npc_o
  io.next_inst_vir_addr_o := "h1000".U(32.W)

  io.next_inst_vir_addr_o := npc_o

  npc_o := MuxCase(npc_o + 4.U,
    Array(
      (io.rst_n === d.RstEnable ) -> "h1000".U(32.W),
      (io.ce === d.ChipDisable) -> "h1000".U(32.W),
      (io.flush === d.Flush) -> io.exception_new_pc,
      (io.branch_flag_i === true.B)  -> io.branch_target_address_i
    ))


  val excepttype = VecInit(d.ZeroWord.asBools)
  when(io.rst_n === d.RstEnable){
    excepttype := d.ZeroWord.asBools
  }.otherwise{
    excepttype(0) := Mux(io.next_inst_vir_addr_o(1,0) =/= 0.U(2.W), 1.U, 0.U)
    excepttype(1) := io.next_inst_tlb_exception_i.asUInt
  }

  withClock(io.clk){
    when(io.rst_n === d.RstEnable){
      pc_o := "h1000".U(32.W)
      ce_o := d.ChipDisable
      inst_phy_addr_o := d.ZeroWord
      io.excepttype_o := d.ZeroWord

    }.elsewhen(io.flush === d.Flush){
      pc_o := npc_o
      ce_o := d.ChipEnable
      inst_phy_addr_o := io.next_inst_phy_addr_i
      io.excepttype_o := excepttype.asUInt

    }.elsewhen(io.stall(0) === d.NoStop){
      pc_o := npc_o
      ce_o := d.ChipEnable
      inst_phy_addr_o := io.next_inst_phy_addr_i
      io.excepttype_o := excepttype.asUInt
    }
  }




}
