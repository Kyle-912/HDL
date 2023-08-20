library ieee;
use ieee.std_logic_1164.all;
entity gray1 is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    output : out std_logic_vector(3 downto 0));
end gray1;
architecture gray1_BHV of gray1 is
  signal state_r : std_logic_vector(3 downto 0) := "0000";
begin
  process (clk, rst)
  begin
    if (rst = '1') then
      output  <= "0000";
      state_r <= "0000";
    elsif (rising_edge(clk)) then
      case state_r is
        when "0000" =>
          output  <= "0001";
          state_r <= "0001";
        when "0001" =>
          output  <= "0011";
          state_r <= "0011";
        when "0011" =>
          output  <= "0010";
          state_r <= "0010";
        when "0010" =>
          output  <= "0110";
          state_r <= "0110";
        when "0110" =>
          output  <= "0111";
          state_r <= "0111";
        when "0111" =>
          output  <= "0101";
          state_r <= "0101";
        when "0101" =>
          output  <= "0100";
          state_r <= "0100";
        when "0100" =>
          output  <= "1100";
          state_r <= "1100";
        when "1100" =>
          output  <= "1101";
          state_r <= "1101";
        when "1101" =>
          output  <= "1111";
          state_r <= "1111";
        when "1111" =>
          output  <= "1110";
          state_r <= "1110";
        when "1110" =>
          output  <= "1010";
          state_r <= "1010";
        when "1010" =>
          output  <= "1011";
          state_r <= "1011";
        when "1011" =>
          output  <= "1001";
          state_r <= "1001";
        when "1001" =>
          output  <= "1000";
          state_r <= "1000";
        when "1000" =>
          output  <= "0000";
          state_r <= "0000";
        when others =>
      end case;
    end if;
  end process;
end gray1_BHV;