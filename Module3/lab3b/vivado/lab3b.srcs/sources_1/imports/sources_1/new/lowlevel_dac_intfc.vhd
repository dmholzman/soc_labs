----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 01/26/2023 10:11:15 PM
-- Design Name: Audio Player
-- Module Name: lowlevel_dac_intfc - Behavioral
-- Project Name: lab2
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Module that accepts a synchronous reset, 125 MHz system clock, and 32-bit data work.
-- Performs clock division to generate MCLK (12.5 MHz), LRCK (125MHz/(10*256)), and
-- BCLK (125MHz/(10*8)). Also, generates SDATA, which sends one word of input (leftmost bit first)
-- down to the external DAC every BCLK. Runs constantly when not in reset. Effectively a parallel
-- to serial converter.
--
-- Dependencies: clkdivider.vhd
-- 
-- Revision:
-- Revision 1.0 - Updated per lab 1B comments to make resetn synchronous
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.ALL;

entity lowlevel_dac_intfc is 
port (
	resetn 		: in std_logic; -- active low synchronous reset
	clk125		: in std_logic; -- the clock for all flops in your design
	data_word	: in std_logic_vector(31 downto 0); -- 32 bit input data
	sdata		: out std_logic; -- serial data out to the DAC
	lrck		: out std_logic;  -- a 50% duty cycle signal. changes at the same time BCLK falls. Low for bits 0 and 31-17 of input on SDATA.
    bclk  		: out std_logic; -- the dac clocks sdata on the rising edge of this clock
    mclk		: out std_logic; -- a 12.5MHz clock with arbitrary phase, runs all the time
    latched_data 	: out std_logic); -- 1 clk125 wide pulse which indicates when the current 
                                      -- value of data_word has been read by this component
                                      -- (and can be safely changed)
end lowlevel_dac_intfc;


architecture Behavioral of lowlevel_dac_intfc is
    signal sdata_cnt : unsigned(4 downto 0) := "00000"; -- counter to index data_word, starts with leftmost value
    signal data_word_int : unsigned(31 downto 0) := x"00000000"; -- 32 bit input data internal signal
    signal mclk_pulse : std_logic := '0';
    signal mclk_int : std_logic := '0';
    signal bclk_pulse : std_logic := '0';
    signal bclk_int : std_logic := '0';
    signal bclk_fe : std_logic := '0'; -- bclk falling edge
begin
    -- Instantiate clkdivider component to create MCLK
    mclkGen : entity clkdivider -- divide by 5 for MCLK
        generic map (divideby => 5)
        port map (
            clk => clk125,
            resetn => resetn,
            pulseout => mclk_pulse);
    mclk_int <= not mclk_int when rising_edge(clk125) and mclk_pulse = '1';
    mclk <= mclk_int;
          
    -- Instantiate clkdivider component to create BCLK
    bclkGen : entity clkdivider -- divide by 40 for BCLK
        generic map (divideby => 40)
        port map (
            clk => clk125,
            resetn => resetn,
            pulseout => bclk_pulse);
            
    bclk_fe <= bclk_pulse and bclk_int; -- generate falling edge detection
    bclk <= bclk_int;
            
    bclk_maker : process(clk125, resetn)
    begin
        if (resetn = '0') then
            bclk_int <= '0';
        elsif (rising_edge(clk125)) then
            if bclk_pulse = '1' then
                bclk_int <= not bclk_int;
            end if;
        end if;
    end process bclk_maker;
                     
    -- Process to serialize input data and output on proper clock edges
    serialize : process(clk125, resetn)
    begin
        if(rising_edge(clk125)) then
            if(resetn = '0') then
                lrck <= '0';
                sdata_cnt <= (others => '0');
                latched_data <= '0'; -- data cleared, need new data
                data_word_int <= x"00000000";
            else                
                latched_data <= '0';
                -- On the falling edge of BCLK (determined by counter max), shift in next word of data
                if (bclk_fe = '1') then 
                    data_word_int <= shift_left(data_word_int,1);
                    sdata_cnt <= sdata_cnt - 1;
                    
                    -- When sdata_cnt is 1 and there's a BCLK falling edge, change LRCK to low, but set high when count reaches 17
                    if (sdata_cnt = "00001") then
                        lrck <= '0';
                    elsif (sdata_cnt = "00000") then
                        latched_data <= '1';
                        data_word_int <= unsigned(data_word);
                    elsif (sdata_cnt = "10001") then
                        lrck <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process serialize;
    
    sdata <= data_word_int(31);
    
end Behavioral;
