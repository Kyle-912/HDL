-- I/O Explanation (assumes the switches are on side of the
--                  board that is closest to you)
-- switch(9) is the leftmost switch
-- button_n(1) is the top button
-- led5 is the leftmost 7-segment LED
-- ledx_dp is the decimal point on the 7-segment LED for LED x

-- Note: this code will cause a harmless synthesis warning because 
-- some output pins are always '0' or '1'.

library ieee;
use ieee.std_logic_1164.all;

entity top_level is
    port (
        clk50MHz : in  std_logic;
        switch   : in  std_logic_vector(9 downto 0);
        button_n : in  std_logic_vector(1 downto 0);
        led0     : out std_logic_vector(6 downto 0);
        led0_dp  : out std_logic;
        led1     : out std_logic_vector(6 downto 0);
        led1_dp  : out std_logic;
        led2     : out std_logic_vector(6 downto 0);
        led2_dp  : out std_logic;
        led3     : out std_logic_vector(6 downto 0);
        led3_dp  : out std_logic;
        led4     : out std_logic_vector(6 downto 0);
        led4_dp  : out std_logic;
        led5     : out std_logic_vector(6 downto 0);
        led5_dp  : out std_logic
        );
end top_level;

architecture STR of top_level is
    constant C0   : std_logic_vector(3 downto 0) := (others => '0');
 
    signal rst         : std_logic := '1';
    signal switch_data : std_logic_vector(31 downto 0);
    signal port_select : std_logic;
    signal in_port_en  : std_logic;
    signal out_port    : std_logic_vector(31 downto 0);
begin  -- STR

    rst         <= not button_n(1);
    in_port_en  <= not button_n(0);
    switch_data <= "00000000000000000000000" & switch(8 downto 0);
    port_select <= switch(9);

    U_DATAPATH : entity work.datapath 
    port map (
        clk50MHz    => clk50MHz,
        rst         => rst,
        switch_data => switch_data,
        port_select => port_select,
        in_port_en  => in_port_en,
        out_port    => out_port
        );

    U_LED5 : entity work.decoder7seg port map (
        input  => out_port(23 downto 20),
        output => led5);

    U_LED4 : entity work.decoder7seg port map (
        input  => out_port(19 downto 16),
        output => led4);

    U_LED3 : entity work.decoder7seg port map (
        input  => out_port(15 downto 12),
        output => led3);

    U_LED2 : entity work.decoder7seg port map (
        input  => out_port(11 downto 8),
        output => led2);

    U_LED1 : entity work.decoder7seg port map (
        input  => out_port(7 downto 4),
        output => led1);

    U_LED0 : entity work.decoder7seg port map (
        input  => out_port(3 downto 0),
        output => led0);

    led5_dp <= '1';
    led4_dp <= '1';
    led3_dp <= '1';
    led2_dp <= '1';
    led1_dp <= '1';
    led0_dp <= '1';

end STR;