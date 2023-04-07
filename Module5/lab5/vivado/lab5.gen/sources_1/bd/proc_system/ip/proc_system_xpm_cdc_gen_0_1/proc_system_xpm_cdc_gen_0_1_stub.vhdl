-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Mon Mar 27 22:13:56 2023
-- Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top proc_system_xpm_cdc_gen_0_1 -prefix
--               proc_system_xpm_cdc_gen_0_1_ proc_system_xpm_cdc_gen_0_1_stub.vhdl
-- Design      : proc_system_xpm_cdc_gen_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_system_xpm_cdc_gen_0_1 is
  Port ( 
    dest_clk : in STD_LOGIC;
    dest_arst : out STD_LOGIC;
    src_arst : in STD_LOGIC
  );

end proc_system_xpm_cdc_gen_0_1;

architecture stub of proc_system_xpm_cdc_gen_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "dest_clk,dest_arst,src_arst";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xpm_cdc_gen_v1_0_1,Vivado 2022.1";
begin
end;