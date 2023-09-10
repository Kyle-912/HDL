library ieee;
use ieee.std_logic_1164.all;

entity datapath is
  generic (
    width : positive := 16);
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    en        : in  std_logic;
    valid_in  : in  std_logic;
    valid_out : out std_logic;
    in1       : in  std_logic_vector(width - 1 downto 0);
    in2       : in  std_logic_vector(width - 1 downto 0);
    in3       : in  std_logic_vector(width - 1 downto 0);
    in4       : in  std_logic_vector(width - 1 downto 0);
    output    : out std_logic_vector(width * 2 downto 0)
  );
end datapath;

-- TODO: Implement the structural description of the datapath shown in
-- datapath.pdf by instantiating your add_pipe and mult_pipe entities. You may
-- also use the provided reg entity, or you can create your own.

architecture STR of datapath is
  signal REG1_r      : std_logic;
  signal REG2_r      : std_logic;
  signal REG1toREG2  : std_logic;
  signal MULT1toREG3 : std_logic_vector(width * 2 - 1 downto 0);
  signal MULT2toREG4 : std_logic_vector(width * 2 - 1 downto 0);
  signal REG3toADD   : std_logic_vector(width * 2 - 1 downto 0);
  signal REG4toADD   : std_logic_vector(width * 2 - 1 downto 0);
  signal ADDtoREG5   : std_logic_vector(output'range);
begin
  REG1_REG2_PROC : process (clk, rst)
  begin
    if rst = '1' then
      REG1_r <= '0';
      REG2_r <= '0';

    elsif rising_edge(clk) then
      if en = '1' then
        REG1_r <= valid_in;
        REG2_r <= REG1_r;
      end if;
    end if;
  end process;
  valid_out <= REG2_r;

  U_MULT1 : entity work.mult_pipe
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      en     => en,
      in1    => in1,
      in2    => in2,
      output => MULT1toREG3
    );

  U_MULT2 : entity work.mult_pipe
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      en     => en,
      in1    => in3,
      in2    => in4,
      output => MULT2toREG4
    );

  U_REG3 : entity work.reg
    generic map(WIDTH => WIDTH*2)
    port map(
      clk    => clk,
      rst    => rst,
      en     => en,
      input  => MULT1toREG3,
      output => REG3toADD
    );

  U_REG4 : entity work.reg
    generic map(WIDTH => WIDTH*2)
    port map(
      clk    => clk,
      rst    => rst,
      en     => en,
      input  => MULT2toREG4,
      output => REG4toADD
    );

  U_ADD : entity work.add_pipe
    generic map(WIDTH => WIDTH*2)
    port map(
      clk    => clk,
      rst    => rst,
      en     => en,
      in1    => REG3toADD,
      in2    => REG4toADD,
      output => ADDtoREG5
    );

  U_REG5 : entity work.reg
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      en     => en,
      input  => ADDtoREG5,
      output => output
    );
end STR;