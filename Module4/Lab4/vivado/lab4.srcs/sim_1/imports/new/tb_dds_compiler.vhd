----------------------------------------------------------------------------------
-- Company: Dirk Holzman
-- Engineer: 525.742.8VL
-- 
-- Create Date: 02/17/2023 12:40:22 PM
-- Design Name: DDS Compiler
-- Module Name: tb_dds_compiler - Behavioral
-- Project Name: Lab3A
-- Target Devices: Zybo Z-20
-- Tool Versions: Vivado 2022.1
-- Description: Testbench to generate sample data from DDS compiler.
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

entity tb_dds_compiler is
end tb_dds_compiler;

architecture Behavioral of tb_dds_compiler is
    -----------------------------------------------------------------------
    -- Timing constants
    -----------------------------------------------------------------------
    constant CLOCK_PERIOD : time := 8 ns;
    constant T_HOLD       : time := 16 ns;
    constant T_STROBE     : time := CLOCK_PERIOD - (1 ns);

    -----------------------------------------------------------------------
    -- DUT input signals
    -----------------------------------------------------------------------

    -- General inputs
    signal clk125                          : std_logic := '0';  -- the master clock
    signal aresetn                         : std_logic := '1';  -- synchronous active low reset, overrides aclken

    -- Phase slave channel signals
    signal s_axis_phase_tvalid             : std_logic := '0';  -- payload is valid
    signal sig_gen_pinc                    : std_logic_vector(31 downto 0) := (others => '0');  -- data payload

    -- Data master channel signals
    signal m_axis_data_tvalid              : std_logic := '0';  -- payload is valid
    signal m_axis_data_tdata               : std_logic_vector(15 downto 0) := (others => '0');  -- data payload

    -----------------------------------------------------------------------
    -- Aliases for AXI channel TDATA and TUSER fields
    -- These are a convenience for viewing data in a simulator waveform viewer.
    -- If using ModelSim or Questa, add "-voptargs=+acc=n" to the vsim command
    -- to prevent the simulator optimizing away these signals.
    -----------------------------------------------------------------------

    -- Phase slave channel alias signals
    signal s_axis_phase_tdata_inc        : std_logic_vector(26 downto 0) := (others => '0');

    -- Data master channel alias signals
    signal m_axis_data_tdata_cosine      : std_logic_vector(15 downto 0) := (others => '0');


    signal end_of_simulation : boolean := false;

    file sig_gen_file : TEXT open write_mode is "./simulated_sig_gen.txt";

begin
   
    -----------------------------------------------------------------------
    -- Instantiate the DUT
    -----------------------------------------------------------------------

    dut : entity work.dds_compiler_0
        port map (
            aclk                            => clk125,
            aresetn                         => aresetn,
            s_axis_phase_tvalid             => s_axis_phase_tvalid,
            s_axis_phase_tdata              => sig_gen_pinc,
            m_axis_data_tvalid              => m_axis_data_tvalid,
            m_axis_data_tdata               => m_axis_data_tdata
        );

    -----------------------------------------------------------------------
    -- Generate clock
    -----------------------------------------------------------------------

    clock_gen : process
    begin
        clk125 <= '0';
        if (end_of_simulation) then
            wait;
        else
            wait for CLOCK_PERIOD;
            loop
                clk125 <= '0';
                wait for CLOCK_PERIOD/2;
                clk125 <= '1';
                wait for CLOCK_PERIOD/2;
            end loop;
        end if;
    end process clock_gen;

    -----------------------------------------------------------------------
    -- Generate inputs
    -----------------------------------------------------------------------

    stimuli : process
    begin

        -- Drive inputs T_HOLD time after rising edge of clock
        wait until rising_edge(clk125);
        wait for T_HOLD;

        -- Input a constant phase increment each cycle, and run for long enough to produce 5 periods of outputs
        for cycle in 0 to 15999 loop
            s_axis_phase_tvalid  <= '1';
            sig_gen_pinc <= (others => '0');  -- set unused TDATA bits to zero
            sig_gen_pinc(26 downto 0) <= std_logic_vector(to_unsigned(53687, 27));  -- constant phase increment
            wait for CLOCK_PERIOD;
        end loop;
        s_axis_phase_tvalid <= '0';

        -- End of test
        end_of_simulation <= true;
        report "Not a real failure. Simulation finished successfully. Test completed successfully" severity failure;
        wait;

    end process stimuli;
    
        --every time a sample is valid, write it out
    -- * rising_edge of the clk_25
    -- * sample_valid = '1'
    write_data_from_sig_proc : process
        variable  outline : line; --line number declaration
    begin
        wait until rising_edge(clk125);
        if m_axis_data_tvalid = '1' then
            write(outline, to_integer(signed(m_axis_data_tdata)));
            --write(outline, ',');
            --write(outline, to_integer(signed(sample_out)));
            writeline(sig_gen_file,outline);
            report  "write_data_from_sig_proc: wrote" severity NOTE;
        end if;
    end process;
    
    -----------------------------------------------------------------------
    -- Assign TDATA fields to aliases, for easy simulator waveform viewing
    -----------------------------------------------------------------------

    -- Phase slave channel alias signals
    s_axis_phase_tdata_inc        <= sig_gen_pinc(26 downto 0);

    -- Data master channel alias signals: update these only when they are valid
    m_axis_data_tdata_cosine      <= m_axis_data_tdata(15 downto 0) when m_axis_data_tvalid = '1';

end Behavioral;
