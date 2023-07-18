library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity register_32bit is
    port (
        clk    : in  std_logic;
        input  : in  std_logic_vector(31 downto 0);
        output : out std_logic_vector(31 downto 0)
    );
end register_32bit;
architecture BHV of register_32bit is
begin
    process (clk)
    begin
        if (rising_edge(clk)) then
            output <= input;
        end if;
    end process;
end architecture;