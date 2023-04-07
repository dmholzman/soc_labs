--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
--Date        : Mon Feb 27 21:52:11 2023
--Host        : DESKTOP-GUH0UB4 running 64-bit major release  (build 9200)
--Command     : generate_target proc_system_wrapper.bd
--Design      : proc_system_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity proc_system_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    axi_iic_scl_io : inout STD_LOGIC;
    axi_iic_sda_io : inout STD_LOGIC;
    clk_125 : in STD_LOGIC;
    dds_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dds_data_tvalid : out STD_LOGIC;
    resetn : out STD_LOGIC
  );
end proc_system_wrapper;

architecture STRUCTURE of proc_system_wrapper is
  component proc_system is
  port (
    resetn : out STD_LOGIC;
    clk_125 : in STD_LOGIC;
    axi_iic_scl_i : in STD_LOGIC;
    axi_iic_scl_o : out STD_LOGIC;
    axi_iic_scl_t : out STD_LOGIC;
    axi_iic_sda_i : in STD_LOGIC;
    axi_iic_sda_o : out STD_LOGIC;
    axi_iic_sda_t : out STD_LOGIC;
    dds_data_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    dds_data_tvalid : out STD_LOGIC;
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC
  );
  end component proc_system;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal axi_iic_scl_i : STD_LOGIC;
  signal axi_iic_scl_o : STD_LOGIC;
  signal axi_iic_scl_t : STD_LOGIC;
  signal axi_iic_sda_i : STD_LOGIC;
  signal axi_iic_sda_o : STD_LOGIC;
  signal axi_iic_sda_t : STD_LOGIC;
begin
axi_iic_scl_iobuf: component IOBUF
     port map (
      I => axi_iic_scl_o,
      IO => axi_iic_scl_io,
      O => axi_iic_scl_i,
      T => axi_iic_scl_t
    );
axi_iic_sda_iobuf: component IOBUF
     port map (
      I => axi_iic_sda_o,
      IO => axi_iic_sda_io,
      O => axi_iic_sda_i,
      T => axi_iic_sda_t
    );
proc_system_i: component proc_system
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      axi_iic_scl_i => axi_iic_scl_i,
      axi_iic_scl_o => axi_iic_scl_o,
      axi_iic_scl_t => axi_iic_scl_t,
      axi_iic_sda_i => axi_iic_sda_i,
      axi_iic_sda_o => axi_iic_sda_o,
      axi_iic_sda_t => axi_iic_sda_t,
      clk_125 => clk_125,
      dds_data_tdata(15 downto 0) => dds_data_tdata(15 downto 0),
      dds_data_tvalid => dds_data_tvalid,
      resetn => resetn
    );
end STRUCTURE;
