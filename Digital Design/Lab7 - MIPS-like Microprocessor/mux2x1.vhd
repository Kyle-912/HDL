library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux2x1 is
    generic (WIDTH : positive);
    port (
        input0 : in  std_logic_vector(WIDTH - 1 downto 0);
        input1 : in  std_logic_vector(WIDTH - 1 downto 0);
        sel    : in  std_logic;
        output : out std_logic_vector(WIDTH - 1 downto 0)
    );
end mux2x1;
architecture BHV of mux2x1 is
begin
    process (input0, input1, sel)
    begin
        case (sel) is
            when '0' =>
                output <= input0;
            when '1' =>
                output <= input1;
            when others => null;
        end case;
    end process;
end architecture;