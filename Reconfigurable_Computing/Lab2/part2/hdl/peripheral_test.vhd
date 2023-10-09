library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity peripheral_test is
  generic (width : positive);
  port (
    in0  : in  std_logic_vector(width - 1 downto 0);
    in1  : in  std_logic_vector(width - 1 downto 0);
    in2  : in  std_logic_vector(width - 1 downto 0);
    in3  : in  std_logic_vector(width - 1 downto 0);
    out0 : out std_logic_vector(width - 1 downto 0);
    out1 : out std_logic_vector(width - 1 downto 0);
    out2 : out std_logic_vector(width - 1 downto 0);
    out3 : out std_logic_vector(width - 1 downto 0)
  );
end peripheral_test;

architecture default_arch of peripheral_test is
begin

end default_arch;



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent is
    port (
        clk : in std_logic;
        rst : in std_logic
    );
end ent;

architecture rtl of ent is

begin

end architecture;