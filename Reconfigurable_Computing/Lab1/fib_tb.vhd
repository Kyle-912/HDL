library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use std.textio.all;
use std.env.finish;

entity fib_tb is
end fib_tb;

architecture tb of fib_tb is

  constant clk_hz     : integer   := 100e6;
  constant clk_period : time      := 1 sec / clk_hz;

  signal clk          : std_logic := '1';
  signal rst          : std_logic := '1';
  signal go           : std_logic := '0';
  signal n            : std_logic_vector(5 downto 0);
  signal done         : std_logic;
  signal result       : std_logic_vector(31 downto 0);

begin

  clk <= not clk after clk_period / 2;

  DUT : entity work.fib
    port map(
      clk    => clk,
      rst    => rst,
      go     => go,
      n      => n,
      result => result,
      done   => done
    );

  SEQUENCER_PROC : process
  begin
    wait for clk_period * 2;

    rst <= '0';

    wait for clk_period * 2;
    n  <= "000000";
    go <= '1';
    wait until done = '1';
    assert result = std_logic_vector(to_unsigned(0, result'length));
    report "Incorrect fib 0"
      severity error;
    go <= '0';

    wait for clk_period * 2;
    n  <= "000100";
    go <= '1';
    wait until done = '1';
    assert result = std_logic_vector(to_unsigned(0, result'length));
    report "Incorrect fib 0"
      severity error;
    go <= '0';

    wait for clk_period * 2;
    n  <= "010000";
    go <= '1';
    wait until done = '1';
    assert result = std_logic_vector(to_unsigned(0, result'length));
    report "Incorrect fib 0"
      severity error;
    go <= '0';

    finish;
  end process;

end tb;