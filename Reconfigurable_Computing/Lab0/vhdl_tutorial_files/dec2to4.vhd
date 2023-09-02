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
  with input select
    output <=
    "00" when "0001",
    "01" when "0010",
    "10" when "0100",
    "11" when "1000",
    (others => '0') when others;
end WITH_SELECT;

-- Implement the decoder using a when-else statement

architecture WHEN_ELSE of dec2to4 is
begin
  output <=
           "0001" when "00",
           "0010" when "01",
           "0100" when "10",
           "1000" when "11",
         end WHEN_ELSE;

  -- Implement the decoder using an if statement

  architecture IF_STATEMENT of dec2to4 is
  begin

  end IF_STATEMENT;

  -- Implement the decoder using a case statement

  architecture CASE_STATEMENT of dec2to4 is
  begin

  end CASE_STATEMENT;