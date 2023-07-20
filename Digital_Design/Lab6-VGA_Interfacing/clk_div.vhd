library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity clk_div is
    generic (
        clk_in_freq  : natural;  -- Input clock frequency
        clk_out_freq : natural); -- Output clock frequency
    port (
        clk_in  : in  std_logic;
        clk_out : out std_logic;
        rst     : in  std_logic);
end clk_div;
architecture clk_div_BHV of clk_div is
    constant RATIO   : integer := clk_in_freq / clk_out_freq;
    signal counter_r : unsigned(26 downto 0);
begin
    process (clk_in, rst)
    begin
        if (rst = '1') then
            counter_r <= (others => '0');
            clk_out   <= '0';
        elsif (rising_edge(clk_in)) then
            counter_r <= counter_r + 1;
            if (counter_r = to_unsigned(RATIO - 1, 27)) then
                counter_r <= (others => '0');
                clk_out   <= '1';
            elsif (counter_r = to_unsigned(RATIO/100, 27)) then
                clk_out <= '0';
            end if;
        end if;
    end process;
end clk_div_BHV;