library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library altera_mf;
use altera_mf.altera_mf_components.all;
entity MIPS_tb is
end MIPS_tb;
architecture TB of MIPS_tb is
  signal clk50MHz : std_logic := '0';
  signal clockEn  : std_logic := '1';
  signal switch   : std_logic_vector(9 downto 0);
  signal button_n : std_logic_vector(1 downto 0);
  signal led0     : std_logic_vector(6 downto 0);
  signal led0_dp  : std_logic;
  signal led1     : std_logic_vector(6 downto 0);
  signal led1_dp  : std_logic;
  signal led2     : std_logic_vector(6 downto 0);
  signal led2_dp  : std_logic;
  signal led3     : std_logic_vector(6 downto 0);
  signal led3_dp  : std_logic;
  signal led4     : std_logic_vector(6 downto 0);
  signal led4_dp  : std_logic;
  signal led5     : std_logic_vector(6 downto 0);
  signal led5_dp  : std_logic;
  component top_level is
    port (
      clk50MHz : in  std_logic;
      switch   : in  std_logic_vector(9 downto 0);
      button_n : in  std_logic_vector(1 downto 0);
      led0     : out std_logic_vector(6 downto 0);
      led0_dp  : out std_logic;
      led1     : out std_logic_vector(6 downto 0);
      led1_dp  : out std_logic;
      led2     : out std_logic_vector(6 downto 0);
      led2_dp  : out std_logic;
      led3     : out std_logic_vector(6 downto 0);
      led3_dp  : out std_logic;
      led4     : out std_logic_vector(6 downto 0);
      led4_dp  : out std_logic;
      led5     : out std_logic_vector(6 downto 0);
      led5_dp  : out std_logic
    );
  end component;
begin --TB
  clk50MHz <= not clk50MHz and clockEn after 40 ns;
  UUT : top_level
  port map
  (
    clk50MHz => clk50MHz,
    switch   => switch,
    button_n => button_n,
    led0     => led0,
    led0_dp  => led0_dp,
    led1     => led1,
    led1_dp  => led1_dp,
    led2     => led2,
    led2_dp  => led2_dp,
    led3     => led3,
    led3_dp  => led3_dp,
    led4     => led4,
    led4_dp  => led4_dp,
    led5     => led5,
    led5_dp  => led5_dp
  );
  process
  begin
    button_n(1) <= '0'; -- enable rst
    wait for 100 ns;
    button_n(1) <= '1'; --disable reset
    wait for 100 ns;
    switch(9)          <= '0';         -- in port 0
    switch(8 downto 0) <= "000001000"; -- 8
    button_n(0)        <= '0';
    wait for 100 ns;
    button_n(0) <= '1';
    button_n(1) <= '0'; -- enable rst
    wait for 100 ns;
    button_n(1) <= '1'; --disable reset
    wait for 100 ns;
    switch(9)          <= '1';         -- in port 1
    switch(8 downto 0) <= "000001100"; -- 12
    button_n(0)        <= '0';
    button_n(1)        <= '0'; -- enable rst
    wait for 100 ns;
    button_n(1) <= '1'; --disable reset
    wait for 100 ns;
    wait for 50000 ns;
    clockEn <= '0';
    wait;
  end process;
end TB;