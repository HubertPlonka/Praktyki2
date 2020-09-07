// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Sep  7 14:00:24 2020
// Host        : DESKTOP-90OJ9O8 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/hubel/Desktop/Praktyki2/Licznik/Licznik.sim/sim_1/impl/func/xsim/licznik_tb_func_impl.v
// Design      : licznik
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7s100fgga676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "a92b110e" *) 
(* NotValidForBitStream *)
module licznik
   (CLOCK,
    START,
    RESET,
    UP,
    LOAD,
    loading,
    outputs);
  input CLOCK;
  input START;
  input RESET;
  input UP;
  input LOAD;
  input [2:0]loading;
  output [2:0]outputs;

  wire CLOCK;
  wire CLOCK_IBUF;
  wire CLOCK_IBUF_BUFG;
  wire LOAD;
  wire LOAD_IBUF;
  wire RESET;
  wire RESET_IBUF;
  wire START;
  wire START_IBUF;
  wire UP;
  wire UP_IBUF;
  wire [2:0]loading;
  wire [2:0]loading_IBUF;
  wire [2:0]outputs;
  wire \outputs[0]_i_1_n_0 ;
  wire \outputs[0]_i_2_n_0 ;
  wire \outputs[1]_i_1_n_0 ;
  wire \outputs[1]_i_2_n_0 ;
  wire \outputs[2]_i_1_n_0 ;
  wire \outputs[2]_i_2_n_0 ;
  wire \outputs[2]_i_3_n_0 ;
  wire [2:0]outputs_OBUF;

  BUFG CLOCK_IBUF_BUFG_inst
       (.I(CLOCK_IBUF),
        .O(CLOCK_IBUF_BUFG));
  IBUF CLOCK_IBUF_inst
       (.I(CLOCK),
        .O(CLOCK_IBUF));
  IBUF LOAD_IBUF_inst
       (.I(LOAD),
        .O(LOAD_IBUF));
  IBUF RESET_IBUF_inst
       (.I(RESET),
        .O(RESET_IBUF));
  IBUF START_IBUF_inst
       (.I(START),
        .O(START_IBUF));
  IBUF UP_IBUF_inst
       (.I(UP),
        .O(UP_IBUF));
  IBUF \loading_IBUF[0]_inst 
       (.I(loading[0]),
        .O(loading_IBUF[0]));
  IBUF \loading_IBUF[1]_inst 
       (.I(loading[1]),
        .O(loading_IBUF[1]));
  IBUF \loading_IBUF[2]_inst 
       (.I(loading[2]),
        .O(loading_IBUF[2]));
  LUT6 #(
    .INIT(64'hFFFFFF8FF0F0F080)) 
    \outputs[0]_i_1 
       (.I0(loading_IBUF[0]),
        .I1(LOAD_IBUF),
        .I2(START_IBUF),
        .I3(\outputs[0]_i_2_n_0 ),
        .I4(\outputs[2]_i_3_n_0 ),
        .I5(outputs_OBUF[0]),
        .O(\outputs[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010111111)) 
    \outputs[0]_i_2 
       (.I0(LOAD_IBUF),
        .I1(RESET_IBUF),
        .I2(UP_IBUF),
        .I3(outputs_OBUF[2]),
        .I4(outputs_OBUF[1]),
        .I5(outputs_OBUF[0]),
        .O(\outputs[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1F10)) 
    \outputs[1]_i_1 
       (.I0(\outputs[2]_i_3_n_0 ),
        .I1(\outputs[1]_i_2_n_0 ),
        .I2(START_IBUF),
        .I3(outputs_OBUF[1]),
        .O(\outputs[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFFEBBEEBBE)) 
    \outputs[1]_i_2 
       (.I0(RESET_IBUF),
        .I1(UP_IBUF),
        .I2(outputs_OBUF[0]),
        .I3(outputs_OBUF[1]),
        .I4(loading_IBUF[1]),
        .I5(LOAD_IBUF),
        .O(\outputs[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF8FF0F0F080)) 
    \outputs[2]_i_1 
       (.I0(loading_IBUF[2]),
        .I1(LOAD_IBUF),
        .I2(START_IBUF),
        .I3(\outputs[2]_i_2_n_0 ),
        .I4(\outputs[2]_i_3_n_0 ),
        .I5(outputs_OBUF[2]),
        .O(\outputs[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000006A89)) 
    \outputs[2]_i_2 
       (.I0(outputs_OBUF[2]),
        .I1(outputs_OBUF[0]),
        .I2(outputs_OBUF[1]),
        .I3(UP_IBUF),
        .I4(LOAD_IBUF),
        .I5(RESET_IBUF),
        .O(\outputs[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00810300)) 
    \outputs[2]_i_3 
       (.I0(UP_IBUF),
        .I1(outputs_OBUF[2]),
        .I2(outputs_OBUF[1]),
        .I3(RESET_IBUF),
        .I4(outputs_OBUF[0]),
        .O(\outputs[2]_i_3_n_0 ));
  OBUF \outputs_OBUF[0]_inst 
       (.I(outputs_OBUF[0]),
        .O(outputs[0]));
  OBUF \outputs_OBUF[1]_inst 
       (.I(outputs_OBUF[1]),
        .O(outputs[1]));
  OBUF \outputs_OBUF[2]_inst 
       (.I(outputs_OBUF[2]),
        .O(outputs[2]));
  FDRE #(
    .INIT(1'b0)) 
    \outputs_reg[0] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\outputs[0]_i_1_n_0 ),
        .Q(outputs_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \outputs_reg[1] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\outputs[1]_i_1_n_0 ),
        .Q(outputs_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \outputs_reg[2] 
       (.C(CLOCK_IBUF_BUFG),
        .CE(1'b1),
        .D(\outputs[2]_i_1_n_0 ),
        .Q(outputs_OBUF[2]),
        .R(1'b0));
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
