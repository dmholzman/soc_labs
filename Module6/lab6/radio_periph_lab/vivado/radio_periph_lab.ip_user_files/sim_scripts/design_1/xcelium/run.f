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
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_iic_v2_1_2 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/eddf/hdl/axi_iic_v2_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_axi_iic_0_0/sim/design_1_axi_iic_0_0.vhd" \
  "../../../bd/design_1/ipshared/e8d1/src/clkdivider.vhd" \
  "../../../bd/design_1/ipshared/e8d1/src/low_level_dac_if.vhd" \
  "../../../bd/design_1/ip/design_1_lowlevel_dac_intfc_0_0/sim/design_1_lowlevel_dac_intfc_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_12 -sv \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_14 -sv \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/5765/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_26 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_7 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_25 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_27 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/3fa0/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_ps7_0_125M_0/sim/design_1_rst_ps7_0_125M_0.vhd" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/sim/bd_f60c.vhd" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_0/sim/bd_f60c_ila_lib_0.vhd" \
-endlib
-makelib xcelium_lib/gigantic_mux \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/e87a/hdl/gigantic_mux_v1_0_cntr.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_1/bd_f60c_g_inst_0_gigantic_mux.v" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_1/sim/bd_f60c_g_inst_0.v" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_4 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_2/sim/bd_f60c_slot_1_aw_0.v" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_3/sim/bd_f60c_slot_1_w_0.v" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_4/sim/bd_f60c_slot_1_b_0.v" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_5/sim/bd_f60c_slot_1_ar_0.v" \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/bd_0/ip/ip_6/sim/bd_f60c_slot_1_r_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_system_ila_0_0/sim/design_1_system_ila_0_0.vhd" \
-endlib
-makelib xcelium_lib/xpm_cdc_gen_v1_0_1 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/4c7c/hdl/xpm_cdc_gen_v1_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_xpm_cdc_gen_0_0/sim/design_1_xpm_cdc_gen_0_0.v" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/fir2/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_utils_v2_0_6 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/fir2/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/fir_compiler_v7_2_18 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/fir2/hdl/fir_compiler_v7_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_full_radio_0_0/src/fir2/sim/fir2.vhd" \
  "../../../bd/design_1/ip/design_1_full_radio_0_0/src/fir1/sim/fir1.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/cmpy_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_6 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/cmpy_0/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_18 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/cmpy_0/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/cmpy_v6_0_21 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/cmpy_0/hdl/cmpy_v6_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_full_radio_0_0/src/cmpy_0/sim/cmpy_0.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/dds_compiler_tune/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_addsub_v3_0_6 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/dds_compiler_tune/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_multadd_v3_0_6 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/dds_compiler_tune/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/dds_compiler_v6_0_22 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ip/design_1_full_radio_0_0/src/dds_compiler_tune/hdl/dds_compiler_v6_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_full_radio_0_0/src/dds_compiler_tune/sim/dds_compiler_tune.vhd" \
  "../../../bd/design_1/ip/design_1_full_radio_0_0/src/dds_compiler_sig/sim/dds_compiler_sig.vhd" \
  "../../../bd/design_1/ipshared/cbb7/hdl/full_radio_v1_0_S00_AXI.vhd" \
  "../../../bd/design_1/ipshared/cbb7/hdl/full_radio_v1_0.vhd" \
  "../../../bd/design_1/ip/design_1_full_radio_0_0/sim/design_1_full_radio_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_26 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_25 \
  "../../../../radio_periph_lab.gen/sources_1/bd/design_1/ipshared/e893/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_cc_0/sim/design_1_auto_cc_0.v" \
  "../../../bd/design_1/ip/design_1_auto_cc_1/sim/design_1_auto_cc_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/design_1/sim/design_1.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

