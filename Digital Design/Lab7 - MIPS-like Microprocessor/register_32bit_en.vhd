library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_32bit_en is
    port
    (
        clk    : in  std_logic;
        en     : in  std_logic;
        input  : in  std_logic_vector(31 downto 0);
        output : out std_logic_vector(31 downto 0)
    );
end register_32bit_en;

architecture BHV of register_32bit_en is
begin
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (en = '1') then
                output <= input;
            end if;
        end if;
    end process;
end architecture;