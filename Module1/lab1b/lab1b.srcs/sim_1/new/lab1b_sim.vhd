----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 01/26/2023 10:12:36 PM
-- Design Name: DAC Interface
-- Module Name: lab1b_sim - Behavioral
-- Project Name: lab1(b)
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Testbench to verify the operation of the DAC interface. Generates a clock and input
-- data and allows for verification of data and clock signal timing.
-- 
-- Dependencies: dac_intfc.vhd, clkdivider.vhd
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

entity lab1b_sim is
end lab1b_sim;

architecture Behavioral of lab1b_sim is
	signal clk : std_logic; -- 125 MHz system clock
	signal lrck : std_logic; -- divide by 10*256 for LRCK
    signal bclk : std_logic; -- divide by 10*8 for BCLK
	signal mclk : std_logic; -- divide by 10 for MCLK
	signal resetn : std_logic; -- asynchronous reset
	signal data_in : std_logic_vector(31 downto 0) := x"88888888"; -- input parallel data
	signal data_out : std_logic; -- output serial data
	signal latched : std_logic; -- full data_word is latched
	signal sdata_cnt : std_logic_vector(4 downto 0);
	signal bclk_sysclks : std_logic_vector (6 downto 0);
    
    constant clk_period : time := 8 ns;
    
begin
    -- Unit under test
	DAC_interface : entity dac_intfc port map (
		resetn =>  resetn,
		clk125 => clk,
		data_word => data_in,
		sdata => data_out,
        lrck => lrck,
        bclk => bclk,
        mclk => mclk,
        latched_data => latched,
        sdata_counter => sdata_cnt,
        bclk_sysclks => bclk_sysclks);

	-- 125MHz clock
    -- Clock process definitions
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
	
	--Initial Reset
	process
	begin
	   resetn <= '0';
	   wait for 5 ns;
	   resetn <= '1';
	   wait for 5 ns;
	   resetn <= '0';
	   wait;
	end process;
	
    -- data_in stimulus
    process
    begin
        wait for 20 us;
        data_in <= x"AAAA1111";
        wait for 20 us;
        data_in <= x"1111AAAA";
    end process;
	

end Behavioral;
