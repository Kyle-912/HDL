library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity sign_extend is
  port (
    input    : in  std_logic_vector(15 downto 0);
    IsSigned : in  std_logic;
    output   : out std_logic_vector(31 downto 0)
  );
end sign_extend;
architecture BHV of sign_extend is
begin
  process (input, IsSigned)
    variable MSB : std_logic;
  begin
    if (IsSigned = '1') then
      MSB := input(15);
      if (MSB = '1') then
        output <= "1111111111111111" & input;
      else
        output <= "0000000000000000" & input;
      end if;
    else
      output <= "0000000000000000" & input;
    end if;
  end process;
end architecture;