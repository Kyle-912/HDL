library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity datapath is
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    valid_in  : in  std_logic;
    data_in   : in  std_logic_vector(C_MEM_IN_WIDTH - 1 downto 0);
    valid_out : out std_logic;
    data_out  : out std_logic_vector(C_MEM_OUT_WIDTH - 1 downto 0)
  );
end datapath;

architecture bhv of datapath is

begin

end architecture;