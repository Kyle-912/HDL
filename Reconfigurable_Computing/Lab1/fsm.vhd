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

  done <= done_r;

  process (clk, rst)
  begin
    if (rst = '1') then
      state_r <= START;
      done_r  <= '0';
    elsif (rising_edge(clk)) then
      state_r <= next_state;
    end if;
  end process;

  process (state_r, go, n_eq_0, i_le_n)
  begin
    n_en       <= '0';
    result_en  <= '0';
    result_sel <= '0';
    x_en       <= '0';
    x_sel      <= '0';
    y_en       <= '0';
    y_sel      <= '0';
    i_en       <= '0';
    i_sel      <= '0';
    next_state <= state_r;
    case state_r is
      when START =>
        if go = '1' then
          done_r     <= '0';
          n_en       <= '1';
          x_sel      <= '0';
          x_en       <= '1';
          y_sel      <= '0';
          y_en       <= '1';
          i_sel      <= '0';
          i_en       <= '1';
          next_state <= COMPUTE;
        end if;

      when COMPUTE =>
        if n_eq_0 = '1' then
          result_sel <= '0';
          result_en  <= '1';
        else
          while i_le_n = '1' loop
            i_sel <= '1';
            i_en  <= '1';
            x_sel <= '1';
            x_en  <= '1';
            y_sel <= '1';
            y_en  <= '1';
          end loop;
            if i_le_n = '1' then
              
            else
              
            end if;
          next_state <= RESTART;
        end if;

      when RESTART =>
        result_sel <= '1';
        result_en  <= '1';
        done_r     <= '1';
        if go = '0' then
          next_state <= START;
        end if;

      when others => null;
    end case;
  end process;
end default_arch;