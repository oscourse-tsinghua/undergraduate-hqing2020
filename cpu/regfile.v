module regfile(
  input         clock,
  input         reset,
  input         io_clk,
  input         io_rst_n,
  input         io_re1,
  input  [4:0]  io_raddr1,
  output [31:0] io_rdata1,
  input         io_re2,
  input  [4:0]  io_raddr2,
  output [31:0] io_rdata2,
  input         io_we,
  input  [4:0]  io_waddr,
  input  [31:0] io_wdata
);
  reg [31:0] registers [0:31]; // @[regfile.scala 28:22]
  reg [31:0] _RAND_0;
  wire [31:0] registers__T_12_data; // @[regfile.scala 28:22]
  wire [4:0] registers__T_12_addr; // @[regfile.scala 28:22]
  wire [31:0] registers__T_21_data; // @[regfile.scala 28:22]
  wire [4:0] registers__T_21_addr; // @[regfile.scala 28:22]
  wire [31:0] registers__T_3_data; // @[regfile.scala 28:22]
  wire [4:0] registers__T_3_addr; // @[regfile.scala 28:22]
  wire  registers__T_3_mask; // @[regfile.scala 28:22]
  wire  registers__T_3_en; // @[regfile.scala 28:22]
  wire  _T_1; // @[regfile.scala 30:44]
  wire  _T_5; // @[regfile.scala 38:24]
  wire  _T_6; // @[regfile.scala 41:24]
  wire  _T_8; // @[regfile.scala 41:37]
  wire  _T_10; // @[regfile.scala 41:64]
  wire [31:0] _GEN_8; // @[regfile.scala 44:38]
  wire [31:0] _GEN_9; // @[regfile.scala 41:91]
  wire  _GEN_12; // @[regfile.scala 41:91]
  wire [31:0] _GEN_13; // @[regfile.scala 38:40]
  wire  _GEN_16; // @[regfile.scala 38:40]
  wire  _T_14; // @[regfile.scala 55:24]
  wire  _T_15; // @[regfile.scala 58:24]
  wire  _T_17; // @[regfile.scala 58:37]
  wire  _T_19; // @[regfile.scala 58:64]
  wire [31:0] _GEN_24; // @[regfile.scala 61:38]
  wire [31:0] _GEN_25; // @[regfile.scala 58:91]
  wire  _GEN_28; // @[regfile.scala 58:91]
  wire [31:0] _GEN_29; // @[regfile.scala 55:40]
  wire  _GEN_32; // @[regfile.scala 55:40]
  assign registers__T_12_addr = io_raddr1;
  assign registers__T_12_data = registers[registers__T_12_addr]; // @[regfile.scala 28:22]
  assign registers__T_21_addr = io_raddr2;
  assign registers__T_21_data = registers[registers__T_21_addr]; // @[regfile.scala 28:22]
  assign registers__T_3_data = io_wdata;
  assign registers__T_3_addr = io_waddr;
  assign registers__T_3_mask = 1'h1;
  assign registers__T_3_en = io_we & _T_1;
  assign _T_1 = io_waddr != 5'h0; // @[regfile.scala 30:44]
  assign _T_5 = io_raddr1 == 5'h0; // @[regfile.scala 38:24]
  assign _T_6 = io_raddr1 == io_waddr; // @[regfile.scala 41:24]
  assign _T_8 = _T_6 & io_we; // @[regfile.scala 41:37]
  assign _T_10 = _T_8 & io_re1; // @[regfile.scala 41:64]
  assign _GEN_8 = io_re1 ? registers__T_12_data : 32'h0; // @[regfile.scala 44:38]
  assign _GEN_9 = _T_10 ? io_wdata : _GEN_8; // @[regfile.scala 41:91]
  assign _GEN_12 = _T_10 ? 1'h0 : io_re1; // @[regfile.scala 41:91]
  assign _GEN_13 = _T_5 ? 32'h0 : _GEN_9; // @[regfile.scala 38:40]
  assign _GEN_16 = _T_5 ? 1'h0 : _GEN_12; // @[regfile.scala 38:40]
  assign _T_14 = io_raddr2 == 5'h0; // @[regfile.scala 55:24]
  assign _T_15 = io_raddr2 == io_waddr; // @[regfile.scala 58:24]
  assign _T_17 = _T_15 & io_we; // @[regfile.scala 58:37]
  assign _T_19 = _T_17 & io_re2; // @[regfile.scala 58:64]
  assign _GEN_24 = io_re2 ? registers__T_21_data : 32'h0; // @[regfile.scala 61:38]
  assign _GEN_25 = _T_19 ? io_wdata : _GEN_24; // @[regfile.scala 58:91]
  assign _GEN_28 = _T_19 ? 1'h0 : io_re2; // @[regfile.scala 58:91]
  assign _GEN_29 = _T_14 ? 32'h0 : _GEN_25; // @[regfile.scala 55:40]
  assign _GEN_32 = _T_14 ? 1'h0 : _GEN_28; // @[regfile.scala 55:40]
  assign io_rdata1 = io_rst_n ? _GEN_13 : 32'h0; // @[regfile.scala 36:15 regfile.scala 39:15 regfile.scala 42:15 regfile.scala 45:15 regfile.scala 48:15]
  assign io_rdata2 = io_rst_n ? _GEN_29 : 32'h0; // @[regfile.scala 53:15 regfile.scala 56:15 regfile.scala 59:15 regfile.scala 62:15 regfile.scala 65:15]
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    registers[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(registers__T_3_en & registers__T_3_mask) begin
      registers[registers__T_3_addr] <= registers__T_3_data; // @[regfile.scala 28:22]
    end
  end
endmodule
