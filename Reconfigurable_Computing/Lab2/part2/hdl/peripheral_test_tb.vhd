library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity peripheral_test_tb is
end peripheral_test_tb;

architecture sim of peripheral_test_tb is

  constant clk_hz     : integer   := 100e6;
  constant clk_period : time      := 1 sec / clk_hz;

  signal clk          : std_logic := '1';

  signal in0          : std_logic_vector(31 downto 0);
  signal in1          : std_logic_vector(31 downto 0);
  signal in2          : std_logic_vector(31 downto 0);
  signal in3          : std_logic_vector(31 downto 0);
  signal out0         : std_logic_vector(31 downto 0);
  signal out1         : std_logic_vector(31 downto 0);
  signal out2         : std_logic_vector(31 downto 0);
  signal out3         : std_logic_vector(31 downto 0);

begin

  clk <= not clk after clk_period / 2;

  DUT : entity work.peripheral_test
    generic map(WIDTH => 32)
    port map(
      in0  => in0,
      in1  => in1,
      in2  => in2,
      in3  => in3,
      out0 => out0,
      out1 => out1,
      out2 => out2,
      out3 => out3
    );

  SEQUENCER_PROC : process
  begin
    wait for clk_period * 2;

    in0 <= std_logic_vector(to_unsigned(2, in0'length));
    in1 <= std_logic_vector(to_unsigned(3, in1'length));
    in2 <= std_logic_vector(to_unsigned(5, in2'length));
    in3 <= std_logic_vector(to_unsigned(4, in3'length));

    wait for clk_period * 2;
    assert out0 = std_logic_vector(to_unsigned(6, out0'length))
    report "Incorrect out0"
      severity failure;
    assert out1 = std_logic_vector(to_unsigned(5, out1'length))
    report "Incorrect out1"
      severity failure;
    assert out2 = std_logic_vector(to_unsigned(1, out2'length))
    report "Incorrect out2"
      severity failure;
    assert out3 = std_logic_vector(to_unsigned(5, out3'length))
    report "Incorrect out3"
      severity failure;

    finish;
  end process;

end architecture;