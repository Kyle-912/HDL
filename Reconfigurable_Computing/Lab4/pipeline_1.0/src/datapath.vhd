library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity datapath is
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    valid_in  : in  std_logic;
    data_in   : in  std_logic_vector(C_MEM_IN_WIDTH - 1 downto 0);
    valid_out : out std_logic;
    data_out  : out std_logic_vector(C_MEM_OUT_WIDTH - 1 downto 0)
  );
end datapath;

architecture bhv of datapath is
  signal in0_r        : std_logic_vector(7 downto 0);
  signal in1_r        : std_logic_vector(7 downto 0);
  signal in2_r        : std_logic_vector(7 downto 0);
  signal in3_r        : std_logic_vector(7 downto 0);
  signal product0_r   : std_logic_vector(15 downto 0);
  signal product1_r   : std_logic_vector(15 downto 0);
  signal sum_r        : std_logic_vector(16 downto 0);
  signal valid_delay1 : std_logic;
  signal valid_delay2 : std_logic;
  signal valid_delay3 : std_logic;
begin
  CALC_PROC : process (clk, rst)
  begin
    if rst = '1' then
      in0_r        <= (others => '0');
      in1_r        <= (others => '0');
      in2_r        <= (others => '0');
      in3_r        <= (others => '0');
      product0_r   <= (others => '0');
      product1_r   <= (others => '0');
      sum_r        <= (others => '0');
      valid_delay1 <= '0';
      valid_delay2 <= '0';
      valid_delay3 <= '0';

    elsif rising_edge(clk) then
      in0_r        <= data_in(31 downto 24);
      in1_r        <= data_in(23 downto 16);
      in2_r        <= data_in(15 downto 8);
      in3_r        <= data_in(7 downto 0);
      valid_delay1 <= valid_in;

      product0_r   <= std_logic_vector(unsigned(in0_r) * unsigned(in1_r));
      product1_r   <= std_logic_vector(unsigned(in2_r) * unsigned(in3_r));
      valid_delay2 <= valid_delay1;

      sum_r        <= std_logic_vector(resize(unsigned(product0_r), sum_r'length) + unsigned(product1_r));
      valid_delay3 <= valid_delay2;
    end if;
  end process;
  data_out <= sum_r;
end architecture;

-- data_in(7 downto 0)
-- data_in(15 downto 8)
-- data_in(23 downto 16)
-- data_in(31 downto 24)
-- data_out <= std_logic_vector(resize((unsigned(data_in(31 downto 24)) * unsigned(data_in(23 downto 16))), data_out'length) + (unsigned(data_in(15 downto 8)) * unsigned(data_in(7 downto 0))));