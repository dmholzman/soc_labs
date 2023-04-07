-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_iic_v2_1_2 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/eddf/hdl/axi_iic_v2_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_axi_iic_0_0/sim/proc_system_axi_iic_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_12 -sv \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_14 -sv \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/5765/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_processing_system7_0_0/sim/proc_system_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_26 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_25 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_27 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/3fa0/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_xbar_0/sim/proc_system_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_28 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/3ed9/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_reset_and_leds_0/sim/proc_system_reset_and_leds_0.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_rst_ps7_0_50M_0/sim/proc_system_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/364f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_utils_v2_0_6 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_6 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_18 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/ab19/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_addsub_v3_0_6 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_multadd_v3_0_6 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/dds_compiler_v6_0_22 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/a99f/hdl/dds_compiler_v6_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_dds_compiler_0_0/sim/proc_system_dds_compiler_0_0.vhd" \
  "../../../bd/proc_system/ip/proc_system_axi_gpio_0_0/sim/proc_system_axi_gpio_0_0.vhd" \
  "../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/ip/ip_0/sim/bd_395b_ila_lib_0.vhd" \
-endlib
-makelib xcelium_lib/gigantic_mux \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/e87a/hdl/gigantic_mux_v1_0_cntr.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/ip/ip_1/bd_395b_g_inst_0_gigantic_mux.v" \
  "../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/ip/ip_1/sim/bd_395b_g_inst_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/sim/bd_395b.vhd" \
  "../../../bd/proc_system/ip/proc_system_system_ila_0_1/sim/proc_system_system_ila_0_1.vhd" \
-endlib
-makelib xcelium_lib/xpm_cdc_gen_v1_0_1 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/4c7c/hdl/xpm_cdc_gen_v1_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_1_0/sim/proc_system_xpm_cdc_gen_1_0.v" \
  "../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_0_1/sim/proc_system_xpm_cdc_gen_0_1.v" \
  "../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_0_2/sim/proc_system_xpm_cdc_gen_0_2.v" \
  "../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_0_3/sim/proc_system_xpm_cdc_gen_0_3.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/sim/proc_system.vhd" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_26 \
  "../../../../lab3b.gen/sources_1/bd/proc_system/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/proc_system/ip/proc_system_auto_pc_0/sim/proc_system_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

