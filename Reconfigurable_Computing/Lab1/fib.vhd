library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fib is
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    go     : in  std_logic;
    n      : in  std_logic_vector(5 downto 0);
    result : out std_logic_vector(31 downto 0);
    done   : out std_logic
  );
end fib;

-- TODO: Add your FSMD architecture here.

architecture fsmd of fib is
  type state_t is (START, COMPUTE, RESTART);
  signal state_r  : state_t;
  signal n_r      : std_logic_vector(n'range);
  signal result_r : std_logic_vector(result'range);
  signal done_r   : std_logic;
begin
  result <= result_r;
  done   <= done_r;
  process (clk, rst)
  begin
    if rst = '1' then
      n_r      <= (others => '0');
      result_r <= (others => '0');
      done_r   <= '0';
      state_r <= START;

    elsif rising_edge(clk) then
      done_r <= '0';

    end if;
  end process;
end fsmd;

-- TODO: Complete the FSM+D architecture here. Some signals are provided to
-- speed things up. You only need to connect the FSM and datapath together.

architecture fsm_plus_d of fib is

  signal n_en       : std_logic;
  signal result_en  : std_logic;
  signal result_sel : std_logic;
  signal x_en       : std_logic;
  signal x_sel      : std_logic;
  signal y_en       : std_logic;
  signal y_sel      : std_logic;
  signal i_en       : std_logic;
  signal i_sel      : std_logic;
  signal n_eq_0     : std_logic;
  signal i_le_n     : std_logic;

begin

end fsm_plus_d;

-- TODO: Change the architecture that is used to simulate and synthesis each
-- architecture.

architecture default_arch of fib is
begin

  U_FIB : entity work.fib(fsmd)
    --U_FIB : entity work.fib(fsm_plus_d)
    port map(
      clk    => clk,
      rst    => rst,
      go     => go,
      n      => n,
      result => result,
      done   => done
    );

end default_arch;