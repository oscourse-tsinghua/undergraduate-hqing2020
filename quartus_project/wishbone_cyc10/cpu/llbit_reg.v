module llbit_reg(
  input         io_clk,
  input         io_rst_n,
  input         io_flush,
  input         io_we_i,
  input         io_LLbit_i,
  input  [33:0] io_LLbit_addr_i,
  output        io_LLbit_o,
  output [33:0] io_LLbit_addr_o
);
  reg  LLbit; // @[llbit_reg.scala 27:18]
  reg [31:0] _RAND_0;
  reg [33:0] LLbit_addr; // @[llbit_reg.scala 28:27]
  reg [63:0] _RAND_1;
  wire  _GEN_0; // @[llbit_reg.scala 37:42]
  wire [33:0] _GEN_1; // @[llbit_reg.scala 37:42]
  wire  _GEN_2; // @[llbit_reg.scala 34:37]
  wire [33:0] _GEN_3; // @[llbit_reg.scala 34:37]
  assign _GEN_0 = io_we_i ? io_LLbit_i : LLbit; // @[llbit_reg.scala 37:42]
  assign _GEN_1 = io_we_i ? io_LLbit_addr_i : LLbit_addr; // @[llbit_reg.scala 37:42]
  assign _GEN_2 = io_flush ? 1'h0 : _GEN_0; // @[llbit_reg.scala 34:37]
  assign _GEN_3 = io_flush ? 34'h0 : _GEN_1; // @[llbit_reg.scala 34:37]
  assign io_LLbit_o = io_rst_n ? _GEN_2 : 1'h0; // @[llbit_reg.scala 44:16 llbit_reg.scala 47:16 llbit_reg.scala 50:16 llbit_reg.scala 53:16]
  assign io_LLbit_addr_o = io_rst_n ? _GEN_3 : 34'h0; // @[llbit_reg.scala 45:21 llbit_reg.scala 48:21 llbit_reg.scala 51:21 llbit_reg.scala 54:21]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  LLbit = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  LLbit_addr = _RAND_1[33:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge io_clk) begin
    if (~io_rst_n) begin
      LLbit <= 1'h0;
    end else if (io_flush) begin
      LLbit <= 1'h0;
    end else if (io_we_i) begin
      LLbit <= io_LLbit_i;
    end
    if (~io_rst_n) begin
      LLbit_addr <= 34'h0;
    end else if (~io_rst_n) begin
      LLbit_addr <= 34'h0;
    end else if (io_flush) begin
      LLbit_addr <= 34'h0;
    end else if (io_we_i) begin
      LLbit_addr <= io_LLbit_addr_i;
    end
  end
endmodule
