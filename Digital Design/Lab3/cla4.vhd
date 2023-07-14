library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cla4 is port
(
    x, y        : in std_logic_vector(3 downto 0);
    carry_in    : in std_logic;
    s           : out std_logic_vector(3 downto 0);
    carry_out   : out std_logic;
    bg, bp      : out std_logic
);
end cla4;

architecture cla4_BHV of cla4 is
    signal bp1, bg1, bp2, bg2, c_out1 : std_logic;
begin
    U_CLA4  : for i in 0 to 0 generate
        U_CLA2_1 : entity work.cla2
            port map
            (
                x => x(1 downto 0),
                y => y(1 downto 0),
                s => s(1 downto 0),
                bg => bg1,
                bp => bp1,
                carry_in => carry_in
            );
         U_CLA2_2 : entity work.cla2
            port map
            (
                x => x(3 downto 2),
                y => y(3 downto 2),
                s => s(3 downto 2),
                bg => bg2,
                bp => bp2,
                carry_in => c_out1
            );
        U_CGEN2 : entity work.cgen2
            port map
            (
                c_out1 => c_out1,
                c_out2 => carry_out,
                bg_out => bg,
                bp_out => bp,
                c_in => carry_in,
                bg_in1 => bg1,
                bp_in1 => bp1,
                bg_in2 => bg2,
                bp_in2 => bp2
            );
    end generate;
end cla4_BHV;