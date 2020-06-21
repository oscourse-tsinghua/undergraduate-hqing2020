package CPU

import chisel3._
import chisel3.util._

class ex_io extends Bundle{
  val rst_n = Input(Bool())

  // ex infor
  val aluop_i = Input(UInt(8.W))
  val alusel_i = Input(UInt(3.W))
  val reg1_i = Input(UInt(32.W))
  val reg2_i = Input(UInt(32.W))
  val mem_addr_i = Input(UInt(32.W))
  val wd_i = Input(UInt(5.W))
  val wreg_i = Input(Bool())
  val inst_i = Input(UInt(32.W))

  // exc_i
  val excepttype_i = Input(UInt(32.W))
  val current_inst_address_i = Input(UInt(32.W))
  val not_stall_i = Input(Bool())

  // last ex res
  val cnt_i = Input(UInt(2.W))
  val div_started_i = Input(Bool())

  // div res_i
  val div_result_rem_i = Input(UInt(32.W))
  val div_result_div_i = Input(UInt(32.W))
  val div_ready_i = Input(Bool())

  // delayslot
  val link_address_i = Input(UInt(32.W))
  val is_in_delayslot_i = Input(Bool())

  // csr
  val csr_reg_we_i = Input(Bool())
  val csr_reg_addr_i = Input(UInt(12.W))
  val csr_reg_data_i = Input(UInt(32.W))

  // tlb
  val data_tlb_exception_i = Input(Bool())
  val mem_phy_addr_i = Input(UInt(34.W))

  // csr next
  val csr_reg_we_o = Output(Bool())
  val csr_reg_addr_o = Output(UInt(12.W))
  val csr_reg_data_o = Output(UInt(32.W))

  // reg
  val wreg_o = Output(Bool())
  val wd_o = Output(UInt(5.W))
  val wdata_o = Output(UInt(32.W))

  // next ex res
  val cnt_o = Output(UInt(2.W))
  val div_started_o = Output(Bool())

  // div_o
  val div_opdata1_o = Output(UInt(32.W))
  val div_opdata2_o = Output(UInt(32.W))
  val div_start_o = Output(Bool())
  val signed_div_o = Output(Bool())

  //
  val aluop_o = Output(UInt(8.W))
  val mem_addr_o = Output(UInt(32.W))
  val reg2_o = Output(UInt(32.W))
  val mem_we_o = Output(Bool())
  val mem_ce_o = Output(Bool())

  // exc_o
  val excepttype_o = Output(UInt(32.W))
  val is_in_delayslot_o = Output(Bool())
  val current_inst_address_o = Output(UInt(32.W))
  val not_stall_o = Output(Bool())

  // mem addr
  val mem_phy_addr_o = Output(UInt(34.W))
  val data_tlb_r_exception_o = Output(Bool())
  val data_tlb_w_exception_o = Output(Bool())
  val stallreq = Output(Bool())
}

class IExecute extends Module{
  val io = IO(new ex_io)

  io.is_in_delayslot_o := io.is_in_delayslot_i
  io.current_inst_address_o := io.current_inst_address_i
  io.not_stall_o := io.not_stall_i
  io.cnt_o := 0.U
  val logicout = RegInit(UInt(32.W), d.ZeroWord)
  val shiftout = RegInit(UInt(32.W), d.ZeroWord)
  val moveout  = RegInit(UInt(32.W), d.ZeroWord)

  val arithout = RegInit(UInt(32.W), d.ZeroWord)
  val multiout = RegInit(UInt(32.W), d.ZeroWord)

  /************************************************************************/
  when(io.rst_n === d.RstEnable){
    logicout := d.ZeroWord
  }.otherwise{
    logicout := d.ZeroWord
    switch(io.aluop_i){
      is(d.EXE_OR_OP){
        logicout := io.reg1_i | io.reg2_i
      }
      is(d.EXE_AND_OP){
        logicout := io.reg1_i & io.reg2_i
      }
      is(d.EXE_XOR_OP){
        logicout := io.reg1_i ^ io.reg2_i
      }
    }
  }

  // shift op
  when(io.rst_n === d.RstEnable){
    shiftout := d.ZeroWord
  }.otherwise{
    shiftout := d.ZeroWord
    switch(io.aluop_i){
      is(d.EXE_SLL_OP){
        shiftout := io.reg1_i << io.reg2_i(4,0)
      }
      is(d.EXE_SRL_OP){
        shiftout := io.reg1_i >> io.reg2_i(4,0)
      }
      is(d.EXE_SRA_OP){
        shiftout := (io.reg1_i.asSInt >> io.reg2_i(4,0)).asUInt
      }
    }
  }


  // arithmetic op
  when(io.rst_n === d.RstEnable){
    arithout := d.ZeroWord
  }.otherwise{
    arithout := d.ZeroWord
    switch(io.aluop_i){
      is(d.EXE_SLT_OP){
        arithout := io.reg1_i.asSInt < io.reg2_i.asSInt
      }
      is(d.EXE_SLTU_OP){
        arithout := io.reg1_i < io.reg2_i
      }
      is(d.EXE_ADD_OP){
        arithout := io.reg1_i + io.reg2_i
      }
      is(d.EXE_SUB_OP){
        arithout := io.reg1_i - io.reg2_i
      }
    }
  }


  // move op
  when(io.rst_n === d.RstEnable){
    moveout := d.ZeroWord
  }.otherwise{
    moveout := d.ZeroWord
    switch(io.aluop_i){
      is(d.EXE_CSRRW_OP, d.EXE_CSRRS_OP, d.EXE_CSRRC_OP){
        moveout := io.csr_reg_data_i
      }
    }
  }


  // multi op
  val opdata1_mult = Reg(UInt(64.W))
  val opdata2_mult = Reg(UInt(64.W))
  val result_mul = Reg(UInt(64.W))

  opdata1_mult := Mux(io.aluop_i === d.EXE_MULH_OP || io.aluop_i === d.EXE_MULHSU_OP,
    Cat(Fill(32, io.reg1_i(31)), io.reg1_i),
    Cat(d.ZeroWord, io.reg1_i)
  )

  opdata2_mult := Mux(io.aluop_i === d.EXE_MULH_OP,
    Cat(Fill(32, io.reg2_i(31)), io.reg2_i),
    Cat(d.ZeroWord, io.reg2_i)
  )

  result_mul := opdata1_mult * opdata2_mult

  when(io.rst_n === d.RstEnable){
    multiout := d.ZeroWord
  }.otherwise{
    multiout := d.ZeroWord
    switch(io.aluop_i){
      is(d.EXE_MUL_OP){
        multiout := result_mul(31,0)
      }

      is(d.EXE_MULH_OP, d.EXE_MULHSU_OP, d.EXE_MULHU_OP){
        multiout := result_mul(63,32)
      }

      is(d.EXE_DIV_OP, d.EXE_DIVU_OP){
        multiout := io.div_result_div_i
      }

      is(d.EXE_REM_OP, d.EXE_REMU_OP){
        multiout := io.div_result_rem_i
      }
    }
  }

  // div, divu
  val stallreq_for_div = Reg(Bool())
  stallreq_for_div := d.NoStop
  io.div_opdata1_o := d.ZeroWord
  io.div_opdata2_o := d.ZeroWord
  io.div_start_o := false.B
  io.signed_div_o := false.B
  io.div_start_o := false.B
  io.div_started_o := false.B
  when(io.rst_n === d.RstEnable){
    stallreq_for_div := d.NoStop
    io.div_opdata1_o := d.ZeroWord
    io.div_opdata2_o := d.ZeroWord
    io.div_start_o := false.B
    io.signed_div_o := false.B
    io.div_start_o := false.B
    io.div_started_o := false.B
  }.otherwise{
    stallreq_for_div := d.NoStop
    io.div_opdata1_o := d.ZeroWord
    io.div_opdata2_o := d.ZeroWord
    io.div_start_o := false.B
    io.signed_div_o := false.B
    io.div_start_o := false.B

    switch(io.aluop_i){
      is(d.EXE_DIV_OP, d.EXE_DIVU_OP, d.EXE_REM_OP, d.EXE_REMU_OP){
        when(io.div_started_i === false.B){
          io.div_opdata1_o := io.reg1_i
          io.div_opdata2_o := io.reg2_i
          io.div_start_o := true.B
          io.signed_div_o := Mux(
            io.aluop_i === d.EXE_DIV_OP || io.aluop_i === d.EXE_REM_OP,
            true.B,false.B)
          io.div_started_o := true.B
          stallreq_for_div := true.B
        }.elsewhen(io.div_started_i === true.B){
          io.div_opdata1_o := io.reg1_i
          io.div_opdata2_o := io.reg2_i
          io.div_start_o := false.B
          io.signed_div_o := Mux(
            io.aluop_i === d.EXE_DIV_OP || io.aluop_i === d.EXE_REM_OP,
            true.B,false.B)
          io.div_started_o := true.B
          stallreq_for_div := Mux(
            io.div_ready_i === true.B,
            false.B,true.B)
        }
      }
    }
  }


  //
  io.aluop_o := io.aluop_i
  io.mem_addr_o := io.mem_addr_i
  io.reg2_o := io.reg2_i
  io.mem_phy_addr_o := io.mem_phy_addr_i
  io.data_tlb_r_exception_o := Mux(
    io.mem_we_o === d.WriteDisable,
    io.data_tlb_exception_i,false.B
  )
  io.data_tlb_w_exception_o := Mux(
    io.mem_we_o === d.WriteEnable,
    io.data_tlb_exception_i,false.B
  )

  // for mmu to cheack whether writable
  val excepttype_b = VecInit(d.ZeroWord.asBools)
  io.mem_we_o := d.WriteDisable
  io.mem_ce_o := d.ChipDisable
  io.excepttype_o := d.ZeroWord
  when(io.rst_n === d.RstEnable){
    io.mem_we_o := d.WriteDisable
    io.mem_ce_o := d.ChipDisable
    io.excepttype_o := d.ZeroWord
  }.otherwise{
    excepttype_b := io.excepttype_i.asBools

    switch(io.aluop_i){
      is(d.EXE_LB_OP, d.EXE_LBU_OP, d.EXE_LH_OP, d.EXE_LHU_OP, d.EXE_LW_OP, d.EXE_LR_OP){
        io.mem_we_o := false.B
        io.mem_ce_o := true.B
        excepttype_b(d.Exception_LOAD_ACCESS_FAULT) := io.data_tlb_r_exception_o
      }
      is(d.EXE_SB_OP, d.EXE_SH_OP, d.EXE_SW_OP, d.EXE_SC_OP, d.EXE_AMOSWAP_W_OP, d.EXE_AMOADD_W_OP,
        d.EXE_AMOXOR_W_OP, d.EXE_AMOAND_W_OP, d.EXE_AMOOR_W_OP, d.EXE_AMOMIN_W_OP, d.EXE_AMOMAX_W_OP,
        d.EXE_AMOMINU_W_OP, d.EXE_AMOMAXU_W_OP){
        io.mem_we_o := true.B
        io.mem_ce_o := true.B
        excepttype_b(d.Exception_STORE_ACCESS_FAULT) := io.data_tlb_w_exception_o
      }
    }

    // L S addr error
    switch(io.aluop_i){
      is(d.EXE_LH_OP, d.EXE_LHU_OP){
        when(io.mem_addr_o(0) =/= 0.U(1.W)){
          excepttype_b(d.Exception_LOAD_MISALIGNED) := true.B
        }
      }
      is(d.EXE_SH_OP){
        when(io.mem_addr_o(0) =/= 0.U(1.W)){
          excepttype_b(d.Exception_STORE_MISALIGNED) := true.B
        }
      }
      is(d.EXE_LW_OP, d.EXE_LR_OP){
        when(io.mem_addr_o(1,0) =/= 0.U(2.W)){
          excepttype_b(d.Exception_LOAD_MISALIGNED) := true.B
        }
      }
      is(d.EXE_SW_OP, d.EXE_SC_OP, d.EXE_AMOSWAP_W_OP, d.EXE_AMOADD_W_OP,
        d.EXE_AMOXOR_W_OP, d.EXE_AMOAND_W_OP, d.EXE_AMOOR_W_OP, d.EXE_AMOMIN_W_OP,
        d.EXE_AMOMAX_W_OP, d.EXE_AMOMINU_W_OP, d.EXE_AMOMAXU_W_OP){
        when(io.mem_addr_o(1,0) =/= 0.U(2.W)){
          excepttype_b(d.Exception_STORE_MISALIGNED) := true.B
        }
      }
    }
    io.excepttype_o := excepttype_b.asUInt
  }

  /*********************** stall ***************************/
  io.stallreq := stallreq_for_div

  /****************** write to regfile ********************/
  io.wreg_o := d.WriteDisable
  io.wd_o := d.NOPRegAddr
  io.wdata_o := d.ZeroWord
  when(io.rst_n === d.RstEnable){
    io.wreg_o := d.WriteDisable
    io.wd_o := d.NOPRegAddr
    io.wdata_o := d.ZeroWord
  }.otherwise{
    io.wd_o := io.wd_i
    io.wreg_o := io.wreg_i
    io.wdata_o := d.ZeroWord
    switch(io.alusel_i){
      is(d.EXE_RES_LOGIC)       {io.wdata_o := logicout}
      is(d.EXE_RES_SHIFT)       {io.wdata_o := shiftout}
      is(d.EXE_RES_MOVE)        {io.wdata_o := moveout}
      is(d.EXE_RES_ARITHMETIC)  {io.wdata_o := arithout}
      is(d.EXE_RES_MUL)         {io.wdata_o := multiout}
      is(d.EXE_RES_JUMP_BRANCH) {io.wdata_o := io.link_address_i}
    }
  }

  /******************* write to csr ********************/
  io.csr_reg_addr_o := io.csr_reg_addr_i
  io.csr_reg_we_o := io.csr_reg_we_i
  io.csr_reg_data_o := d.ZeroWord
  when(io.rst_n === d.RstEnable){
    io.csr_reg_data_o := d.ZeroWord
  }.otherwise{
    io.csr_reg_data_o := d.ZeroWord
    switch(io.aluop_i){
      is(d.EXE_CSRRW_OP) {io.csr_reg_data_o := io.reg1_i}
      is(d.EXE_CSRRS_OP) {io.csr_reg_data_o := io.csr_reg_data_i | io.reg1_i}
      is(d.EXE_CSRRC_OP) {io.csr_reg_data_o := io.csr_reg_data_i & (~io.reg1_i).asUInt}
    }
  }


}
