package CPU

import chisel3._
import chisel3.util._

class IMemory_IO extends Bundle {
  val rst_n = Input(Bool())

  // from ex
  val mem_phy_addr_i = Input(UInt(34.W))
  val data_tlb_r_exception_i = Input(Bool())
  val data_tlb_w_exception_i = Input(Bool())

  val wd_i = Input(UInt(5.W))
  val wreg_i = Input(Bool())
  val wdata_i = Input(UInt(32.W))
  val aluop_i = Input(UInt(8.W))
  val mem_addr_i = Input(UInt(32.W))
  val reg2_i = Input(UInt(32.W))

  // from mem
  val mem_data_i = Input(UInt(32.W))

  // llbit
  val LLbit_i = Input(Bool())
  val LLbit_addr_i = Input(UInt(34.W))

  //
  val stallreq_from_mem_i = Input(Bool())
  val cnt_i = Input(UInt(2.W))
  val original_data_i = Input(UInt(32.W))

  // csr
  val csr_reg_we_i = Input(Bool())
  val csr_reg_addr_i = Input(UInt(12.W))
  val csr_reg_data_i = Input(UInt(32.W))

  // exc
  val excepttype_i = Input(UInt(32.W))
  val is_in_delayslot_i = Input(Bool())
  val current_inst_address_i = Input(UInt(32.W))
  val not_stall_i = Input(Bool())

  //
  val wd_o = Output(UInt(5.W))
  val wreg_o = Output(Bool())
  val wdata_o = Output(UInt(32.W))

  val LLbit_we_o = Output(Bool())
  val LLbit_value_o = Output(Bool())
  val LLbit_addr_o = Output(UInt(34.W))

  val stallreq = Output(Bool())
  val cnt_o = Output(UInt(2.W))
  val original_data_o = Output(UInt(32.W))

  val csr_reg_we_o = Output(Bool())
  val csr_reg_addr_o = Output(UInt(12.W))
  val csr_reg_data_o = Output(UInt(32.W))

  val excepttype_o = Output(UInt(32.W))
  val is_in_delayslot_o = Output(Bool())

  val current_inst_address_o = Output(UInt(32.W))
  val current_data_address_o = Output(UInt(32.W))
  val not_stall_o = Output(Bool())

  val mem_addr_o = Output(UInt(32.W))
  val mem_phy_addr_o = Output(UInt(34.W))
  val mem_we_o = Output(Bool())
  val mem_sel_o = Output(UInt(4.W))
  val mem_data_o = Output(UInt(32.W))
  val mem_ce_o = Output(Bool())
}

class IMemory extends Module{
  val io = IO(new IMemory_IO)

  io.is_in_delayslot_o := io.is_in_delayslot_i
  io.current_inst_address_o := io.current_inst_address_i
  io.current_data_address_o := io.mem_addr_i
  io.stallreq := false.B

  val load_alignment_error = Reg(Bool())
  val load_access_error = Reg(Bool())
  val store_alignment_error = Reg(Bool())
  val store_access_error = Reg(Bool())

  val stallreq_from_amo = Reg(Bool())

  io.stallreq := io.stallreq_from_mem_i | stallreq_from_amo

  val wd_o = RegInit(UInt(5.W), d.NOPRegAddr)
  val wreg_o = RegInit(Bool(), d.WriteDisable)
  val wdata_o = RegInit(UInt(32.W), d.ZeroWord)

  val csr_reg_we_o = RegInit(Bool(), d.CSRWriteDisable)
  val csr_reg_addr_o = RegInit(UInt(5.W), d.NOPRegAddr)
  val csr_reg_data_o = RegInit(UInt(32.W), d.ZeroWord)

  val mem_addr_o = RegInit(UInt(32.W), d.ZeroWord)
  val mem_phy_addr_o = RegInit(UInt(34.W), d.ZeroWord)
  val mem_we_o = RegInit(Bool(), d.WriteDisable)
  val mem_sel_o = RegInit(UInt(4.W), 0.U(4.W))
  val mem_data_o = RegInit(UInt(32.W), d.ZeroWord)
  val mem_ce_o = RegInit(Bool(), d.ChipDisable)

  val LLbit_we_o = RegInit(Bool(), d.WriteDisable)
  val LLbit_addr_o = RegInit(UInt(34.W), d.ZeroWord)
  val LLbit_value_o = RegInit(Bool(), false.B)

  val cnt_o = RegInit(UInt(2.W), 0.U(2.W))
  val original_data_o = RegInit(UInt(32.W), d.ZeroWord)


  io.wd_o := d.NOPRegAddr
  io.wreg_o := d.WriteDisable
  io.wdata_o := d.ZeroWord

  io.csr_reg_we_o := d.CSRWriteDisable
  io.csr_reg_addr_o := d.NOPRegAddr
  io.csr_reg_data_o := d.ZeroWord

  io.mem_addr_o := d.ZeroWord
  io.mem_phy_addr_o := d.ZeroWord
  io.mem_we_o := d.WriteDisable
  io.mem_sel_o := 0.U(4.W)
  io.mem_data_o := d.ZeroWord
  io.mem_ce_o := d.ChipDisable

  io.LLbit_we_o := d.WriteDisable
  io.LLbit_addr_o := d.ZeroWord
  io.LLbit_value_o := false.B

  io.cnt_o := 0.U(2.W)
  io.original_data_o := d.ZeroWord

when(io.rst_n === d.RstEnable){
  wd_o := d.NOPRegAddr
  wreg_o := d.WriteDisable
  wdata_o := d.ZeroWord

  csr_reg_we_o := d.CSRWriteDisable
  csr_reg_addr_o := d.NOPRegAddr
  csr_reg_data_o := d.ZeroWord

  mem_addr_o := d.ZeroWord
  mem_phy_addr_o := d.ZeroWord
  mem_we_o := d.WriteDisable
  mem_sel_o := 0.U(4.W)
  mem_data_o := d.ZeroWord
  mem_ce_o := d.ChipDisable

  LLbit_we_o := d.WriteDisable
  LLbit_addr_o := d.ZeroWord
  LLbit_value_o := false.B

  cnt_o := 0.U(2.W)
  original_data_o := d.ZeroWord

  load_alignment_error := false.B
  load_access_error := false.B
  store_alignment_error := false.B
  store_access_error := false.B

  stallreq_from_amo := false.B

}.otherwise{
  wd_o := io.wd_i
  wreg_o := io.wreg_i
  wdata_o := io.wdata_i

  csr_reg_we_o := d.CSRWriteDisable
  csr_reg_addr_o := d.NOPRegAddr
  csr_reg_data_o := d.ZeroWord

  mem_addr_o := d.ZeroWord
  mem_phy_addr_o := d.ZeroWord
  mem_we_o := d.WriteDisable
  mem_sel_o := "b1111".U(4.W)
  mem_data_o := d.ZeroWord
  mem_ce_o := d.ChipDisable

  LLbit_we_o := d.WriteDisable
  LLbit_addr_o := d.ZeroWord
  LLbit_value_o := false.B

  cnt_o := 0.U(2.W)
  original_data_o := d.ZeroWord

  load_alignment_error := false.B
  load_access_error := false.B
  store_alignment_error := false.B
  store_access_error := false.B

  stallreq_from_amo := false.B

    when(io.aluop_i === d.EXE_LB_OP){
      when(io.data_tlb_r_exception_i){
        load_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)){
            wdata_o := Cat(Fill(24, io.mem_data_i(7)), io.mem_data_i(7,0))
            mem_sel_o := "b0001".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b01".U(2.W)) {
            wdata_o := Cat(Fill(24, io.mem_data_i(15)), io.mem_data_i(15,8))
            mem_sel_o := "b0010".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b10".U(2.W)) {
            wdata_o := Cat(Fill(24, io.mem_data_i(23)), io.mem_data_i(23,16))
            mem_sel_o := "b0100".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b11".U(2.W)){
            wdata_o := Cat(Fill(24, io.mem_data_i(31)), io.mem_data_i(31,24))
            mem_sel_o := "b1000".U(4.W)

          }.otherwise{
            wdata_o := d.ZeroWord
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            load_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_LBU_OP){
      when(io.data_tlb_r_exception_i){
        load_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)){
            wdata_o := Cat(Fill(24, 0.U(1.W)), io.mem_data_i(7,0))
            mem_sel_o := "b0001".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b01".U(2.W)){
            wdata_o := Cat(Fill(24, 0.U(1.W)), io.mem_data_i(15,8))
            mem_sel_o := "b0010".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b10".U(2.W)){
            wdata_o := Cat(Fill(24, 0.U(1.W)), io.mem_data_i(23,16))
            mem_sel_o := "b0100".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b11".U(2.W)){
            wdata_o := Cat(Fill(24, 0.U(1.W)), io.mem_data_i(31,24))
            mem_sel_o := "b1000".U(4.W)

          }.otherwise{
            wdata_o := d.ZeroWord
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            load_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_LH_OP){
      when(io.data_tlb_r_exception_i){
        load_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)){
            wdata_o := Cat(Fill(16, io.mem_data_i(15)), io.mem_data_i(15,0))
            mem_sel_o := "b0011".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b10".U(2.W)){
            wdata_o := Cat(Fill(16, io.mem_data_i(31)), io.mem_data_i(31,16))
            mem_sel_o := "b1100".U(4.W)

          }.otherwise{
            wdata_o := d.ZeroWord
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            load_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_LHU_OP){
      when(io.data_tlb_r_exception_i){
        load_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)){
            wdata_o := Cat(Fill(16, 0.U(1.W)), io.mem_data_i(15,0))
            mem_sel_o := "b0011".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b10".U(2.W)){
            wdata_o := Cat(Fill(16, 0.U(1.W)), io.mem_data_i(31,16))
            mem_sel_o := "b1100".U(4.W)

          }.otherwise{
            wdata_o := d.ZeroWord
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            load_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_LW_OP){
      when(io.data_tlb_r_exception_i){
        load_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)){
            wdata_o := io.mem_data_i
            mem_sel_o := "b1111".U(4.W)

          }.otherwise{
            wdata_o := d.ZeroWord
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            load_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_LR_OP){
      when(io.data_tlb_r_exception_i){
        load_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable


          when(io.mem_addr_i(1,0) === "b00".U(2.W)){
            wdata_o := io.mem_data_i
            mem_sel_o := "b1111".U(4.W)
          }.otherwise{
            wdata_o := d.ZeroWord
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            load_alignment_error := true.B
          }

        LLbit_we_o := d.WriteEnable
        LLbit_addr_o := io.mem_phy_addr_i
        LLbit_value_o := true.B
      }

    }.elsewhen(io.aluop_i === d.EXE_SB_OP){
      when(io.data_tlb_w_exception_i){
        store_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteEnable
        mem_data_o := Fill(4, io.reg2_i(7,0))

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)) {
            mem_sel_o := "b0001".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b01".U(2.W)) {
            mem_sel_o := "b0010".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b10".U(2.W)) {
            mem_sel_o := "b0100".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b11".U(2.W)) {
            mem_sel_o := "b1000".U(4.W)

          }.otherwise{
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            store_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_SH_OP){
      when(io.data_tlb_w_exception_i){
        store_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteEnable
        mem_data_o := Fill(2, io.reg2_i(15,0))

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)) {
            mem_sel_o := "b0011".U(4.W)

          }.elsewhen(io.mem_addr_i(1,0) === "b10".U(2.W)) {
            mem_sel_o := "b1100".U(4.W)

          }.otherwise{
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            store_alignment_error := true.B
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_SW_OP){
      when(io.data_tlb_w_exception_i){
        store_access_error := true.B
      }.otherwise{
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteEnable
        mem_data_o := io.reg2_i

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

          when(io.mem_addr_i(1,0) === "b00".U(2.W)) {
            mem_sel_o := "b1111".U(4.W)

          }.otherwise{
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
          }
      }

    }.elsewhen(io.aluop_i === d.EXE_SC_OP){
      when(io.data_tlb_w_exception_i) {
        store_access_error := true.B
      }.elsewhen(io.LLbit_i === true.B && io.LLbit_addr_i === io.mem_phy_addr_i){
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteEnable
        mem_data_o := io.reg2_i

          when(io.mem_addr_i(1,0) === "b00".U(2.W)) {
            mem_sel_o := "b1111".U(4.W)

          }.otherwise{
            mem_sel_o := "b0000".U(4.W)
            mem_ce_o := d.ChipDisable
            store_alignment_error := true.B
          }


        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B
        wdata_o := d.SCSucceed

      }.otherwise{
        mem_ce_o := d.ChipDisable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteEnable
        mem_data_o := d.ZeroWord

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B
        wdata_o := d.SCFail
      }

    }.elsewhen(io.aluop_i === d.EXE_AMOSWAP_W_OP || io.aluop_i === d.EXE_AMOADD_W_OP || io.aluop_i === d.EXE_AMOXOR_W_OP ||
      io.aluop_i === d.EXE_AMOAND_W_OP || io.aluop_i === d.EXE_AMOOR_W_OP || io.aluop_i === d.EXE_AMOMIN_W_OP ||
      io.aluop_i === d.EXE_AMOMAX_W_OP || io.aluop_i === d.EXE_AMOMINU_W_OP || io.aluop_i === d.EXE_AMOMAXU_W_OP){

      when(io.data_tlb_r_exception_i | io.data_tlb_w_exception_i){
        store_access_error := true.B
      }.elsewhen(io.cnt_i === 0.U(2.W)){
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteDisable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

         when(io.mem_addr_i(1,0) === "b00".U(2.W)) {
           mem_sel_o := "b1111".U(4.W)
           stallreq_from_amo := true.B
         }.otherwise{
           mem_sel_o := "b0000".U(4.W)
           mem_ce_o := d.ChipDisable
           store_alignment_error := true.B
        }

        cnt_o := Mux(io.stallreq_from_mem_i === true.B, 0.U(2.W), 1.U(2.W))
        original_data_o := io.mem_data_i

      }.elsewhen(io.cnt_i === 1.U(2.W)){
        mem_ce_o := d.ChipEnable

        mem_addr_o := io.mem_addr_i
        mem_phy_addr_o := io.mem_phy_addr_i
        mem_we_o := d.WriteEnable

        LLbit_we_o := d.WriteEnable
        LLbit_value_o := false.B

        mem_data_o := d.ZeroWord
          when(io.aluop_i === d.EXE_AMOSWAP_W_OP) {mem_data_o := io.reg2_i}
            .elsewhen(io.aluop_i === d.EXE_AMOADD_W_OP)  {mem_data_o := io.original_data_i + io.reg2_i}
            .elsewhen(io.aluop_i === d.EXE_AMOXOR_W_OP)  {mem_data_o := io.original_data_i ^ io.reg2_i}
            .elsewhen(io.aluop_i === d.EXE_AMOAND_W_OP)  {mem_data_o := io.original_data_i & io.reg2_i}
            .elsewhen(io.aluop_i === d.EXE_AMOOR_W_OP)   {mem_data_o := io.original_data_i | io.reg2_i}
            .elsewhen(io.aluop_i === d.EXE_AMOMIN_W_OP)  {mem_data_o := Mux(io.original_data_i.asSInt < io.reg2_i.asSInt, io.original_data_i, io.reg2_i)}
            .elsewhen(io.aluop_i === d.EXE_AMOMAX_W_OP)  {mem_data_o := Mux(io.original_data_i.asSInt > io.reg2_i.asSInt, io.original_data_i, io.reg2_i)}
            .elsewhen(io.aluop_i === d.EXE_AMOMINU_W_OP) {mem_data_o := Mux(io.original_data_i < io.reg2_i, io.original_data_i, io.reg2_i)}
            .elsewhen(io.aluop_i === d.EXE_AMOMAXU_W_OP) {mem_data_o := Mux(io.original_data_i > io.reg2_i, io.original_data_i, io.reg2_i)}
              .otherwise{io.mem_data_o := d.ZeroWord}


        mem_sel_o := "b1111".U(4.W)
        wdata_o := io.original_data_i
        cnt_o := 1.U(2.W)
        original_data_o := io.original_data_i
      }

    }.otherwise{
      wd_o := io.wd_i
      wreg_o := io.wreg_i
      wdata_o := io.wdata_i

      csr_reg_we_o := d.CSRWriteDisable
      csr_reg_addr_o := d.NOPRegAddr
      csr_reg_data_o := d.ZeroWord

      mem_addr_o := d.ZeroWord
      mem_phy_addr_o := d.ZeroWord
      mem_we_o := d.WriteDisable
      mem_sel_o := "b1111".U(4.W)
      mem_data_o := d.ZeroWord
      mem_ce_o := d.ChipDisable

      LLbit_we_o := d.WriteDisable
      LLbit_addr_o := d.ZeroWord
      LLbit_value_o := 0.U(1.W)

      cnt_o := 0.U(2.W)
      original_data_o := d.ZeroWord

      load_alignment_error := false.B
      load_access_error := false.B
      store_alignment_error := false.B
      store_access_error := false.B

      stallreq_from_amo := false.B
    }

  io.wd_o := wd_o
  io.wreg_o := wreg_o
  io.wdata_o := wdata_o

  io.csr_reg_we_o := csr_reg_we_o
  io.csr_reg_addr_o := csr_reg_addr_o
  io.csr_reg_data_o := csr_reg_data_o

  io.mem_addr_o := mem_addr_o
  io.mem_phy_addr_o := mem_phy_addr_o
  io.mem_we_o := mem_we_o
  io.mem_sel_o := mem_sel_o
  io.mem_data_o := mem_data_o
  io.mem_ce_o := mem_ce_o

  io.LLbit_we_o := LLbit_we_o
  io.LLbit_addr_o := LLbit_addr_o
  io.LLbit_value_o := LLbit_value_o

  io.cnt_o := cnt_o
  io.original_data_o := original_data_o

}

when(io.rst_n === d.RstEnable){
  io.excepttype_o := d.ZeroWord
}.elsewhen(!io.not_stall_i){
  io.excepttype_o := d.ZeroWord
}.otherwise{
  io.excepttype_o := io.excepttype_i
}

io.not_stall_o := io.not_stall_i
}
