library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent is
  port (
    clk : in std_logic;
    rst : in std_logic;
    input : in std_logic_vector(7 downto 0)
  );
end ent;

architecture rtl of ent is
signal input_r : std_logic_vector(7 downto 0);
begin

end architecture;