module IExecute(
  input         io_rst_n,
  input  [7:0]  io_aluop_i,
  input  [2:0]  io_alusel_i,
  input  [31:0] io_reg1_i,
  input  [31:0] io_reg2_i,
  input  [31:0] io_mem_addr_i,
  input  [4:0]  io_wd_i,
  input         io_wreg_i,
  input  [31:0] io_inst_i,
  input  [31:0] io_excepttype_i,
  input  [31:0] io_current_inst_address_i,
  input         io_not_stall_i,
  input  [1:0]  io_cnt_i,
  input         io_div_started_i,
  input  [31:0] io_div_result_rem_i,
  input  [31:0] io_div_result_div_i,
  input         io_div_ready_i,
  input  [31:0] io_link_address_i,
  input         io_is_in_delayslot_i,
  input         io_csr_reg_we_i,
  input  [11:0] io_csr_reg_addr_i,
  input  [31:0] io_csr_reg_data_i,
  input         io_data_tlb_exception_i,
  input  [33:0] io_mem_phy_addr_i,
  output        io_csr_reg_we_o,
  output [11:0] io_csr_reg_addr_o,
  output [31:0] io_csr_reg_data_o,
  output        io_wreg_o,
  output [4:0]  io_wd_o,
  output [31:0] io_wdata_o,
  output [1:0]  io_cnt_o,
  output        io_div_started_o,
  output [31:0] io_div_opdata1_o,
  output [31:0] io_div_opdata2_o,
  output        io_div_start_o,
  output        io_signed_div_o,
  output [7:0]  io_aluop_o,
  output [31:0] io_mem_addr_o,
  output [31:0] io_reg2_o,
  output        io_mem_we_o,
  output        io_mem_ce_o,
  output [31:0] io_excepttype_o,
  output        io_is_in_delayslot_o,
  output [31:0] io_current_inst_address_o,
  output        io_not_stall_o,
  output [33:0] io_mem_phy_addr_o,
  output        io_data_tlb_r_exception_o,
  output        io_data_tlb_w_exception_o,
  output        io_stallreq
);
  reg [31:0] logicout; // @[IExecute.scala 93:25]
  reg [31:0] _RAND_0;
  reg [31:0] shiftout; // @[IExecute.scala 94:25]
  reg [31:0] _RAND_1;
  reg [31:0] moveout; // @[IExecute.scala 95:25]
  reg [31:0] _RAND_2;
  reg [31:0] arithout; // @[IExecute.scala 97:25]
  reg [31:0] _RAND_3;
  reg [31:0] multiout; // @[IExecute.scala 98:25]
  reg [31:0] _RAND_4;
  wire  _T_1; // @[Conditional.scala 37:30]
  wire [31:0] _T_2; // @[IExecute.scala 107:31]
  wire  _T_3; // @[Conditional.scala 37:30]
  wire [31:0] _T_4; // @[IExecute.scala 110:31]
  wire  _T_5; // @[Conditional.scala 37:30]
  wire [31:0] _T_6; // @[IExecute.scala 113:31]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire [62:0] _GEN_109; // @[IExecute.scala 125:31]
  wire [62:0] _T_10; // @[IExecute.scala 125:31]
  wire  _T_11; // @[Conditional.scala 37:30]
  wire [31:0] _T_13; // @[IExecute.scala 128:31]
  wire  _T_14; // @[Conditional.scala 37:30]
  wire [31:0] _T_18; // @[IExecute.scala 131:58]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67]
  wire [62:0] _GEN_6; // @[Conditional.scala 40:58]
  wire [62:0] _GEN_7; // @[IExecute.scala 119:33]
  wire  _T_20; // @[Conditional.scala 37:30]
  wire  _T_23; // @[IExecute.scala 144:38]
  wire  _T_24; // @[Conditional.scala 37:30]
  wire  _T_25; // @[IExecute.scala 147:31]
  wire  _T_26; // @[Conditional.scala 37:30]
  wire [31:0] _T_28; // @[IExecute.scala 150:31]
  wire  _T_29; // @[Conditional.scala 37:30]
  wire [31:0] _T_31; // @[IExecute.scala 153:31]
  wire  _T_33; // @[Conditional.scala 37:30]
  wire  _T_34; // @[Conditional.scala 37:30]
  wire  _T_35; // @[Conditional.scala 37:30]
  wire  _T_36; // @[Conditional.scala 37:55]
  wire  _T_37; // @[Conditional.scala 37:55]
  reg [63:0] opdata1_mult; // @[IExecute.scala 173:25]
  reg [63:0] _RAND_5;
  reg [63:0] opdata2_mult; // @[IExecute.scala 174:25]
  reg [63:0] _RAND_6;
  reg [63:0] result_mul; // @[IExecute.scala 175:23]
  reg [63:0] _RAND_7;
  wire  _T_38; // @[IExecute.scala 177:34]
  wire  _T_39; // @[IExecute.scala 177:66]
  wire  _T_40; // @[IExecute.scala 177:52]
  wire [31:0] _T_43; // @[Bitwise.scala 71:12]
  wire [63:0] _T_44; // @[Cat.scala 29:58]
  wire [63:0] _T_45; // @[Cat.scala 29:58]
  wire [31:0] _T_50; // @[Bitwise.scala 71:12]
  wire [63:0] _T_51; // @[Cat.scala 29:58]
  wire [63:0] _T_52; // @[Cat.scala 29:58]
  wire [127:0] _T_54; // @[IExecute.scala 187:30]
  wire  _T_56; // @[Conditional.scala 37:30]
  wire  _T_58; // @[Conditional.scala 37:30]
  wire  _T_59; // @[Conditional.scala 37:30]
  wire  _T_60; // @[Conditional.scala 37:30]
  wire  _T_61; // @[Conditional.scala 37:55]
  wire  _T_62; // @[Conditional.scala 37:55]
  wire  _T_64; // @[Conditional.scala 37:30]
  wire  _T_65; // @[Conditional.scala 37:30]
  wire  _T_66; // @[Conditional.scala 37:55]
  wire  _T_67; // @[Conditional.scala 37:30]
  wire  _T_68; // @[Conditional.scala 37:30]
  wire  _T_69; // @[Conditional.scala 37:55]
  reg  stallreq_for_div; // @[IExecute.scala 213:29]
  reg [31:0] _RAND_8;
  wire  _T_76; // @[Conditional.scala 37:55]
  wire  _T_77; // @[Conditional.scala 37:55]
  wire  _T_79; // @[IExecute.scala 244:24]
  wire  _T_80; // @[IExecute.scala 244:55]
  wire  _T_81; // @[IExecute.scala 244:41]
  wire  _T_89; // @[IExecute.scala 256:34]
  wire [31:0] _GEN_20; // @[IExecute.scala 248:48]
  wire [31:0] _GEN_21; // @[IExecute.scala 248:48]
  wire  _GEN_23; // @[IExecute.scala 248:48]
  wire  _GEN_25; // @[IExecute.scala 248:48]
  wire [31:0] _GEN_26; // @[IExecute.scala 239:43]
  wire [31:0] _GEN_27; // @[IExecute.scala 239:43]
  wire  _GEN_29; // @[IExecute.scala 239:43]
  wire  _GEN_30; // @[IExecute.scala 239:43]
  wire  _GEN_31; // @[IExecute.scala 239:43]
  wire [31:0] _GEN_32; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_33; // @[Conditional.scala 40:58]
  wire  _GEN_34; // @[Conditional.scala 40:58]
  wire  _GEN_35; // @[Conditional.scala 40:58]
  wire  _GEN_36; // @[Conditional.scala 40:58]
  wire  _GEN_37; // @[Conditional.scala 40:58]
  wire  _T_127; // @[Conditional.scala 37:30]
  wire  _T_128; // @[Conditional.scala 37:30]
  wire  _T_129; // @[Conditional.scala 37:30]
  wire  _T_130; // @[Conditional.scala 37:30]
  wire  _T_131; // @[Conditional.scala 37:30]
  wire  _T_132; // @[Conditional.scala 37:30]
  wire  _T_133; // @[Conditional.scala 37:55]
  wire  _T_134; // @[Conditional.scala 37:55]
  wire  _T_135; // @[Conditional.scala 37:55]
  wire  _T_136; // @[Conditional.scala 37:55]
  wire  _T_137; // @[Conditional.scala 37:55]
  wire  _T_138; // @[Conditional.scala 37:30]
  wire  _T_139; // @[Conditional.scala 37:30]
  wire  _T_140; // @[Conditional.scala 37:30]
  wire  _T_141; // @[Conditional.scala 37:30]
  wire  _T_142; // @[Conditional.scala 37:30]
  wire  _T_143; // @[Conditional.scala 37:30]
  wire  _T_144; // @[Conditional.scala 37:30]
  wire  _T_145; // @[Conditional.scala 37:30]
  wire  _T_146; // @[Conditional.scala 37:30]
  wire  _T_147; // @[Conditional.scala 37:30]
  wire  _T_148; // @[Conditional.scala 37:30]
  wire  _T_149; // @[Conditional.scala 37:30]
  wire  _T_150; // @[Conditional.scala 37:30]
  wire  _T_151; // @[Conditional.scala 37:55]
  wire  _T_152; // @[Conditional.scala 37:55]
  wire  _T_153; // @[Conditional.scala 37:55]
  wire  _T_154; // @[Conditional.scala 37:55]
  wire  _T_155; // @[Conditional.scala 37:55]
  wire  _T_156; // @[Conditional.scala 37:55]
  wire  _T_157; // @[Conditional.scala 37:55]
  wire  _T_158; // @[Conditional.scala 37:55]
  wire  _T_159; // @[Conditional.scala 37:55]
  wire  _T_160; // @[Conditional.scala 37:55]
  wire  _T_161; // @[Conditional.scala 37:55]
  wire  _T_162; // @[Conditional.scala 37:55]
  wire  _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_46; // @[Conditional.scala 40:58]
  wire  _GEN_47; // @[Conditional.scala 40:58]
  wire  _GEN_48; // @[Conditional.scala 40:58]
  wire  _GEN_49; // @[Conditional.scala 40:58]
  wire  _T_165; // @[Conditional.scala 37:55]
  wire  _GEN_50; // @[IExecute.scala 309:44]
  wire  _GEN_51; // @[IExecute.scala 314:44]
  wire  _T_173; // @[Conditional.scala 37:55]
  wire  _T_175; // @[IExecute.scala 319:33]
  wire  _GEN_52; // @[IExecute.scala 319:46]
  wire  _T_187; // @[Conditional.scala 37:55]
  wire  _T_188; // @[Conditional.scala 37:55]
  wire  _T_189; // @[Conditional.scala 37:55]
  wire  _T_190; // @[Conditional.scala 37:55]
  wire  _T_191; // @[Conditional.scala 37:55]
  wire  _T_192; // @[Conditional.scala 37:55]
  wire  _T_193; // @[Conditional.scala 37:55]
  wire  _T_194; // @[Conditional.scala 37:55]
  wire  _T_195; // @[Conditional.scala 37:55]
  wire  _T_196; // @[Conditional.scala 37:55]
  wire  _GEN_53; // @[IExecute.scala 326:46]
  wire  _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_55; // @[Conditional.scala 39:67]
  wire  _GEN_56; // @[Conditional.scala 39:67]
  wire  _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_59; // @[Conditional.scala 40:58]
  wire  _GEN_60; // @[Conditional.scala 40:58]
  wire  excepttype_b_1; // @[IExecute.scala 284:33]
  wire  excepttype_b_0; // @[IExecute.scala 284:33]
  wire  excepttype_b_3; // @[IExecute.scala 284:33]
  wire  excepttype_b_2; // @[IExecute.scala 284:33]
  wire  excepttype_b_5; // @[IExecute.scala 284:33]
  wire  excepttype_b_4; // @[IExecute.scala 284:33]
  wire  excepttype_b_7; // @[IExecute.scala 284:33]
  wire  excepttype_b_6; // @[IExecute.scala 284:33]
  wire [7:0] _T_205; // @[IExecute.scala 331:37]
  wire  excepttype_b_9; // @[IExecute.scala 284:33]
  wire  excepttype_b_8; // @[IExecute.scala 284:33]
  wire  excepttype_b_11; // @[IExecute.scala 284:33]
  wire  excepttype_b_10; // @[IExecute.scala 284:33]
  wire  excepttype_b_13; // @[IExecute.scala 284:33]
  wire  excepttype_b_12; // @[IExecute.scala 284:33]
  wire  excepttype_b_15; // @[IExecute.scala 284:33]
  wire  excepttype_b_14; // @[IExecute.scala 284:33]
  wire [15:0] _T_213; // @[IExecute.scala 331:37]
  wire  excepttype_b_17; // @[IExecute.scala 284:33]
  wire  excepttype_b_16; // @[IExecute.scala 284:33]
  wire  excepttype_b_19; // @[IExecute.scala 284:33]
  wire  excepttype_b_18; // @[IExecute.scala 284:33]
  wire  excepttype_b_21; // @[IExecute.scala 284:33]
  wire  excepttype_b_20; // @[IExecute.scala 284:33]
  wire  excepttype_b_23; // @[IExecute.scala 284:33]
  wire  excepttype_b_22; // @[IExecute.scala 284:33]
  wire [7:0] _T_220; // @[IExecute.scala 331:37]
  wire  excepttype_b_25; // @[IExecute.scala 284:33]
  wire  excepttype_b_24; // @[IExecute.scala 284:33]
  wire  excepttype_b_27; // @[IExecute.scala 284:33]
  wire  excepttype_b_26; // @[IExecute.scala 284:33]
  wire  excepttype_b_29; // @[IExecute.scala 284:33]
  wire  excepttype_b_28; // @[IExecute.scala 284:33]
  wire  excepttype_b_31; // @[IExecute.scala 284:33]
  wire  excepttype_b_30; // @[IExecute.scala 284:33]
  wire [31:0] _T_229; // @[IExecute.scala 331:37]
  wire  _T_231; // @[Conditional.scala 37:30]
  wire  _T_232; // @[Conditional.scala 37:30]
  wire  _T_233; // @[Conditional.scala 37:30]
  wire  _T_234; // @[Conditional.scala 37:30]
  wire  _T_235; // @[Conditional.scala 37:30]
  wire  _T_236; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_96; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_97; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_98; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_99; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_100; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_101; // @[Conditional.scala 40:58]
  wire [31:0] _T_240; // @[IExecute.scala 369:66]
  wire [31:0] _T_243; // @[IExecute.scala 370:66]
  wire [31:0] _GEN_105; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_106; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_107; // @[Conditional.scala 40:58]
  assign _T_1 = 8'h25 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_2 = io_reg1_i | io_reg2_i; // @[IExecute.scala 107:31]
  assign _T_3 = 8'h24 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_4 = io_reg1_i & io_reg2_i; // @[IExecute.scala 110:31]
  assign _T_5 = 8'h26 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_6 = io_reg1_i ^ io_reg2_i; // @[IExecute.scala 113:31]
  assign _T_8 = 8'h7c == io_aluop_i; // @[Conditional.scala 37:30]
  assign _GEN_109 = {{31'd0}, io_reg1_i}; // @[IExecute.scala 125:31]
  assign _T_10 = _GEN_109 << io_reg2_i[4:0]; // @[IExecute.scala 125:31]
  assign _T_11 = 8'h2 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_13 = io_reg1_i >> io_reg2_i[4:0]; // @[IExecute.scala 128:31]
  assign _T_14 = 8'h3 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_18 = $signed(io_reg1_i) >>> io_reg2_i[4:0]; // @[IExecute.scala 131:58]
  assign _GEN_4 = _T_14 ? _T_18 : 32'h0; // @[Conditional.scala 39:67]
  assign _GEN_5 = _T_11 ? _T_13 : _GEN_4; // @[Conditional.scala 39:67]
  assign _GEN_6 = _T_8 ? _T_10 : {{31'd0}, _GEN_5}; // @[Conditional.scala 40:58]
  assign _GEN_7 = io_rst_n ? _GEN_6 : 63'h0; // @[IExecute.scala 119:33]
  assign _T_20 = 8'h2a == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_23 = $signed(io_reg1_i) < $signed(io_reg2_i); // @[IExecute.scala 144:38]
  assign _T_24 = 8'h2b == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_25 = io_reg1_i < io_reg2_i; // @[IExecute.scala 147:31]
  assign _T_26 = 8'h20 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_28 = io_reg1_i + io_reg2_i; // @[IExecute.scala 150:31]
  assign _T_29 = 8'h22 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_31 = io_reg1_i - io_reg2_i; // @[IExecute.scala 153:31]
  assign _T_33 = 8'h58 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_34 = 8'h59 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_35 = 8'h5a == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_36 = _T_33 | _T_34; // @[Conditional.scala 37:55]
  assign _T_37 = _T_36 | _T_35; // @[Conditional.scala 37:55]
  assign _T_38 = io_aluop_i == 8'h19; // @[IExecute.scala 177:34]
  assign _T_39 = io_aluop_i == 8'ha9; // @[IExecute.scala 177:66]
  assign _T_40 = _T_38 | _T_39; // @[IExecute.scala 177:52]
  assign _T_43 = io_reg1_i[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  assign _T_44 = {_T_43,io_reg1_i}; // @[Cat.scala 29:58]
  assign _T_45 = {32'h0,io_reg1_i}; // @[Cat.scala 29:58]
  assign _T_50 = io_reg2_i[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 71:12]
  assign _T_51 = {_T_50,io_reg2_i}; // @[Cat.scala 29:58]
  assign _T_52 = {32'h0,io_reg2_i}; // @[Cat.scala 29:58]
  assign _T_54 = opdata1_mult * opdata2_mult; // @[IExecute.scala 187:30]
  assign _T_56 = 8'h18 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_58 = 8'h19 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_59 = 8'ha9 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_60 = 8'ha6 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_61 = _T_58 | _T_59; // @[Conditional.scala 37:55]
  assign _T_62 = _T_61 | _T_60; // @[Conditional.scala 37:55]
  assign _T_64 = 8'h1a == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_65 = 8'h1b == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_66 = _T_64 | _T_65; // @[Conditional.scala 37:55]
  assign _T_67 = 8'ha8 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_68 = 8'haa == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_69 = _T_67 | _T_68; // @[Conditional.scala 37:55]
  assign _T_76 = _T_66 | _T_67; // @[Conditional.scala 37:55]
  assign _T_77 = _T_76 | _T_68; // @[Conditional.scala 37:55]
  assign _T_79 = io_aluop_i == 8'h1a; // @[IExecute.scala 244:24]
  assign _T_80 = io_aluop_i == 8'ha8; // @[IExecute.scala 244:55]
  assign _T_81 = _T_79 | _T_80; // @[IExecute.scala 244:41]
  assign _T_89 = io_div_ready_i ? 1'h0 : 1'h1; // @[IExecute.scala 256:34]
  assign _GEN_20 = io_div_started_i ? io_reg1_i : 32'h0; // @[IExecute.scala 248:48]
  assign _GEN_21 = io_div_started_i ? io_reg2_i : 32'h0; // @[IExecute.scala 248:48]
  assign _GEN_23 = io_div_started_i & _T_81; // @[IExecute.scala 248:48]
  assign _GEN_25 = io_div_started_i & _T_89; // @[IExecute.scala 248:48]
  assign _GEN_26 = io_div_started_i ? _GEN_20 : io_reg1_i; // @[IExecute.scala 239:43]
  assign _GEN_27 = io_div_started_i ? _GEN_21 : io_reg2_i; // @[IExecute.scala 239:43]
  assign _GEN_29 = io_div_started_i ? _GEN_23 : _T_81; // @[IExecute.scala 239:43]
  assign _GEN_30 = ~io_div_started_i | io_div_started_i; // @[IExecute.scala 239:43]
  assign _GEN_31 = ~io_div_started_i | _GEN_25; // @[IExecute.scala 239:43]
  assign _GEN_32 = _T_77 ? _GEN_26 : 32'h0; // @[Conditional.scala 40:58]
  assign _GEN_33 = _T_77 ? _GEN_27 : 32'h0; // @[Conditional.scala 40:58]
  assign _GEN_34 = _T_77 & ~io_div_started_i; // @[Conditional.scala 40:58]
  assign _GEN_35 = _T_77 & _GEN_29; // @[Conditional.scala 40:58]
  assign _GEN_36 = _T_77 & _GEN_30; // @[Conditional.scala 40:58]
  assign _GEN_37 = _T_77 & _GEN_31; // @[Conditional.scala 40:58]
  assign _T_127 = 8'he0 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_128 = 8'he4 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_129 = 8'he1 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_130 = 8'he5 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_131 = 8'he3 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_132 = 8'hf0 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_133 = _T_127 | _T_128; // @[Conditional.scala 37:55]
  assign _T_134 = _T_133 | _T_129; // @[Conditional.scala 37:55]
  assign _T_135 = _T_134 | _T_130; // @[Conditional.scala 37:55]
  assign _T_136 = _T_135 | _T_131; // @[Conditional.scala 37:55]
  assign _T_137 = _T_136 | _T_132; // @[Conditional.scala 37:55]
  assign _T_138 = 8'he8 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_139 = 8'he9 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_140 = 8'heb == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_141 = 8'hf8 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_142 = 8'h41 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_143 = 8'h40 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_144 = 8'h44 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_145 = 8'h4c == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_146 = 8'h48 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_147 = 8'h70 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_148 = 8'h54 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_149 = 8'h79 == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_150 = 8'h5c == io_aluop_i; // @[Conditional.scala 37:30]
  assign _T_151 = _T_138 | _T_139; // @[Conditional.scala 37:55]
  assign _T_152 = _T_151 | _T_140; // @[Conditional.scala 37:55]
  assign _T_153 = _T_152 | _T_141; // @[Conditional.scala 37:55]
  assign _T_154 = _T_153 | _T_142; // @[Conditional.scala 37:55]
  assign _T_155 = _T_154 | _T_143; // @[Conditional.scala 37:55]
  assign _T_156 = _T_155 | _T_144; // @[Conditional.scala 37:55]
  assign _T_157 = _T_156 | _T_145; // @[Conditional.scala 37:55]
  assign _T_158 = _T_157 | _T_146; // @[Conditional.scala 37:55]
  assign _T_159 = _T_158 | _T_147; // @[Conditional.scala 37:55]
  assign _T_160 = _T_159 | _T_148; // @[Conditional.scala 37:55]
  assign _T_161 = _T_160 | _T_149; // @[Conditional.scala 37:55]
  assign _T_162 = _T_161 | _T_150; // @[Conditional.scala 37:55]
  assign _GEN_45 = _T_162 ? io_data_tlb_w_exception_o : io_excepttype_i[7]; // @[Conditional.scala 39:67]
  assign _GEN_46 = _T_137 ? 1'h0 : _T_162; // @[Conditional.scala 40:58]
  assign _GEN_47 = _T_137 | _T_162; // @[Conditional.scala 40:58]
  assign _GEN_48 = _T_137 ? io_data_tlb_r_exception_o : io_excepttype_i[5]; // @[Conditional.scala 40:58]
  assign _GEN_49 = _T_137 ? io_excepttype_i[7] : _GEN_45; // @[Conditional.scala 40:58]
  assign _T_165 = _T_129 | _T_130; // @[Conditional.scala 37:55]
  assign _GEN_50 = io_mem_addr_o[0] | io_excepttype_i[4]; // @[IExecute.scala 309:44]
  assign _GEN_51 = io_mem_addr_o[0] | io_excepttype_i[6]; // @[IExecute.scala 314:44]
  assign _T_173 = _T_131 | _T_132; // @[Conditional.scala 37:55]
  assign _T_175 = io_mem_addr_o[1:0] != 2'h0; // @[IExecute.scala 319:33]
  assign _GEN_52 = _T_175 | io_excepttype_i[4]; // @[IExecute.scala 319:46]
  assign _T_187 = _T_140 | _T_141; // @[Conditional.scala 37:55]
  assign _T_188 = _T_187 | _T_142; // @[Conditional.scala 37:55]
  assign _T_189 = _T_188 | _T_143; // @[Conditional.scala 37:55]
  assign _T_190 = _T_189 | _T_144; // @[Conditional.scala 37:55]
  assign _T_191 = _T_190 | _T_145; // @[Conditional.scala 37:55]
  assign _T_192 = _T_191 | _T_146; // @[Conditional.scala 37:55]
  assign _T_193 = _T_192 | _T_147; // @[Conditional.scala 37:55]
  assign _T_194 = _T_193 | _T_148; // @[Conditional.scala 37:55]
  assign _T_195 = _T_194 | _T_149; // @[Conditional.scala 37:55]
  assign _T_196 = _T_195 | _T_150; // @[Conditional.scala 37:55]
  assign _GEN_53 = _T_175 | io_excepttype_i[6]; // @[IExecute.scala 326:46]
  assign _GEN_54 = _T_196 ? _GEN_53 : io_excepttype_i[6]; // @[Conditional.scala 39:67]
  assign _GEN_55 = _T_173 ? _GEN_52 : io_excepttype_i[4]; // @[Conditional.scala 39:67]
  assign _GEN_56 = _T_173 ? io_excepttype_i[6] : _GEN_54; // @[Conditional.scala 39:67]
  assign _GEN_57 = _T_139 ? _GEN_51 : _GEN_56; // @[Conditional.scala 39:67]
  assign _GEN_58 = _T_139 ? io_excepttype_i[4] : _GEN_55; // @[Conditional.scala 39:67]
  assign _GEN_59 = _T_165 ? _GEN_50 : _GEN_58; // @[Conditional.scala 40:58]
  assign _GEN_60 = _T_165 ? io_excepttype_i[6] : _GEN_57; // @[Conditional.scala 40:58]
  assign excepttype_b_1 = io_rst_n ? io_excepttype_i[1] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_0 = io_rst_n ? io_excepttype_i[0] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_3 = io_rst_n ? io_excepttype_i[3] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_2 = io_rst_n ? io_excepttype_i[2] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_5 = io_rst_n ? _GEN_48 : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_4 = io_rst_n ? _GEN_59 : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_7 = io_rst_n ? _GEN_49 : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_6 = io_rst_n ? _GEN_60 : 1'h0; // @[IExecute.scala 284:33]
  assign _T_205 = {excepttype_b_7,excepttype_b_6,excepttype_b_5,excepttype_b_4,excepttype_b_3,excepttype_b_2,excepttype_b_1,excepttype_b_0}; // @[IExecute.scala 331:37]
  assign excepttype_b_9 = io_rst_n ? io_excepttype_i[9] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_8 = io_rst_n ? io_excepttype_i[8] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_11 = io_rst_n ? io_excepttype_i[11] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_10 = io_rst_n ? io_excepttype_i[10] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_13 = io_rst_n ? io_excepttype_i[13] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_12 = io_rst_n ? io_excepttype_i[12] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_15 = io_rst_n ? io_excepttype_i[15] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_14 = io_rst_n ? io_excepttype_i[14] : 1'h0; // @[IExecute.scala 284:33]
  assign _T_213 = {excepttype_b_15,excepttype_b_14,excepttype_b_13,excepttype_b_12,excepttype_b_11,excepttype_b_10,excepttype_b_9,excepttype_b_8,_T_205}; // @[IExecute.scala 331:37]
  assign excepttype_b_17 = io_rst_n ? io_excepttype_i[17] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_16 = io_rst_n ? io_excepttype_i[16] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_19 = io_rst_n ? io_excepttype_i[19] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_18 = io_rst_n ? io_excepttype_i[18] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_21 = io_rst_n ? io_excepttype_i[21] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_20 = io_rst_n ? io_excepttype_i[20] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_23 = io_rst_n ? io_excepttype_i[23] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_22 = io_rst_n ? io_excepttype_i[22] : 1'h0; // @[IExecute.scala 284:33]
  assign _T_220 = {excepttype_b_23,excepttype_b_22,excepttype_b_21,excepttype_b_20,excepttype_b_19,excepttype_b_18,excepttype_b_17,excepttype_b_16}; // @[IExecute.scala 331:37]
  assign excepttype_b_25 = io_rst_n ? io_excepttype_i[25] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_24 = io_rst_n ? io_excepttype_i[24] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_27 = io_rst_n ? io_excepttype_i[27] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_26 = io_rst_n ? io_excepttype_i[26] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_29 = io_rst_n ? io_excepttype_i[29] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_28 = io_rst_n ? io_excepttype_i[28] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_31 = io_rst_n ? io_excepttype_i[31] : 1'h0; // @[IExecute.scala 284:33]
  assign excepttype_b_30 = io_rst_n ? io_excepttype_i[30] : 1'h0; // @[IExecute.scala 284:33]
  assign _T_229 = {excepttype_b_31,excepttype_b_30,excepttype_b_29,excepttype_b_28,excepttype_b_27,excepttype_b_26,excepttype_b_25,excepttype_b_24,_T_220,_T_213}; // @[IExecute.scala 331:37]
  assign _T_231 = 3'h1 == io_alusel_i; // @[Conditional.scala 37:30]
  assign _T_232 = 3'h2 == io_alusel_i; // @[Conditional.scala 37:30]
  assign _T_233 = 3'h3 == io_alusel_i; // @[Conditional.scala 37:30]
  assign _T_234 = 3'h4 == io_alusel_i; // @[Conditional.scala 37:30]
  assign _T_235 = 3'h5 == io_alusel_i; // @[Conditional.scala 37:30]
  assign _T_236 = 3'h6 == io_alusel_i; // @[Conditional.scala 37:30]
  assign _GEN_96 = _T_236 ? io_link_address_i : 32'h0; // @[Conditional.scala 39:67]
  assign _GEN_97 = _T_235 ? multiout : _GEN_96; // @[Conditional.scala 39:67]
  assign _GEN_98 = _T_234 ? arithout : _GEN_97; // @[Conditional.scala 39:67]
  assign _GEN_99 = _T_233 ? moveout : _GEN_98; // @[Conditional.scala 39:67]
  assign _GEN_100 = _T_232 ? shiftout : _GEN_99; // @[Conditional.scala 39:67]
  assign _GEN_101 = _T_231 ? logicout : _GEN_100; // @[Conditional.scala 40:58]
  assign _T_240 = io_csr_reg_data_i | io_reg1_i; // @[IExecute.scala 369:66]
  assign _T_243 = io_csr_reg_data_i & ~io_reg1_i; // @[IExecute.scala 370:66]
  assign _GEN_105 = _T_35 ? _T_243 : 32'h0; // @[Conditional.scala 39:67]
  assign _GEN_106 = _T_34 ? _T_240 : _GEN_105; // @[Conditional.scala 39:67]
  assign _GEN_107 = _T_33 ? io_reg1_i : _GEN_106; // @[Conditional.scala 40:58]
  assign io_csr_reg_we_o = io_csr_reg_we_i; // @[IExecute.scala 361:19]
  assign io_csr_reg_addr_o = io_csr_reg_addr_i; // @[IExecute.scala 360:21]
  assign io_csr_reg_data_o = io_rst_n ? _GEN_107 : 32'h0; // @[IExecute.scala 362:21 IExecute.scala 364:23 IExecute.scala 366:23 IExecute.scala 368:45 IExecute.scala 369:45 IExecute.scala 370:45]
  assign io_wreg_o = io_rst_n ? io_wreg_i : 1'h0; // @[IExecute.scala 338:13 IExecute.scala 342:15 IExecute.scala 347:15]
  assign io_wd_o = io_rst_n ? io_wd_i : 5'h0; // @[IExecute.scala 339:11 IExecute.scala 343:13 IExecute.scala 346:13]
  assign io_wdata_o = io_rst_n ? _GEN_101 : 32'h0; // @[IExecute.scala 340:14 IExecute.scala 344:16 IExecute.scala 348:16 IExecute.scala 350:45 IExecute.scala 351:45 IExecute.scala 352:45 IExecute.scala 353:45 IExecute.scala 354:45 IExecute.scala 355:45]
  assign io_cnt_o = 2'h0; // @[IExecute.scala 92:12]
  assign io_div_started_o = io_rst_n ? _GEN_36 : 1'h0; // @[IExecute.scala 220:20 IExecute.scala 228:22 IExecute.scala 246:28 IExecute.scala 255:28]
  assign io_div_opdata1_o = io_rst_n ? _GEN_32 : 32'h0; // @[IExecute.scala 215:20 IExecute.scala 223:22 IExecute.scala 231:22 IExecute.scala 240:28 IExecute.scala 249:28]
  assign io_div_opdata2_o = io_rst_n ? _GEN_33 : 32'h0; // @[IExecute.scala 216:20 IExecute.scala 224:22 IExecute.scala 232:22 IExecute.scala 241:28 IExecute.scala 250:28]
  assign io_div_start_o = io_rst_n ? _GEN_34 : 1'h0; // @[IExecute.scala 217:18 IExecute.scala 219:18 IExecute.scala 225:20 IExecute.scala 227:20 IExecute.scala 233:20 IExecute.scala 235:20 IExecute.scala 242:26 IExecute.scala 251:26]
  assign io_signed_div_o = io_rst_n ? _GEN_35 : 1'h0; // @[IExecute.scala 218:19 IExecute.scala 226:21 IExecute.scala 234:21 IExecute.scala 243:27 IExecute.scala 252:27]
  assign io_aluop_o = io_aluop_i; // @[IExecute.scala 266:14]
  assign io_mem_addr_o = io_mem_addr_i; // @[IExecute.scala 267:17]
  assign io_reg2_o = io_reg2_i; // @[IExecute.scala 268:13]
  assign io_mem_we_o = io_rst_n ? _GEN_46 : 1'h0; // @[IExecute.scala 281:15 IExecute.scala 285:17 IExecute.scala 293:21 IExecute.scala 300:21]
  assign io_mem_ce_o = io_rst_n ? _GEN_47 : 1'h0; // @[IExecute.scala 282:15 IExecute.scala 286:17 IExecute.scala 294:21 IExecute.scala 301:21]
  assign io_excepttype_o = io_rst_n ? _T_229 : 32'h0; // @[IExecute.scala 283:19 IExecute.scala 287:21 IExecute.scala 331:21]
  assign io_is_in_delayslot_o = io_is_in_delayslot_i; // @[IExecute.scala 89:24]
  assign io_current_inst_address_o = io_current_inst_address_i; // @[IExecute.scala 90:29]
  assign io_not_stall_o = io_not_stall_i; // @[IExecute.scala 91:18]
  assign io_mem_phy_addr_o = io_mem_phy_addr_i; // @[IExecute.scala 269:21]
  assign io_data_tlb_r_exception_o = ~io_mem_we_o & io_data_tlb_exception_i; // @[IExecute.scala 270:29]
  assign io_data_tlb_w_exception_o = io_mem_we_o & io_data_tlb_exception_i; // @[IExecute.scala 274:29]
  assign io_stallreq = stallreq_for_div; // @[IExecute.scala 335:15]
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
  logicout = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  shiftout = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  moveout = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  arithout = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  multiout = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  opdata1_mult = _RAND_5[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {2{`RANDOM}};
  opdata2_mult = _RAND_6[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {2{`RANDOM}};
  result_mul = _RAND_7[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  stallreq_for_div = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(*) begin
    if (~io_rst_n) begin
      logicout <= 32'h0;
    end else if (~io_rst_n) begin
      logicout <= 32'h0;
    end else if (_T_1) begin
      logicout <= _T_2;
    end else if (_T_3) begin
      logicout <= _T_4;
    end else if (_T_5) begin
      logicout <= _T_6;
    end else begin
      logicout <= 32'h0;
    end
    if (~io_rst_n) begin
      shiftout <= 32'h0;
    end else begin
      shiftout <= _GEN_7[31:0];
    end
    if (~io_rst_n) begin
      moveout <= 32'h0;
    end else if (~io_rst_n) begin
      moveout <= 32'h0;
    end else if (_T_37) begin
      moveout <= io_csr_reg_data_i;
    end else begin
      moveout <= 32'h0;
    end
    if (~io_rst_n) begin
      arithout <= 32'h0;
    end else if (~io_rst_n) begin
      arithout <= 32'h0;
    end else if (_T_20) begin
      arithout <= {{31'd0}, _T_23};
    end else if (_T_24) begin
      arithout <= {{31'd0}, _T_25};
    end else if (_T_26) begin
      arithout <= _T_28;
    end else if (_T_29) begin
      arithout <= _T_31;
    end else begin
      arithout <= 32'h0;
    end
    if (~io_rst_n) begin
      multiout <= 32'h0;
    end else if (~io_rst_n) begin
      multiout <= 32'h0;
    end else if (_T_56) begin
      multiout <= result_mul[31:0];
    end else if (_T_62) begin
      multiout <= result_mul[63:32];
    end else if (_T_66) begin
      multiout <= io_div_result_div_i;
    end else if (_T_69) begin
      multiout <= io_div_result_rem_i;
    end else begin
      multiout <= 32'h0;
    end
    if (_T_40) begin
      opdata1_mult <= _T_44;
    end else begin
      opdata1_mult <= _T_45;
    end
    if (_T_38) begin
      opdata2_mult <= _T_51;
    end else begin
      opdata2_mult <= _T_52;
    end
    result_mul <= _T_54[63:0];
    if (~io_rst_n) begin
      stallreq_for_div <= 1'h0;
    end else begin
      stallreq_for_div <= _GEN_37;
    end
  end
endmodule
