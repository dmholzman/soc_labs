-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Mon Apr 10 13:34:15 2023
-- Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module6/lab6/radio_periph_lab/ip_repo/full_radio/src/cmpy_0/cmpy_0_stub.vhdl
-- Design      : cmpy_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cmpy_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_a_tvalid : in STD_LOGIC;
    s_axis_a_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_b_tvalid : in STD_LOGIC;
    s_axis_b_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

end cmpy_0;

architecture stub of cmpy_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axis_a_tvalid,s_axis_a_tdata[31:0],s_axis_b_tvalid,s_axis_b_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tdata[47:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "cmpy_v6_0_21,Vivado 2022.1";
begin
end;
