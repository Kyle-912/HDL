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
    n  <= std_logic_vector(to_unsigned(0, n'length));
    go <= '1';
    wait until rising_edge(clk);
    go <= '0';
    if (done = '1') then
      wait until rising_edge(clk) and done = '0' for 1 us;
    end if;
    if (done = '0') then
      wait until rising_edge(clk) and done = '1' for 5 us;
    end if;
    assert result = std_logic_vector(to_unsigned(0, result'length));
    report "Incorrect fib 0"
      severity error;

    wait for clk_period * 2;
    n  <= std_logic_vector(to_unsigned(8, n'length));
    go <= '1';
    wait until rising_edge(clk);
    go <= '0';
    if (done = '1') then
      wait until rising_edge(clk) and done = '0' for 1 us;
    end if;
    if (done = '0') then
      wait until rising_edge(clk) and done = '1' for 5 us;
    end if;
    assert result = std_logic_vector(to_unsigned(0, result'length));
    report "Incorrect fib 0"
      severity error;

    wait for clk_period * 2;
    n  <= std_logic_vector(to_unsigned(34, n'length));
    go <= '1';
    wait until rising_edge(clk);
    go <= '0';
    if (done = '1') then
      wait until rising_edge(clk) and done = '0' for 1 us;
    end if;
    if (done = '0') then
      wait until rising_edge(clk) and done = '1' for 5 us;
    end if;
    assert result = std_logic_vector(to_unsigned(0, result'length));
    report "Incorrect fib 0"
      severity error;

    finish;
  end process;

end tb;