library ieee;
use ieee.std_logic_1164.all;
entity gray2 is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    output : out std_logic_vector(3 downto 0));
end gray2;
architecture gray2_BHV of gray2 is
  signal state_r, next_state : std_logic_vector(3 downto 0);
begin
  process (clk, rst)
  begin
    if (rst = '1') then
      state_r <= "0000";
    elsif (rising_edge(clk)) then
      state_r <= next_state;
    end if;
  end process;
  process (state_r)
  begin
    case (state_r) is
      when "0000" =>
        output     <= "0000";
        next_state <= "0001";
      when "0001" =>
        output     <= "0001";
        next_state <= "0011";
      when "0011" =>
        output     <= "0011";
        next_state <= "0010";
      when "0010" =>
        output     <= "0010";
        next_state <= "0110";
      when "0110" =>
        output     <= "0110";
        next_state <= "0111";
      when "0111" =>
        output     <= "0111";
        next_state <= "0101";
      when "0101" =>
        output     <= "0101";
        next_state <= "0100";
      when "0100" =>
        output     <= "0100";
        next_state <= "1100";
      when "1100" =>
        output     <= "1100";
        next_state <= "1101";
      when "1101" =>
        output     <= "1101";
        next_state <= "1111";
      when "1111" =>
        output     <= "1111";
        next_state <= "1110";
      when "1110" =>
        output     <= "1110";
        next_state <= "1010";
      when "1010" =>
        output     <= "1010";
        next_state <= "1011";
      when "1011" =>
        output     <= "1011";
        next_state <= "1001";
      when "1001" =>
        output     <= "1001";
        next_state <= "1000";
      when "1000" =>
        output     <= "1000";
        next_state <= "0000";
      when others =>
    end case;
  end process;
end gray2_BHV;