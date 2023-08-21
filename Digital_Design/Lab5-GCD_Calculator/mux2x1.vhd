library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux2x1 is
  generic (WIDTH : positive);
  port (
    input0, input1 : in  std_logic_vector(WIDTH - 1 downto 0);
    sel      : in  std_logic;
    output   : out std_logic_vector(WIDTH - 1 downto 0)
  );
end mux2x1;
architecture mux2x1_BHV of mux2x1 is
begin
  process (input0, input1, sel)
  begin
    if (sel = '0') then
      output <= input0;
    else
      output <= input1;
    end if;
  end process;
end architecture;