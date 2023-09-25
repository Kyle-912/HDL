library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
  type state_type is (START, COMPUTE, RESTART);
  signal state_r, next_state : state_type;
  signal done_r              : std_logic;

begin
  process (clk, rst)
  begin
    if (rst = '1') then
      state_r <= START;
    elsif (rising_edge(clk)) then
      state_r <= next_state;
    end if;
  end process;

  process (state_r, go, n_eq_0, i_le_n)
  begin

    next_state <= state_r;
    case state_r is
      when START =>
        if go = '1' then
          done_r     <= '0';
          n_en       <= '1';
          next_state <= COMPUTE;
        end if;

      when COMPUTE =>

      when RESTART =>

      when others  => null;
    end case;
  end process;
end default_arch;