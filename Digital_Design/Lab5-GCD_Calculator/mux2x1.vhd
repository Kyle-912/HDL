library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux2x1 is
  generic (WIDTH : positive);
  port (
    in1, in2 : in  std_logic_vector(WIDTH - 1 downto 0);
    sel      : in  std_logic;
    output   : out std_logic_vector(WIDTH - 1 downto 0)
  );
end mux2x1;
architecture mux2x1_BHV of mux2x1 is
begin
  process (in1, in2, sel)
  begin
    if (sel = '0') then
      output <= in1;
    else
      output <= in2;
    end if;
  end process;
end architecture;