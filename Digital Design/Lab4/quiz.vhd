library ieee;
use ieee.std_logic_1164.all;

entity quiz is
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        output : out std_logic_vector(3 downto 0));
end quiz;

architecture quiz_BHV of quiz is
    signal state_r : std_logic_vector(3 downto 0) := "0010";
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            output <= "0010";
            state_r <= "0010";
        elsif (rising_edge(clk)) then
            case state_r is
                when "0010" =>
                    output <= "0011";
                    state_r <= "0011";
                when "0011" =>
                    output <= "0110";
                    state_r <= "0110";
                when "0110" =>
                    output <= "1000";
                    state_r <= "1000";
                when "1000" =>
                    output <= "1001";
                    state_r <= "1001";
                when "1001" =>
                    output <= "0010";
                    state_r <= "0010";
                when others =>
            end case;
        end if ;
    end process ;
end quiz_BHV;