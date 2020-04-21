package CPU

import chisel3._
import chisel3.util._

class DIVIO extends Bundle{
  val clk   = Input(Clock())
  val rst_n = Input(Bool())

  // sign
  val signed_div_i = Input(Bool())

  // opr
  val opdata1_i = Input(UInt(32.W))
  val opdata2_i = Input(UInt(32.W))

  // start and interrupt
  val start_i = Input(Bool())
  val annul_i = Input(Bool())

  // result
  val rem_o = Output(UInt(32.W))
  val div_o = Output(UInt(32.W))

  // end
  val ready_o = Output(Bool())
}



class div extends Module{
  val io = IO(new DIVIO)

  io.div_o := d.ZeroWord
  io.rem_o := d.ZeroWord
  io.ready_o := true.B

  // divisor
  // dividend[63:k+1] dividend; dividend[k:0] result
  val div_temp = Wire(UInt(33.W))
  val divisor = Reg(UInt(32.W))
  val dividend = Reg(UInt(65.W))
  val cnt = Reg(UInt(6.W))
  //
  div_temp := Cat(0.U(1.W), dividend(63,32)) - Cat(0.U(1.W), divisor)

  // state
  val state = Reg(UInt(2.W))
  //
  val opdata1 = Reg(UInt(32.W))
  val opdata2 = Reg(UInt(32.W))
  val signed_div = Reg(Bool())

  val dividend_a = RegInit(0.U(32.W))// 32,1
  val dividend_b = RegInit(0.U(32.W))// 64,33
  val dividend_c = RegInit(0.U(32.W))// 31,0
  //
  div_temp := Cat("b0".U(1.W), dividend(63,32)) - Cat("b0".U(1.W), divisor)

  state       := 0.U(2.W)
  io.ready_o  := false.B
  io.rem_o    := d.ZeroWord
  io.div_o    := d.ZeroWord
  withClock(io.clk){
    when(io.rst_n === d.RstEnable){
      // reset
      state       := 0.U(2.W)
      io.ready_o  := false.B
      io.rem_o    := d.ZeroWord
      io.div_o    := d.ZeroWord

    }.otherwise{
      switch(state){
        is(0.U(2.W)){// div_free

          when(io.start_i === true.B && io.annul_i === false.B){
            when(io.opdata2_i === d.ZeroWord){
              state := 1.U(2.W)

            }.otherwise{
              state := 2.U(2.W)
              cnt := 0.U(6.W)
              dividend := 0.U(65.W)
              dividend_a := Mux((io.signed_div_i === true.B && io.opdata1_i(31) === "b1".U(1.W)), ~(io.opdata1_i + 1.U(1.W)), io.opdata1_i)
              divisor := Mux((io.signed_div_i === true.B && io.opdata2_i(31) === "b1".U(1.W)), ~(io.opdata2_i + 1.U(1.W)), io.opdata2_i)
              dividend := Cat(Cat(dividend(64,33), dividend_a), 0.U(1.W))
            }

            opdata1 := io.opdata1_i
            opdata2 := io.opdata2_i
            signed_div := io.signed_div_i
            io.ready_o := false.B

            io.rem_o    := d.ZeroWord
            io.div_o    := d.ZeroWord
          }
        }

        // div_byzero
        is(1.U(2.W)){
          io.ready_o := true.B
          state := 0.U(2.W)

          io.rem_o    := opdata1
          io.div_o    := "h11111111".U(32.W)
        }

        // div_on
        is(2.U(2.W)){
          when(io.annul_i === false.B){
            when(cnt =/= 32.U(6.W)){
              when(div_temp(32) === "b1".U(1.W)){
                dividend := Cat(dividend(63,0), 0.U(1.W))
              }.otherwise{
                dividend := Cat(div_temp(31,0), Cat(dividend(31,0), 1.U(1.W)))
              }
              cnt := cnt + 1.U
            }.otherwise{
              when((signed_div === true.B) && ((opdata1(31) ^ opdata2(31)) === "b1".U(1.W))){
                dividend_c := ((~dividend(31,0)).asUInt + 1.U)
                dividend := Cat(dividend(64,32), dividend_c)
              }

              when((signed_div === true.B) && ((opdata1(31) ^ dividend(64) === "b1".U(1.W)))){
                dividend_b := ((~dividend(64,33)).asUInt + 1.U)
                dividend := Cat(dividend_b, dividend(32,0))
              }

              state := 3.U(2.W)
              cnt := 0.U(6.W)
            }

          }.otherwise{
            io.ready_o := false.B
            state := 0.U(2.W)

            io.rem_o    := d.ZeroWord
            io.div_o    := d.ZeroWord
          }
        }

        // div_end
        is(3.U(2.W)){
          io.ready_o := true.B
          state := 0.U(2.W)

          io.rem_o    := dividend(64,33)
          io.div_o    := dividend(31,0)
        }
      }
    }
  }
}
