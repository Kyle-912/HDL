library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ir is
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    input   : in  std_logic_vector(31 downto 0);
    IRWrite : in  std_logic;
    IR25_0  : out std_logic_vector(25 downto 0);
    IR31_26 : out std_logic_vector(5 downto 0);
    IR5_0   : out std_logic_vector(5 downto 0);
    IR25_21 : out std_logic_vector(4 downto 0);
    IR20_16 : out std_logic_vector(4 downto 0);
    IR15_11 : out std_logic_vector(4 downto 0);
    IR15_0  : out std_logic_vector(15 downto 0);
    IR10_6  : out std_logic_vector(4 downto 0);
    IR      : out std_logic_vector(31 downto 0)
  );
end ir;
architecture BHV of ir is
  signal IR_r      : std_logic_vector(input'range); --for testing
  signal IR25_0_r  : std_logic_vector(25 downto 0) := (others => '0');
  signal IR31_26_r : std_logic_vector(5 downto 0)  := (others => '0');
  signal IR5_0_r   : std_logic_vector(5 downto 0)  := (others => '0');
  signal IR25_21_r : std_logic_vector(4 downto 0)  := (others => '0');
  signal IR20_16_r : std_logic_vector(4 downto 0)  := (others => '0');
  signal IR15_11_r : std_logic_vector(4 downto 0)  := (others => '0');
  signal IR15_0_r  : std_logic_vector(15 downto 0) := (others => '0');
  signal IR10_6_r  : std_logic_vector(4 downto 0)  := (others => '0');
begin
  IR      <= IR_r;
  IR25_0  <= IR25_0_r;
  IR31_26 <= IR31_26_r;
  IR5_0   <= IR5_0_r;
  IR25_21 <= IR25_21_r;
  IR20_16 <= IR20_16_r;
  IR15_11 <= IR15_11_r;
  IR15_0  <= IR15_0_r;
  IR10_6  <= IR10_6_r;
  process (clk, rst)
  begin
    if (rst = '1') then
      IR_r      <= (others => '0');
      IR25_0_r  <= (others => '0');
      IR31_26_r <= (others => '0');
      IR5_0_r   <= (others => '0');
      IR25_21_r <= (others => '0');
      IR20_16_r <= (others => '0');
      IR15_11_r <= (others => '0');
      IR15_0_r  <= (others => '0');
      IR10_6_r  <= (others => '0');
    elsif (rising_edge(clk)) then
      if (IRWrite = '1') then
        IR_r      <= input;
        IR25_0_r  <= input(25 downto 0);
        IR31_26_r <= input(31 downto 26);
        IR5_0_r   <= input(5 downto 0);
        IR25_21_r <= input(25 downto 21);
        IR20_16_r <= input(20 downto 16);
        IR15_11_r <= input(15 downto 11);
        IR15_0_r  <= input(15 downto 0);
        IR10_6_r  <= input(10 downto 6);
      end if;
    end if;
  end process;
end architecture;