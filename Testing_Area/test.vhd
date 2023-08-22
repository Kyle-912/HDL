library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity test is
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;
    go       : in  std_logic;
    input    : in  std_logic_vector(7 downto 0);
    done_out : out std_logic
  );
end test;
architecture bhv of test is
  type state_type is (IDLE, CHECK, DONE);
  signal state   : state_type;
  signal input_r : std_logic_vector(7 downto 0);
begin
  TEST_PROC : process (clk, rst)
  begin
    if rst = '1' then
      input_r  <= (others => '0');
      state    <= IDLE;
      done_out <= '0';
    elsif rising_edge(clk) then
      input_r <= input;
      case state is
        when IDLE =>
          if go = '1' then
            state <= CHECK; 
          end if;
        when CHECK =>
          if unsigned(input_r) = to_unsigned(0, input_r'length) then
            done_out <= '1';
            state    <= DONE;
          end if;
        when DONE =>
          if go = '0' then
            done_out <= '0';
            state    <= IDLE;
          end if;
        when others => null;
      end case;
    end if;
  end process;
end architecture;