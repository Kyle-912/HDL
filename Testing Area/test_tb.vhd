library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use std.env.finish;
entity test_tb is
end test_tb;
architecture sim of test_tb is
    constant clk_hz     : integer   := 100e6;
    constant clk_period : time      := 1 sec / clk_hz;
    signal clk          : std_logic := '1';
    signal rst          : std_logic := '1';
    signal input        : std_logic_vector(31 downto 0);
begin
    clk <= not clk after clk_period / 2;
    DUT : entity work.test(bhv)
        port map(
            clk   => clk,
            rst   => rst,
            input => input
        );
    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;
        rst <= '0';
        wait for clk_period * 10;
        input <= (others => '1');
        wait for clk_period * 2;
        input <= (others => '0');
        assert (unsigned(input) = to_unsigned(1, input'length))
        report "The expression is false"
            severity warning;
        wait;
    end process;
end architecture;