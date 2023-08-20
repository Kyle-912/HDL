library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity gray2_tb is
end gray2_tb;
architecture TB of gray2_tb is
  component gray2
    port (
      clk    : in  std_logic;
      rst    : in  std_logic;
      output : out std_logic_vector(3 downto 0)
    );
  end component;
  signal clk    : std_logic := '0';
  signal rst    : std_logic := '0';
  signal output : std_logic_vector(3 downto 0);
begin
  UUT : gray2
  port map
  (
    clk    => clk,
    rst    => rst,
    output => output
  );
  process
  begin
    rst <= '1';
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    rst <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    rst <= '1';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
    wait;
  end process;
end TB;