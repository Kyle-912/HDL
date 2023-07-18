library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity cla2 is port (
    x, y      : in  std_logic_vector(1 downto 0);
    carry_in  : in  std_logic;
    s         : out std_logic_vector(1 downto 0);
    carry_out : out std_logic;
    bg, bp    : out std_logic
);
end cla2;
architecture cla2_BHV of cla2 is
    signal temp_carry : std_logic;
begin
    s(0)       <= x(0) xor y(0) xor carry_in;
    temp_carry <= (x(0) and y(0)) or (x(0) and carry_in) or (y(0) and carry_in);
    s(1)       <= x(1) xor y(1) xor temp_carry;
    carry_out  <= (x(1) and y(1)) or ((x(0) and y(0)) and (x(1) or y(1))) or ((x(1) or y(1)) and (x(0) or y(0)) and carry_in);
    bg         <= (x(1) and y(1)) or ((x(0) and y(0)) and (x(1) or y(1)));
    bp         <= (x(1) or y(1)) and (x(0) or y(0));
end cla2_BHV;