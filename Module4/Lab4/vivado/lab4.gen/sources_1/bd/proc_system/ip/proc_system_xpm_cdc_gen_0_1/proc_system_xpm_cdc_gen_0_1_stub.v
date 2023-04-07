// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Wed Mar  8 20:15:16 2023
// Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module4/Lab4/vivado/lab4.gen/sources_1/bd/proc_system/ip/proc_system_xpm_cdc_gen_0_1/proc_system_xpm_cdc_gen_0_1_stub.v
// Design      : proc_system_xpm_cdc_gen_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xpm_cdc_gen_v1_0_1,Vivado 2022.1" *)
module proc_system_xpm_cdc_gen_0_1(dest_clk, dest_arst, src_arst)
/* synthesis syn_black_box black_box_pad_pin="dest_clk,dest_arst,src_arst" */;
  input dest_clk;
  output dest_arst;
  input src_arst;
endmodule
