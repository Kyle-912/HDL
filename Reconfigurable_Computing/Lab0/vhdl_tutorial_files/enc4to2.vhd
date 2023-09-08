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
      output <= "00";
    elsif input = "0010" then
      output <= "01";
    elsif input = "0011" then
      output <= "01";
    elsif input = "0100" then
      output <= "10";
    elsif input = "0101" then
      output <= "10";
    elsif input = "0110" then
      output <= "10";
    elsif input = "0111" then
      output <= "11";
    elsif input = "1000" then
      output <= "11";
    elsif input = "1001" then
      output <= "11";
    elsif input = "1010" then
      output <= "11";
    elsif input = "1011" then
      output <= "11";
    elsif input = "1100" then
      output <= "11";
    elsif input = "1101" then
      output <= "11";
    elsif input = "1110" then
      output <= "11";
    elsif input = "1111" then
      output <= "11";
    end if;
  end process;
end IF_STATEMENT;

-- TODO: Implement the priority encoder using a case statement. Note that this
-- architecture will be slightly trickier because a case statement has no
-- notion of priority.

architecture CASE_STATEMENT of enc4to2 is
begin
  valid <= '1';
  CASE_PROC : process (input)
  begin
    case input is
      when "0000" =>
        valid  <= '0';
        output <= "00";
      when "0001" =>
        output <= "00";

      when "0010" =>
        output <= "";

      when "0011" =>
        output <= "";

      when "0100" =>
        output <= "";

      when "0101" =>
        output <= "";

      when "0110" =>
        output <= "";

      when "0111" =>
        output <= "";

      when "1000" =>
        output <= "";

      when "1001" =>
        output <= "";

      when "1010" =>
        output <= "";

      when "1011" =>
        output <= "";

      when "1100" =>
        output <= "";

      when "1101" =>
        output <= "";

      when "1110" =>
        output <= "";

      when "1111" =>
        output <= "";

      when others =>
        output <= "";

    end case;
  end process;
end CASE_STATEMENT;