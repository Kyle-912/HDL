library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtractor is
    generic (WIDTH : positive);
    port (
        in1, in2 : in  std_logic_vector(WIDTH-1 downto 0);
        output   : out std_logic_vector(WIDTH-1 downto 0)
    );
end subtractor;

architecture subtractor_BHV of subtractor is
begin
    output <= std_logic_vector(unsigned(in1) - unsigned(in2));
end architecture;