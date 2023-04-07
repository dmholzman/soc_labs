// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Sun Feb 26 13:51:24 2023
// Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module3/lab3b/vivado/lab3b.gen/sources_1/bd/proc_system/ip/proc_system_xpm_cdc_gen_1_0/proc_system_xpm_cdc_gen_1_0_stub.v
// Design      : proc_system_xpm_cdc_gen_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xpm_cdc_gen_v1_0_1,Vivado 2022.1" *)
module proc_system_xpm_cdc_gen_1_0(src_clk, dest_clk, src_in, dest_out)
/* synthesis syn_black_box black_box_pad_pin="src_clk,dest_clk,src_in[0:0],dest_out[0:0]" */;
  input src_clk;
  input dest_clk;
  input [0:0]src_in;
  output [0:0]dest_out;
endmodule
