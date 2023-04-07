----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 01/26/2023 10:11:15 PM
-- Design Name: DAC Interface
-- Module Name: dac_intfc - Behavioral
-- Project Name: lab1(b)
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Module that accepts an asynchronous reset, 125 MHz system clock, and 32-bit data work.
-- Performs clock division to generate MCLK (12.5 MHz), LRCK (125MHz/(10*256)), and
-- BCLK (125MHz/(10*8)). Also, generates SDATA, which sends one word of input (leftmost bit first)
-- down to the external DAC every BCLK. Runs constantly when not in reset. Effectively a parallel
-- to serial converter.
--
-- Dependencies: clkdivider.vhd
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

entity dac_intfc is 
port (
	resetn 		: in std_logic; -- active low synchronous reset
	clk125		: in std_logic; -- the clock for all flops in your design
	data_word	: in std_logic_vector(31 downto 0); -- 32 bit input data
	sdata		: out std_logic; -- serial data out to the DAC
	lrck		: out std_logic;  -- a 50% duty cycle signal. changes at the same time BCLK falls. Low for bits 0 and 31-17 of input on SDATA.
    bclk  		: out std_logic; -- the dac clocks sdata on the rising edge of this clock
    mclk		: out std_logic; -- a 12.5MHz clock with arbitrary phase, runs all the time
    latched_data 	: out std_logic; -- 1 clk125 wide pulse which indicates when the current 
                                      -- value of data_word has been read by this component
                                      -- (and can be safely changed)
                                      
    sdata_counter : out std_logic_vector(4 downto 0); -- counter for sdata for sim
    bclk_sysclks : out std_logic_vector(6 downto 0)); -- counter for bclks for sim
end dac_intfc;


architecture Behavioral of dac_intfc is
    signal sdata_cnt : unsigned(4 downto 0); -- counter to index data_word, starts with leftmost value
    signal sdata_int : std_logic; -- internal signal for sdata
    signal latched_data_int : std_logic; -- internal signal for latched data
    signal data_word_int : std_logic_vector(31 downto 0); -- 32 bit input data internal signal
    signal lrck_int : std_logic; -- internal version of lrck
    signal bclk_int : std_logic; -- internal version of bclk
    signal bclk_sysclks_cnt : unsigned(6 downto 0); -- counter for bclks
    
    constant BCLK_CLKS : unsigned(6 downto 0) := to_unsigned(79,7); -- total system clocks in a period of BCLK = 80
begin
    -- Instantiate clkdivider component to create MCLK, LRCK, and BCLK
    mclkGen : entity clkdivider -- divide by 10 for MCLK
        generic map (divideby => 10)
        port map (
            clk => clk125,
            resetn => resetn,
            pulseout => mclk);
            
    bclkGen : entity clkdivider -- divide by 10*8 for BCLK
        generic map (divideby => 80)
        port map (
            clk => clk125,
            resetn => resetn,
            pulseout => bclk_int);
                     
    -- Process to serialize input data and output on proper clock edges
    process(clk125, resetn)
    begin
        if(resetn = '1') then
            lrck_int <= '0';
            sdata_int <= '0';
            sdata_cnt <= (others => '0');
            latched_data_int <= '0'; -- data cleared, need new data
            bclk_sysclks_cnt <= (others => '0');
        elsif(rising_edge(clk125)) then
            -- Count system clocks within bclk
            if (bclk_sysclks_cnt < BCLK_CLKS) then
                bclk_sysclks_cnt <= bclk_sysclks_cnt + 1;
            else
                bclk_sysclks_cnt <= (others => '0');    
            end if;
            
            -- Set latched data signal before BCLK falling edge on sdata_cnt = 0
            if (sdata_cnt = "00000" and bclk_sysclks_cnt = "1001101") then
                latched_data_int <= '1';
                data_word_int <= data_word;
            else
                latched_data_int <= '0';
            end if;
            
            -- On the falling edge of BCLK (determined by counter max), shift in next word of data
            if (bclk_sysclks_cnt = BCLK_CLKS - 1) then 
                sdata_int <= data_word_int(31);
                data_word_int <= data_word_int(30 downto 0) & data_word_int(31);
                sdata_cnt <= sdata_cnt - 1;
                
                -- When sdata_cnt is 1 and there's a BCLK falling edge, change LRCK to low, but set high when count reaches 17
                if (sdata_cnt = "00001") then
                    lrck_int <= '0';
                elsif (sdata_cnt = "10001") then
                    lrck_int <= '1';
                end if;
            end if;
        end if;
    end process;
    
    lrck <= lrck_int;
    bclk <= bclk_int;
    bclk_sysclks <= std_logic_vector(bclk_sysclks_cnt);
    sdata_counter <= std_logic_vector(sdata_cnt);
    sdata <= sdata_int;
    latched_data <= latched_data_int;

end Behavioral;
