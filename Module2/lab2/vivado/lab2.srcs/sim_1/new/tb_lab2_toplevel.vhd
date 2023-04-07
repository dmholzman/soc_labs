----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 02/07/2023 06:33:01 PM
-- Design Name: DAC Interface
-- Module Name: tb_lab2_toplevel - Behavioral
-- Project Name: lab1(b)
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Testbench to verify the operation of the audio player. Generates a clock and input
-- data and allows for verification of data and clock signal timing.
-- 
-- Dependencies: dac_intfc.vhd, clkdivider.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_toplevel_lab2 is
end tb_toplevel_lab2;

architecture tb of tb_toplevel_lab2 is

    component toplevel_lab2
        port (reset       : in std_logic;
              sysclk      : in std_logic;
              data_in_sim : out std_logic_vector (31 downto 0);
              latched_data_sim : out std_logic;
              sdata       : out std_logic;
              lrck        : out std_logic;
              bclk        : out std_logic;
              mclk        : out std_logic);
    end component;

    signal reset       : std_logic;
    signal sysclk      : std_logic;
    signal data_in_sim : std_logic_vector (31 downto 0);
    signal latched_data_sim : std_logic;
    signal sdata       : std_logic;
    signal lrck        : std_logic;
    signal bclk        : std_logic;
    signal mclk        : std_logic;

    constant TbPeriod : time := 8 ns; -- 125 MHz
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : toplevel_lab2
    port map (reset       => reset,
              sysclk      => sysclk,
              data_in_sim => data_in_sim,
              latched_data_sim => latched_data_sim,
              sdata       => sdata,
              lrck        => lrck,
              bclk        => bclk,
              mclk        => mclk);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    sysclk <= TbClock;

    stimuli : process
    begin
        -- Reset generation
        reset <= '1';
        wait for 8 ns;
        reset <= '0';
        wait for 8 ns;

        -- EDIT Add stimuli here
        wait for 50000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;