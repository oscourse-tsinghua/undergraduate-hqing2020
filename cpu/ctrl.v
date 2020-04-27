module ControlUnit(
  input        clock,
  input        reset,
  input        io_rst_n,
  input        io_flushreq_from_csr,
  input        io_stallreq_from_if,
  input        io_stallreq_from_id,
  input        io_stallreq_from_ex,
  input        io_stallreq_from_mem,
  input        io_stallreq_from_wb,
  output       io_flush,
  output [5:0] io_stall
);
  wire  _T_4; // @[ControlUnit.scala 28:56]
  wire  _T_6; // @[ControlUnit.scala 28:92]
  wire  _T_8; // @[ControlUnit.scala 28:127]
  wire  _T_10; // @[ControlUnit.scala 28:162]
  wire  _GEN_0; // @[ControlUnit.scala 25:46]
  wire  _GEN_3; // @[ControlUnit.scala 25:46]
  wire  _GEN_4; // @[ControlUnit.scala 25:46]
  wire  _GEN_5; // @[ControlUnit.scala 25:46]
  wire  stall_b_0; // @[ControlUnit.scala 23:33]
  wire  stall_b_3; // @[ControlUnit.scala 23:33]
  wire  stall_b_4; // @[ControlUnit.scala 23:33]
  wire  stall_b_5; // @[ControlUnit.scala 23:33]
  wire [31:0] _T_74; // @[ControlUnit.scala 35:23]
  assign _T_4 = io_stallreq_from_wb | io_stallreq_from_mem; // @[ControlUnit.scala 28:56]
  assign _T_6 = _T_4 | io_stallreq_from_ex; // @[ControlUnit.scala 28:92]
  assign _T_8 = _T_6 | io_stallreq_from_id; // @[ControlUnit.scala 28:127]
  assign _T_10 = _T_8 | io_stallreq_from_if; // @[ControlUnit.scala 28:162]
  assign _GEN_0 = io_flushreq_from_csr ? 1'h0 : _T_10; // @[ControlUnit.scala 25:46]
  assign _GEN_3 = io_flushreq_from_csr ? 1'h0 : _T_6; // @[ControlUnit.scala 25:46]
  assign _GEN_4 = io_flushreq_from_csr ? 1'h0 : _T_4; // @[ControlUnit.scala 25:46]
  assign _GEN_5 = io_flushreq_from_csr ? 1'h0 : io_stallreq_from_wb; // @[ControlUnit.scala 25:46]
  assign stall_b_0 = io_rst_n ? _GEN_0 : 1'h0; // @[ControlUnit.scala 23:33]
  assign stall_b_3 = io_rst_n ? _GEN_3 : 1'h0; // @[ControlUnit.scala 23:33]
  assign stall_b_4 = io_rst_n ? _GEN_4 : 1'h0; // @[ControlUnit.scala 23:33]
  assign stall_b_5 = io_rst_n ? _GEN_5 : 1'h0; // @[ControlUnit.scala 23:33]
  assign _T_74 = {16'h0,8'h0,2'h0,stall_b_5,stall_b_4,stall_b_3,stall_b_0,stall_b_0,stall_b_0}; // @[ControlUnit.scala 35:23]
  assign io_flush = io_flushreq_from_csr; // @[ControlUnit.scala 36:12]
  assign io_stall = _T_74[5:0]; // @[ControlUnit.scala 24:14 ControlUnit.scala 26:14 ControlUnit.scala 35:12]
endmodule
