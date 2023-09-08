library ieee;
use ieee.std_logic_1164.all;

entity enc4to2 is
  port (
    input  : in  std_logic_vector(3 downto 0);
    output : out std_logic_vector(1 downto 0);
    valid  : out std_logic);
end enc4to2;

-- TODO: implement the priority encoder using an if statement

architecture IF_STATEMENT of enc4to2 is
begin
  valid <= '1';
  IF_PROC : process (input)
  begin
    if input = "0000" then
      valid  <= '0';
      output <= "00";
    elsif input = "0001" then
output <=  "00";
    elsif input = "0010" then
output <=  ;

    elsif input = "0011" then
output <=  ;

    elsif input = "0100" then
output <=  ;

    elsif input = "0101" then
output <=  ;

    elsif input = "0110" then
output <=  ;

    elsif input = "0111" then
output <=  ;

    elsif input = "1000" then
output <=  ;

    elsif input = "1001" then
output <=  ;

    elsif input = "1010" then
output <=  ;

    elsif input = "1011" then
output <=  ;

    elsif input = "1100" then

output <=  ;
    elsif input = "1101" then

output <=  ;
    elsif input = "1110" then

output <=  ;
    elsif input = "1111" then

output <=  ;
    end if;
  end process;
end IF_STATEMENT;

-- TODO: Implement the priority encoder using a case statement. Note that this
-- architecture will be slightly trickier because a case statement has no
-- notion of priority.

architecture CASE_STATEMENT of enc4to2 is
begin

end CASE_STATEMENT;