library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
  port (
    clk        : in  std_logic;
    rst        : in  std_logic;
    n          : in  std_logic_vector(5 downto 0);
    result     : out std_logic_vector(31 downto 0);

    n_en       : in  std_logic;
    result_en  : in  std_logic;
    result_sel : in  std_logic;
    x_en       : in  std_logic;
    x_sel      : in  std_logic;
    y_en       : in  std_logic;
    y_sel      : in  std_logic;
    i_en       : in  std_logic;
    i_sel      : in  std_logic;

    n_eq_0     : out std_logic;
    i_le_n     : out std_logic
  );
end datapath;

architecture default_arch of datapath is
begin

end default_arch;

