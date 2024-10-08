library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity counter is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    up_n   : in  std_logic; -- Active low
    load_n : in  std_logic; -- Active low
    input  : in  std_logic_vector(3 downto 0);
    output : out std_logic_vector(3 downto 0));
end counter;
architecture counter_BHV of counter is
  signal count_r : unsigned(3 downto 0);
begin
  process (clk, rst)
  begin
    if (rst = '1') then
      count_r <= "0000";
    elsif (rising_edge(clk)) then
      if (load_n = '0') then
        count_r <= unsigned(input);
      elsif (up_n = '0') then
        count_r <= count_r + 1;
      else
        count_r <= count_r - 1;
      end if;
    end if;
  end process;
  output <= std_logic_vector(count_r);
end counter_BHV;