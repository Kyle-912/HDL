library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port (
    clk        : in  std_logic;
    rst        : in  std_logic;
    go         : in  std_logic;
    done       : out std_logic;

    n_en       : out std_logic;
    result_en  : out std_logic;
    result_sel : out std_logic;
    x_en       : out std_logic;
    x_sel      : out std_logic;
    y_en       : out std_logic;
    y_sel      : out std_logic;
    i_en       : out std_logic;
    i_sel      : out std_logic;

    n_eq_0     : in  std_logic;
    i_le_n     : in  std_logic
  );
end fsm;

architecture default_arch of fsm is

begin

end default_arch;

