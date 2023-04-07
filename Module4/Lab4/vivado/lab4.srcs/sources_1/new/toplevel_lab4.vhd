----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 03/08/2023 06:55:09 PM
-- Design Name: FIR Filter Implementation
-- Module Name: toplevel_lab4 - Behavioral
-- Project Name: lab4
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Toplevel module for the FIR filter implementation, which adds two FIR filters to
-- the previous SDR signal source design (lab3b). Needs an active low reset signal.
-- Instantatiates the DAC interface and clock divider used on past labs.
-- 
--
-- Dependencies: lowlevel_dac_intfc.vhd, clkdivider.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.ALL;

entity toplevel_lab4 is
    port (
        -- NEED CONSTRAINTS
        clk    : in std_logic; -- system clock, 125 MHz
        sw0    : in std_logic; -- SW0 used to select between DDS with or without filter
        sdata    : out std_logic; -- serial data out to the DAC
        lrck     : out std_logic; -- a 50% duty cycle signal. changes at the same time BCLK falls. Low for bits 0 and 31-17 of input on SDATA.
        bclk     : out std_logic; -- the dac clocks sdata on the rising edge of this clock
        mclk     : out std_logic; -- a 12.5MHz clock with arbitrary phase, runs all the time
        ac_muten : out std_logic; -- mute signal

        -- DO NOT NEED CONSTRAINTS
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
        ac_scl : inout STD_LOGIC;
        ac_sda : inout STD_LOGIC);
end toplevel_lab4;

architecture Behavioral of toplevel_lab4 is
    signal resetn : std_logic; -- reset for DAC, fed from GPIO
    signal data_in : std_logic_vector(31 downto 0) := std_logic_vector(to_signed(0,32));
    signal latched_data : std_logic; -- 1 clk125 wide pulse which indicates when the current 
                                     -- value of data_word has been read by this component
                                     -- dds changing every clock so this signal isn't as useful
    signal axi_data_tlast : STD_LOGIC;
    signal axi_data_tvalid : STD_LOGIC;
    signal axi_iic_scl_i : STD_LOGIC;
    signal axi_iic_scl_o : STD_LOGIC;
    signal axi_iic_scl_t : STD_LOGIC;
    signal axi_iic_sda_i : STD_LOGIC;
    signal axi_iic_sda_o : STD_LOGIC;
    signal axi_iic_sda_t : STD_LOGIC;
    signal DDS_out_tdata : std_logic_vector(15 downto 0);
    signal DDS_out_tvalid : std_logic;
    signal DDS_filtered_tdata : std_logic_vector(15 downto 0);
    signal DDS_filtered_tvalid : std_logic;

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
            FIXED_IO_ps_porb : inout STD_LOGIC;
            DDS_out_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 );
            DDS_out_tvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
            DDS_filtered_tvalid : out STD_LOGIC;
            DDS_filtered_tdata : out STD_LOGIC_VECTOR ( 15 downto 0 )
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
begin
    -- Instantiate the low level DAC interface
    DAC_interface : entity lowlevel_dac_intfc port map (
            resetn =>  resetn,
            clk125 => clk,
            data_word => data_in,
            sdata => sdata,
            lrck => lrck,
            bclk => bclk,
            mclk => mclk,
            latched_data => latched_data);

    hdmi_in_ddc_scl_iobuf: component IOBUF
        port map (
            I => axi_iic_scl_o,
            IO => ac_scl,
            O => axi_iic_scl_i,
            T => axi_iic_scl_t
        );
    hdmi_in_ddc_sda_iobuf: component IOBUF
        port map (
            I => axi_iic_sda_o,
            IO => ac_sda,
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
          DDS_filtered_tdata(15 downto 0) => DDS_filtered_tdata(15 downto 0),
          DDS_filtered_tvalid => DDS_filtered_tvalid,
          DDS_out_tdata(15 downto 0) => DDS_out_tdata(15 downto 0),
          DDS_out_tvalid(0) => DDS_out_tvalid,
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
          clk_125 => clk,
          resetn => resetn
        );

    -- Set mute signal to DAC high
    ac_muten <= '1';

    -- Set data_in based on SW0
    -- Duplicate so that it fits 32-bits and plays out to both R and L sides
    data_sel : process(clk, resetn)
    begin
        if (resetn = '0') then
            data_in <= (others => '0');
        elsif (rising_edge(clk)) then
            if sw0 = '1' then -- if switch is set to on position, feed filtered data into DAC
                data_in <= DDS_filtered_tdata & DDS_filtered_tdata;
            else
                data_in <= DDS_out_tdata & DDS_out_tdata;
            end if;
        end if;
    end process data_sel;

end Behavioral;
