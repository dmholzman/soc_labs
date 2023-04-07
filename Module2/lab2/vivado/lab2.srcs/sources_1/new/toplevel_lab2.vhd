----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 02/06/2023 05:47:17 PM
-- Design Name: Audio Player
-- Module Name: toplevel_lab2 - Behavioral
-- Project Name: lab2
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Toplevel module for the audio player. Instantiates the lowlevel_dac_infc, IO Buffers,
-- and processor system.
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

entity toplevel_lab2 is
    port (
        -- NEED CONSTRAINTS
        clk    : in std_logic;
        sdata     : out std_logic; -- serial data out to the DAC
        lrck      : out std_logic;  -- a 50% duty cycle signal. changes at the same time BCLK falls. Low for bits 0 and 31-17 of input on SDATA.
        bclk      : out std_logic; -- the dac clocks sdata on the rising edge of this clock
        mclk      : out std_logic; -- a 12.5MHz clock with arbitrary phase, runs all the time
        ac_muten : out std_logic; -- mute signal
        led : out std_logic_vector (2 downto 0);

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
end toplevel_lab2;

architecture Behavioral of toplevel_lab2 is
    signal resetn : std_logic; -- reset for DAC, fed from GPIO
--    signal audio_cnt : unsigned(2 downto 0);
    signal data_in : std_logic_vector(31 downto 0) := std_logic_vector(to_signed(0,32));
    signal latched_data : std_logic; -- 1 clk125 wide pulse which indicates when the current 
    -- value of data_word has been read by this component
    signal axi_data_tlast : STD_LOGIC;
    signal axi_data_tvalid : STD_LOGIC;
    signal axi_iic_scl_i : STD_LOGIC;
    signal axi_iic_scl_o : STD_LOGIC;
    signal axi_iic_scl_t : STD_LOGIC;
    signal axi_iic_sda_i : STD_LOGIC;
    signal axi_iic_sda_o : STD_LOGIC;
    signal axi_iic_sda_t : STD_LOGIC;

    component proc_system is
        port (
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
            axi_iic_scl_i : in STD_LOGIC;
            axi_iic_scl_o : out STD_LOGIC;
            axi_iic_scl_t : out STD_LOGIC;
            axi_iic_sda_i : in STD_LOGIC;
            axi_iic_sda_o : out STD_LOGIC;
            axi_iic_sda_t : out STD_LOGIC;
            leds_2bits_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
            resetn_tri_o : out STD_LOGIC_VECTOR ( 0 to 0 );
            clk_125 : in STD_LOGIC;
            axi_data_tdata_1 : out STD_LOGIC_VECTOR ( 31 downto 0 );
            axi_data_tlast_1 : out STD_LOGIC;
            axi_data_tready_1 : in STD_LOGIC;
            axi_data_tvalid_1 : out STD_LOGIC
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

    COMPONENT ila_dac_test
        PORT (
            clk : IN STD_LOGIC;
            probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
            probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT  ;
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
            axi_data_tdata_1(31 downto 0) => data_in,
            axi_data_tlast_1 => axi_data_tlast,
            axi_data_tready_1 => latched_data,
            axi_data_tvalid_1 => axi_data_tvalid,
            clk_125 => clk,
            leds_2bits_tri_o(1 downto 0) => led(1 downto 0),
            resetn_tri_o(0) => resetn
        );

--    ILA to test SCL and SDA signals
--    your_instance_name : ila_dac_test
--        PORT MAP (
--            clk => clk,
--            probe0 => data_in,
--            probe1(0) => latched_data, -- note std_logic_vector
--            probe2(0) => axi_iic_scl_o,
--            probe3(0) => axi_iic_scl_i,
--            probe4(0) => axi_iic_scl_t,
--            probe5(0) => axi_iic_sda_o,
--            probe6(0) => axi_iic_sda_i,
--            probe7(0) => axi_iic_sda_t
--        );

--    -- Create data_in based on audio_cnt when latched is high
--    data_LUT : process(clk, resetn)
--    begin
--        if(resetn = '1') then
--            audio_cnt <= (others => '0');
--            data_in <= (others => '0');
--        elsif(rising_edge(clk)) then
--            if(latched_data = '1') then
--                audio_cnt <= audio_cnt + 1; -- increment cnt for input data each time latched goes high

--                -- When latched signal is high, select data_in value (these values will only produce 1-sided output, ok for test)
--                case audio_cnt is
--                    when "000" =>
--                        data_in <= std_logic_vector(to_signed(0,32));
--                    when "001" =>
--                        data_in <= std_logic_vector(to_signed(7070,32));
--                    when "010" =>
--                        data_in <= std_logic_vector(to_signed(10000,32));
--                    when "011" =>
--                        data_in <= std_logic_vector(to_signed(7070,32));
--                    when "100" =>
--                        data_in <= std_logic_vector(to_signed(0,32));
--                    when "101" =>
--                        data_in <= std_logic_vector(to_signed(-7070,32));
--                    when "110" =>
--                        data_in <= std_logic_vector(to_signed(-10000,32));
--                    when others =>
--                        data_in <= std_logic_vector(to_signed(-7070,32));
--                end case;
--            end if;
--        end if;
--    end process data_LUT;

    -- Set mute signal to DAC high
    ac_muten <= '1';

    -- Set LED(2) to resetn for debug
    led(2) <= resetn;

end Behavioral;
