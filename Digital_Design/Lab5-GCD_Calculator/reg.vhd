library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg is
  generic (WIDTH : positive);
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    input  : in  std_logic_vector(WIDTH - 1 downto 0);
    enable : in  std_logic;
    output : out std_logic_vector(WIDTH - 1 downto 0)
  );
end reg;
architecture register_BHV of reg is
  signal output_r : std_logic_vector(WIDTH - 1 downto 0);
begin
  output <= output_r;
  process (clk, rst)
  begin
    if (rst = '1') then
      output_r <= (others => '0');
    elsif (rising_edge(clk)) then
      if (enable = '1') then
        output_r <= input;
      end if;
    end if;
  end process;
end architecture;