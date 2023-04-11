// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Mon Apr 10 13:34:15 2023
// Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module6/lab6/radio_periph_lab/ip_repo/full_radio/src/cmpy_0/cmpy_0_stub.v
// Design      : cmpy_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cmpy_v6_0_21,Vivado 2022.1" *)
module cmpy_0(aclk, aresetn, s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_b_tvalid, s_axis_b_tdata, m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_a_tvalid,s_axis_a_tdata[31:0],s_axis_b_tvalid,s_axis_b_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tdata[47:0]" */;
  input aclk;
  input aresetn;
  input s_axis_a_tvalid;
  input [31:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [31:0]s_axis_b_tdata;
  output m_axis_dout_tvalid;
  output [47:0]m_axis_dout_tdata;
endmodule
