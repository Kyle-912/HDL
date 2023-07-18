library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity vga_mux2x1 is
    port (
        in1, in2         : in  std_logic_vector(11 downto 0);
        sel1, sel2, sel3 : in  std_logic;
        output           : out std_logic_vector(11 downto 0)
    );
end vga_mux2x1;
architecture vga_mux2x1_BHV of vga_mux2x1 is
begin
    process (in1, in2, sel1, sel2, sel3)
    begin
        if (sel1 = '1' and sel2 = '1' and sel3 = '1') then
            output <= in1;
        else
            output <= in2;
        end if;
    end process;
end architecture;