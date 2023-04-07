vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xilinx_vip
vlib questa_lib/msim/xpm
vlib questa_lib/msim/lib_pkg_v1_0_2
vlib questa_lib/msim/lib_cdc_v1_0_2
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/interrupt_control_v3_1_4
vlib questa_lib/msim/axi_iic_v2_1_2
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/axi_infrastructure_v1_1_0
vlib questa_lib/msim/axi_vip_v1_1_12
vlib questa_lib/msim/processing_system7_vip_v1_0_14
vlib questa_lib/msim/generic_baseblocks_v2_1_0
vlib questa_lib/msim/axi_register_slice_v2_1_26
vlib questa_lib/msim/fifo_generator_v13_2_7
vlib questa_lib/msim/axi_data_fifo_v2_1_25
vlib questa_lib/msim/axi_crossbar_v2_1_27
vlib questa_lib/msim/axi_gpio_v2_0_28
vlib questa_lib/msim/proc_sys_reset_v5_0_13
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/axi_utils_v2_0_6
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_bram18k_v3_0_6
vlib questa_lib/msim/mult_gen_v12_0_18
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib questa_lib/msim/dds_compiler_v6_0_22
vlib questa_lib/msim/gigantic_mux
vlib questa_lib/msim/xpm_cdc_gen_v1_0_1
vlib questa_lib/msim/fir_compiler_v7_2_18
vlib questa_lib/msim/axis_infrastructure_v1_1_0
vlib questa_lib/msim/axis_broadcaster_v1_1_25
vlib questa_lib/msim/xlslice_v1_0_2
vlib questa_lib/msim/axi_protocol_converter_v2_1_26

vmap xilinx_vip questa_lib/msim/xilinx_vip
vmap xpm questa_lib/msim/xpm
vmap lib_pkg_v1_0_2 questa_lib/msim/lib_pkg_v1_0_2
vmap lib_cdc_v1_0_2 questa_lib/msim/lib_cdc_v1_0_2
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_4 questa_lib/msim/interrupt_control_v3_1_4
vmap axi_iic_v2_1_2 questa_lib/msim/axi_iic_v2_1_2
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap axi_infrastructure_v1_1_0 questa_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_12 questa_lib/msim/axi_vip_v1_1_12
vmap processing_system7_vip_v1_0_14 questa_lib/msim/processing_system7_vip_v1_0_14
vmap generic_baseblocks_v2_1_0 questa_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_26 questa_lib/msim/axi_register_slice_v2_1_26
vmap fifo_generator_v13_2_7 questa_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_25 questa_lib/msim/axi_data_fifo_v2_1_25
vmap axi_crossbar_v2_1_27 questa_lib/msim/axi_crossbar_v2_1_27
vmap axi_gpio_v2_0_28 questa_lib/msim/axi_gpio_v2_0_28
vmap proc_sys_reset_v5_0_13 questa_lib/msim/proc_sys_reset_v5_0_13
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 questa_lib/msim/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 questa_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_18 questa_lib/msim/mult_gen_v12_0_18
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap dds_compiler_v6_0_22 questa_lib/msim/dds_compiler_v6_0_22
vmap gigantic_mux questa_lib/msim/gigantic_mux
vmap xpm_cdc_gen_v1_0_1 questa_lib/msim/xpm_cdc_gen_v1_0_1
vmap fir_compiler_v7_2_18 questa_lib/msim/fir_compiler_v7_2_18
vmap axis_infrastructure_v1_1_0 questa_lib/msim/axis_infrastructure_v1_1_0
vmap axis_broadcaster_v1_1_25 questa_lib/msim/axis_broadcaster_v1_1_25
vmap xlslice_v1_0_2 questa_lib/msim/xlslice_v1_0_2
vmap axi_protocol_converter_v2_1_26 questa_lib/msim/axi_protocol_converter_v2_1_26

vlog -work xilinx_vip  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_4  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_iic_v2_1_2  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/eddf/hdl/axi_iic_v2_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/ip/proc_system_axi_iic_0_0/sim/proc_system_axi_iic_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_12  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_14  -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_processing_system7_0_0/sim/proc_system_processing_system7_0_0.v" \

vlog -work generic_baseblocks_v2_1_0  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_26  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_25  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_27  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/3fa0/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_xbar_0/sim/proc_system_xbar_0.v" \

vcom -work axi_gpio_v2_0_28  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/3ed9/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/ip/proc_system_reset_and_leds_0/sim/proc_system_reset_and_leds_0.vhd" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/ip/proc_system_rst_ps7_0_50M_0/sim/proc_system_rst_ps7_0_50M_0.vhd" \

vcom -work xbip_utils_v3_0_10  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/364f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_18  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ab19/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work dds_compiler_v6_0_22  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/a99f/hdl/dds_compiler_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/ip/proc_system_dds_compiler_0_0/sim/proc_system_dds_compiler_0_0.vhd" \
"../../../bd/proc_system/ip/proc_system_axi_gpio_0_0/sim/proc_system_axi_gpio_0_0.vhd" \
"../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/sim/bd_395b.vhd" \
"../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/ip/ip_0/sim/bd_395b_ila_lib_0.vhd" \

vlog -work gigantic_mux  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/e87a/hdl/gigantic_mux_v1_0_cntr.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/ip/ip_1/bd_395b_g_inst_0_gigantic_mux.v" \
"../../../bd/proc_system/ip/proc_system_system_ila_0_1/bd_0/ip/ip_1/sim/bd_395b_g_inst_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/ip/proc_system_system_ila_0_1/sim/proc_system_system_ila_0_1.vhd" \

vlog -work xpm_cdc_gen_v1_0_1  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/4c7c/hdl/xpm_cdc_gen_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_1_0/sim/proc_system_xpm_cdc_gen_1_0.v" \
"../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_0_1/sim/proc_system_xpm_cdc_gen_0_1.v" \
"../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_0_2/sim/proc_system_xpm_cdc_gen_0_2.v" \
"../../../bd/proc_system/ip/proc_system_xpm_cdc_gen_0_3/sim/proc_system_xpm_cdc_gen_0_3.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/sim/proc_system.vhd" \

vcom -work fir_compiler_v7_2_18  -93 \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/d172/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/proc_system/ip/proc_system_fir_compiler_0_0/sim/proc_system_fir_compiler_0_0.vhd" \
"../../../bd/proc_system/ip/proc_system_fir_compiler_1_0/sim/proc_system_fir_compiler_1_0.vhd" \

vlog -work axis_infrastructure_v1_1_0  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_axis_broadcaster_0_0/hdl/tdata_proc_system_axis_broadcaster_0_0.v" \
"../../../bd/proc_system/ip/proc_system_axis_broadcaster_0_0/hdl/tuser_proc_system_axis_broadcaster_0_0.v" \

vlog -work axis_broadcaster_v1_1_25  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/eb3a/hdl/axis_broadcaster_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_axis_broadcaster_0_0/hdl/top_proc_system_axis_broadcaster_0_0.v" \
"../../../bd/proc_system/ip/proc_system_axis_broadcaster_0_0/sim/proc_system_axis_broadcaster_0_0.v" \

vlog -work xlslice_v1_0_2  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_xlslice_0_0/sim/proc_system_xlslice_0_0.v" \

vlog -work axi_protocol_converter_v2_1_26  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../lab4.gen/sources_1/bd/proc_system/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/ec67/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/5765/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/8713/hdl" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/1b7e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/122e/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/b205/hdl/verilog" "+incdir+../../../../lab4.gen/sources_1/bd/proc_system/ipshared/fd26/hdl/verilog" "+incdir+C:/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/proc_system/ip/proc_system_auto_pc_0/sim/proc_system_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

