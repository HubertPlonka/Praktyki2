// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Sep  7 14:20:12 2020
// Host        : DESKTOP-90OJ9O8 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/hubel/Desktop/Praktyki2/FSM/FSM.sim/sim_1/impl/timing/xsim/fsm_tb_time_impl.v
// Design      : fsm
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "da82beee" *) (* S0 = "0" *) (* S1 = "1" *) 
(* NotValidForBitStream *)
module fsm
   (clk,
    rst,
    x,
    en,
    par);
  input clk;
  input rst;
  input x;
  input en;
  output par;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire en;
  wire en_IBUF;
  wire en_IBUF_BUFG;
  wire naststan;
  wire naststan_reg_i_1_n_0;
  wire par;
  wire par_OBUF;
  wire rst;
  wire rst_IBUF;
  wire x;
  wire x_IBUF;

initial begin
 $sdf_annotate("fsm_tb_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  BUFG en_IBUF_BUFG_inst
       (.I(en_IBUF),
        .O(en_IBUF_BUFG));
  IBUF en_IBUF_inst
       (.I(en),
        .O(en_IBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    naststan_reg
       (.CLR(1'b0),
        .D(naststan_reg_i_1_n_0),
        .G(en_IBUF_BUFG),
        .GE(1'b1),
        .Q(naststan));
  LUT2 #(
    .INIT(4'h2)) 
    naststan_reg_i_1
       (.I0(x_IBUF),
        .I1(par_OBUF),
        .O(naststan_reg_i_1_n_0));
  OBUF par_OBUF_inst
       (.I(par_OBUF),
        .O(par));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  FDCE #(
    .INIT(1'b0)) 
    stan_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(rst_IBUF),
        .D(naststan),
        .Q(par_OBUF));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
