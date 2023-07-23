library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity test_tb is
end test_tb;
architecture test_arch of test_tb is
  component test
    port (
      clk      : in std_logic;
      rst      : in std_logic;
      go       : in std_logic;
      input    : in std_logic_vector(7 downto 0);
      done_out : out std_logic
    );
  end component;
  signal clk_tb      : std_logic                    := '0';
  signal rst_tb      : std_logic                    := '0';
  signal go_tb       : std_logic                    := '0';
  signal input_tb    : std_logic_vector(7 downto 0) := (others => '0');
  signal done_out_tb : std_logic;
begin
  uut : test
  port map(
    clk      => clk_tb,
    rst      => rst_tb,
    go       => go_tb,
    input    => input_tb,
    done_out => done_out_tb
  );
  clk_process : process
  begin
    clk_tb <= '0';
    wait for 5 ns;
    clk_tb <= '1';
    wait for 5 ns;
  end process;
  stimulus_process : process
  begin
    -- Positive test case: go = '1' and input = "00000000"
    wait for 10 ns;
    go_tb    <= '1';
    input_tb <= "00000000";
    wait for 10 ns;
    assert done_out_tb = '1' report "Positive test case failed for go = '1' and input = 00000000" severity error;
    -- Negative test case: go = '1' and input = "11111111"
    wait for 10 ns;
    go_tb    <= '1';
    input_tb <= "11111111";
    wait for 10 ns;
    assert done_out_tb = '0' report "Negative test case failed for go = '1' and input = 11111111" severity error;
    -- Positive test case: go = '0'
    wait for 10 ns;
    go_tb <= '0';
    wait for 10 ns;
    assert done_out_tb = '0' report "Positive test case failed for go = '0'" severity error;
    -- Negative test case: go = '1' and input = "01010101"
    wait for 10 ns;
    go_tb    <= '1';
    input_tb <= "01010101";
    wait for 10 ns;
    assert done_out_tb = '0' report "Negative test case failed for go = '1' and input = 01010101" severity error;
    -- Positive test case: go = '1' and input = "00000001"
    wait for 10 ns;
    go_tb    <= '1';
    input_tb <= "00000001";
    wait for 10 ns;
    assert done_out_tb = '0' report "Positive test case failed for go = '1' and input = 00000001" severity error;
    wait;
  end process;
end test_arch;