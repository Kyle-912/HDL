library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity clk_gen is
    generic (
        milliseconds : positive);
    port (
        clk50MHz : in  std_logic;
        rst      : in  std_logic;
        button_n : in  std_logic;
        clk_out  : out std_logic);
end clk_gen;
architecture clk_gen_BHV of clk_gen is
    signal counter_r : unsigned(10 downto 0) := "00000000000";
    signal millisec  : std_logic             := '0';
begin
    U_clk_gen : for i in 0 to 0 generate
        U_clk_div : entity work.clk_div
            generic map
            (
                clk_in_freq  => 50000000,
                clk_out_freq => 1000
            )
            port map
            (
                clk_in  => clk50MHz,
                clk_out => millisec,
                rst     => rst
            );
    end generate;
    process (millisec, rst)
    begin
        if (rst = '1') then
            clk_out   <= '0';
            counter_r <= (others => '0');
        elsif (rising_edge(millisec)) then
            if (button_n = '0') then
                counter_r <= counter_r + 1;
                if (counter_r = to_unsigned(milliseconds, 11)) then
                    counter_r <= (others => '0');
                    clk_out   <= '1';
                else
                    clk_out <= '0';
                end if;
            else
                clk_out   <= '0';
                counter_r <= (others => '0');
            end if;
        end if;
    end process;
end clk_gen_BHV;