-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
-- Date        : Sun Feb 26 13:51:24 2023
-- Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/Dirk/Grad_School/525.742.8VL_SOC/HW/Module3/lab3b/vivado/lab3b.gen/sources_1/bd/proc_system/ip/proc_system_xpm_cdc_gen_0_1/proc_system_xpm_cdc_gen_0_1_sim_netlist.vhdl
-- Design      : proc_system_xpm_cdc_gen_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst is
  port (
    src_arst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_arst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is "1'b1";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is 0;
  attribute INV_DEF_VAL : string;
  attribute INV_DEF_VAL of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is "1'b0";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is "xpm_cdc_async_rst";
  attribute RST_ACTIVE_HIGH : integer;
  attribute RST_ACTIVE_HIGH of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst : entity is "ASYNC_RST";
end proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst;

architecture STRUCTURE of proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst is
  signal arststages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of arststages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of arststages_ff : signal is "true";
  attribute xpm_cdc of arststages_ff : signal is "ASYNC_RST";
  signal reset_pol : STD_LOGIC;
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \arststages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \arststages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[0]\ : label is "ASYNC_RST";
  attribute ASYNC_REG_boolean of \arststages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \arststages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[1]\ : label is "ASYNC_RST";
  attribute ASYNC_REG_boolean of \arststages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \arststages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[2]\ : label is "ASYNC_RST";
  attribute ASYNC_REG_boolean of \arststages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \arststages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \arststages_ff_reg[3]\ : label is "ASYNC_RST";
begin
  dest_arst <= arststages_ff(3);
\arststages_ff[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => src_arst,
      O => reset_pol
    );
\arststages_ff_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => dest_clk,
      CE => '1',
      CLR => reset_pol,
      D => '1',
      Q => arststages_ff(0)
    );
\arststages_ff_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => dest_clk,
      CE => '1',
      CLR => reset_pol,
      D => arststages_ff(0),
      Q => arststages_ff(1)
    );
\arststages_ff_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => dest_clk,
      CE => '1',
      CLR => reset_pol,
      D => arststages_ff(1),
      Q => arststages_ff(2)
    );
\arststages_ff_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '1'
    )
        port map (
      C => dest_clk,
      CE => '1',
      CLR => reset_pol,
      D => arststages_ff(2),
      Q => arststages_ff(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 is
  port (
    src_clk : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    src_in_bin : in STD_LOGIC_VECTOR ( 0 to 0 );
    src_in : in STD_LOGIC_VECTOR ( 0 to 0 );
    src_send : in STD_LOGIC;
    dest_ack : in STD_LOGIC;
    src_pulse : in STD_LOGIC;
    src_rst : in STD_LOGIC;
    dest_rst_in : in STD_LOGIC;
    src_arst : in STD_LOGIC;
    dest_out : out STD_LOGIC_VECTOR ( 0 to 0 );
    dest_out_bin : out STD_LOGIC_VECTOR ( 0 to 0 );
    src_rcv : out STD_LOGIC;
    dest_req : out STD_LOGIC;
    dest_pulse : out STD_LOGIC;
    dest_rst_out : out STD_LOGIC;
    dest_arst : out STD_LOGIC
  );
  attribute C_CDC_TYPE : integer;
  attribute C_CDC_TYPE of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 2;
  attribute DEST_CLK_PERIOD : integer;
  attribute DEST_CLK_PERIOD of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 2500;
  attribute DEST_EXT_HSK : integer;
  attribute DEST_EXT_HSK of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 1;
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 4;
  attribute INIT : string;
  attribute INIT of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is "1";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is "xpm_cdc_gen_v1_0_1";
  attribute REG_OUTPUT : integer;
  attribute REG_OUTPUT of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 0;
  attribute RST_ACTIVE_HIGH : integer;
  attribute RST_ACTIVE_HIGH of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 0;
  attribute RST_USED : integer;
  attribute RST_USED of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 1;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 1;
  attribute SIM_LOSSLESS_GRAY_CHK : integer;
  attribute SIM_LOSSLESS_GRAY_CHK of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 0;
  attribute SRC_CLK_PERIOD : integer;
  attribute SRC_CLK_PERIOD of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 5000;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 1;
  attribute SRC_SYNC_FF : integer;
  attribute SRC_SYNC_FF of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 4;
  attribute VERSION : integer;
  attribute VERSION of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 0;
  attribute WIDTH : integer;
  attribute WIDTH of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 : entity is 1;
end proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1;

architecture STRUCTURE of proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1 is
  signal \<const0>\ : STD_LOGIC;
  attribute DEF_VAL : string;
  attribute DEF_VAL of xarst : label is "1'b1";
  attribute DEST_SYNC_FF of xarst : label is 4;
  attribute INIT_SYNC_FF of xarst : label is 0;
  attribute INV_DEF_VAL : string;
  attribute INV_DEF_VAL of xarst : label is "1'b0";
  attribute RST_ACTIVE_HIGH of xarst : label is 0;
  attribute VERSION of xarst : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of xarst : label is "ASYNC_RST";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of xarst : label is "TRUE";
begin
  dest_out(0) <= \<const0>\;
  dest_out_bin(0) <= \<const0>\;
  dest_pulse <= \<const0>\;
  dest_req <= \<const0>\;
  dest_rst_out <= \<const0>\;
  src_rcv <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
xarst: entity work.proc_system_xpm_cdc_gen_0_1_xpm_cdc_async_rst
     port map (
      dest_arst => dest_arst,
      dest_clk => dest_clk,
      src_arst => src_arst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity proc_system_xpm_cdc_gen_0_1 is
  port (
    dest_clk : in STD_LOGIC;
    dest_arst : out STD_LOGIC;
    src_arst : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of proc_system_xpm_cdc_gen_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of proc_system_xpm_cdc_gen_0_1 : entity is "proc_system_xpm_cdc_gen_0_1,xpm_cdc_gen_v1_0_1,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of proc_system_xpm_cdc_gen_0_1 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of proc_system_xpm_cdc_gen_0_1 : entity is "xpm_cdc_gen_v1_0_1,Vivado 2022.1";
end proc_system_xpm_cdc_gen_0_1;

architecture STRUCTURE of proc_system_xpm_cdc_gen_0_1 is
  signal NLW_inst_dest_pulse_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_dest_req_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_dest_rst_out_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_src_rcv_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_dest_out_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_dest_out_bin_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_CDC_TYPE : integer;
  attribute C_CDC_TYPE of inst : label is 2;
  attribute DEST_CLK_PERIOD : integer;
  attribute DEST_CLK_PERIOD of inst : label is 2500;
  attribute DEST_EXT_HSK : integer;
  attribute DEST_EXT_HSK of inst : label is 1;
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of inst : label is 4;
  attribute INIT : string;
  attribute INIT of inst : label is "1";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of inst : label is 0;
  attribute REG_OUTPUT : integer;
  attribute REG_OUTPUT of inst : label is 0;
  attribute RST_ACTIVE_HIGH : integer;
  attribute RST_ACTIVE_HIGH of inst : label is 0;
  attribute RST_USED : integer;
  attribute RST_USED of inst : label is 1;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of inst : label is 1;
  attribute SIM_LOSSLESS_GRAY_CHK : integer;
  attribute SIM_LOSSLESS_GRAY_CHK of inst : label is 0;
  attribute SRC_CLK_PERIOD : integer;
  attribute SRC_CLK_PERIOD of inst : label is 5000;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of inst : label is 1;
  attribute SRC_SYNC_FF : integer;
  attribute SRC_SYNC_FF of inst : label is 4;
  attribute VERSION : integer;
  attribute VERSION of inst : label is 0;
  attribute WIDTH : integer;
  attribute WIDTH of inst : label is 1;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of dest_clk : signal is "xilinx.com:signal:clock:1.0 dest_signal_clock CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of dest_clk : signal is "XIL_INTERFACENAME dest_signal_clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN proc_system_clk_125, INSERT_VIP 0";
begin
inst: entity work.proc_system_xpm_cdc_gen_0_1_xpm_cdc_gen_v1_0_1
     port map (
      dest_ack => '1',
      dest_arst => dest_arst,
      dest_clk => dest_clk,
      dest_out(0) => NLW_inst_dest_out_UNCONNECTED(0),
      dest_out_bin(0) => NLW_inst_dest_out_bin_UNCONNECTED(0),
      dest_pulse => NLW_inst_dest_pulse_UNCONNECTED,
      dest_req => NLW_inst_dest_req_UNCONNECTED,
      dest_rst_in => '1',
      dest_rst_out => NLW_inst_dest_rst_out_UNCONNECTED,
      src_arst => src_arst,
      src_clk => '1',
      src_in(0) => '1',
      src_in_bin(0) => '1',
      src_pulse => '1',
      src_rcv => NLW_inst_src_rcv_UNCONNECTED,
      src_rst => '1',
      src_send => '1'
    );
end STRUCTURE;
