library ieee;
use ieee.std_logic_1164.all;

entity dec2to4 is
  port (
    input  : in  std_logic_vector(1 downto 0);
    output : out std_logic_vector(3 downto 0));
end dec2to4;

-- Implement the decoder using a with-select statement

architecture WITH_SELECT of dec2to4 is
begin
with input select output <=
"00" when "000000000000000000000000",
"01" when "000000000000000000000001",
"10" when "000000000000000000000010",
"11" when "000000000000000000000011",
(others => '0') when others;
end WITH_SELECT;

-- Implement the decoder using a when-else statement

architecture WHEN_ELSE of dec2to4 is
begin

end WHEN_ELSE;

-- Implement the decoder using an if statement

architecture IF_STATEMENT of dec2to4 is
begin

end IF_STATEMENT;

-- Implement the decoder using a case statement

architecture CASE_STATEMENT of dec2to4 is
begin

end CASE_STATEMENT;