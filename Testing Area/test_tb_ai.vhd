library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity test_tb is
end test_tb;
architecture test_arch of test_tb is
    component test is
        port
        (
            clk   : in  std_logic;
            rst   : in  std_logic;
            go    : in  std_logic;
            input : in  std_logic_vector(7 downto 0);
            done  : out std_logic
        );
    end component;
    signal clk   : std_logic                    := '0';
    signal rst   : std_logic                    := '1';
    signal go    : std_logic                    := '0';
    signal input : std_logic_vector(7 downto 0) := (others => '0');
    signal done  : std_logic;
begin
    DUT : test
    port map
    (
        clk   => clk,
        rst   => rst,
        go    => go,
        input => input,
        done  => done
    );
    -- Clock generation process
    clk_process : process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for 5 ns;
        end loop;
        wait;
    end process;
    -- Test cases
    test_cases : process
    begin
        -- Positive test case: go = '1', input = "00000001"
        go    <= '1';
        input <= "00000001";
        wait for 10 ns;
        assert done = '0' report "Test case 1 failed" severity error;
        wait for 10 ns;
        assert done = '1' report "Test case 1 failed" severity error;
        wait for 10 ns;
        assert done = '0' report "Test case 1 failed" severity error;
        -- Negative test case: go = '0', input = "00000000"
        go    <= '0';
        input <= "00000000";
        wait for 10 ns;
        assert done = '0' report "Test case 2 failed" severity error;
        wait for 10 ns;
        assert done = '0' report "Test case 2 failed" severity error;
        wait for 10 ns;
        assert done = '0' report "Test case 2 failed" severity error;
        -- Add more test cases here
        wait;
    end process;
end test_arch;