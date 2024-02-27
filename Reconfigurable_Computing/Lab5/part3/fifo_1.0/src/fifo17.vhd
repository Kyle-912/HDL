-- Shiva Jyothi Mallidi(UFID: 75384078)
-- Kyle Thompson(UFID: 30130224)

library ieee;
use ieee.std_logic_1164.all;

entity fifo17 is
  port (
    clk_src  : in  std_logic;
    clk_dest : in  std_logic;
    rst      : in  std_logic;
    empty    : out std_logic;
    full     : out std_logic;
    rd       : in  std_logic;
    wr       : in  std_logic;
    data_in  : in  std_logic_vector(16 downto 0);
    data_out : out std_logic_vector(16 downto 0));
end fifo17;

architecture STR of fifo17 is

  component fifo_generator_0
    port (
      rst         : in  std_logic;
      wr_clk      : in  std_logic;
      rd_clk      : in  std_logic;
      din         : in  std_logic_vector(16 downto 0);
      wr_en       : in  std_logic;
      rd_en       : in  std_logic;
      dout        : out std_logic_vector(16 downto 0);
      full        : out std_logic;
      empty       : out std_logic;
      wr_rst_busy : out std_logic;
      rd_rst_busy : out std_logic
    );
  end component;

begin -- STR
  U_FIFO17 : fifo_generator_0
  port map(
    rst         => rst,
    wr_clk      => clk_src,
    rd_clk      => clk_dest,
    din         => data_in,
    wr_en       => wr,
    rd_en       => rd,
    dout        => data_out,
    full        => full,
    empty       => empty,
    wr_rst_busy => open, --wr_rst_busy,
    rd_rst_busy => open  --rd_rst_busy
  );
end STR;