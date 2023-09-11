library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent is
  port (
    clk : in std_logic;
    rst : in std_logic;
    en  : in std_logic;
    sig : in std_logic
  );
end ent;

architecture rtl of ent is
  type state_type is (IDLE);
  signal state_r, next_state : state_type;
begin

  process(clk, rst)
  begin
    if (rst = '1') then
      state_r <= IDLE;
    elsif (rising_edge(clk)) then
      state_r <= next_state;
    end if;
  end process;

  process(en, state_r)
  begin
    case state_r is
      when IDLE =>
        if en = '1' then
        next_state <= IDLE;
        end if;
      when others => null;
    end case;
  end process;
end architecture;