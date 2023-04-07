----------------------------------------------------------------------------------
-- Company: 525.742.8VL
-- Engineer: Dirk Holzman
-- 
-- Create Date: 01/26/2023
-- Design Name: DAC Interface
-- Module Name: clkdivider - Behavioral
-- Project Name: lab1(b)
-- Target Devices: Zybo Z7-20
-- Tool Versions: Xilinx 2022.1
--
-- Description: 
-- Module that accepts an asynchronous reset, 125 MHz system clock, and divideby generic.
-- Divides the clock into a 50% duty cycle enable signal with the appropriate rate.
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clkdivider is
    generic (divideby : natural := 2);
    Port (
        clk : in std_logic;
        resetn : in std_logic;
        pulseout : out std_logic);
end clkdivider;


architecture Behavioral of clkdivider is
    signal cnt : natural range 0 to divideby-1 := 0;
begin

    process(clk,resetn)
    begin
        if rising_edge(clk) then
            if resetn = '1' then -- active high reset
                cnt <= 0;
            else
                if (cnt = divideby-1)  then
                    cnt <= 0;
                else
                    cnt <= cnt+1;
                end if;
            end if;
        end if;
    end process;
    pulseout <= '0' when cnt <= (divideby/2)-1 else '1'; -- 50% duty cycle, low then high
end Behavioral;