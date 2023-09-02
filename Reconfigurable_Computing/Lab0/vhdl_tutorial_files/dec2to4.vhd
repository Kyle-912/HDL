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
    "0001" when "00",
    "0010" when "01",
    "0100" when "10",
    "1000" when "11",
    (others => '0') when others;
end WITH_SELECT;

-- Implement the decoder using a when-else statement

architecture WHEN_ELSE of dec2to4 is
begin
  output <=
           "0001" when "00", else
           "0010" when "01", else
           "0100" when "10", else
           "1000" when "11", else
           (others => '0') when others;
end WHEN_ELSE;

-- Implement the decoder using an if statement

architecture IF_STATEMENT of dec2to4 is
begin
  if input = "00" then
    output <= "0001";
  elsif input = "01" then
    output <= "0010";
  elsif input = "10" then
    output <= "0100";
  elsif input = "11" then
    output <= "1000";
  end if;
end IF_STATEMENT;

-- Implement the decoder using a case statement

architecture CASE_STATEMENT of dec2to4 is
begin
  case input is

    when "00" =>
      output <= 

    when others =>

  end case;
end CASE_STATEMENT;