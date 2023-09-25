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
begin
    
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
        port map (
            clk    => clk,
            rst    => rst,
            go     => go,
            n      => n,
            result => result,
            done   => done
            );

end default_arch;
