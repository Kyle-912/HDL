library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
  port (
    clk        : in  std_logic;
    rst        : in  std_logic;
    n          : in  std_logic_vector(5 downto 0);
    result     : out std_logic_vector(31 downto 0);

    n_en       : in  std_logic;
    result_en  : in  std_logic;
    result_sel : in  std_logic;
    x_en       : in  std_logic;
    x_sel      : in  std_logic;
    y_en       : in  std_logic;
    y_sel      : in  std_logic;
    i_en       : in  std_logic;
    i_sel      : in  std_logic;

    n_eq_0     : out std_logic;
    i_le_n     : out std_logic
  );
end datapath;

architecture default_arch of datapath is
begin

end default_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux2x1 is
  generic (WIDTH : positive);
  port (
    input0 : in  std_logic_vector(WIDTH - 1 downto 0);
    input1 : in  std_logic_vector(WIDTH - 1 downto 0);
    sel    : in  std_logic;
    output : out std_logic_vector(WIDTH - 1 downto 0)
  );
end mux2x1;
architecture BHV of mux2x1 is
begin
  process (input0, input1, sel)
  begin
    case (sel) is
      when '0' =>
        output <= input0;
      when '1' =>
        output <= input1;
      when others => null;
    end case;
  end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity reg is
  generic (WIDTH : positive);
  port (
    clk    : in  std_logic;
    rst    : in  std_logic;
    input  : in  std_logic_vector(WIDTH - 1 downto 0);
    enable : in  std_logic;
    output : out std_logic_vector(WIDTH - 1 downto 0)
  );
end reg;
architecture register_BHV of reg is
  signal output_r : std_logic_vector(WIDTH - 1 downto 0);
begin
  output <= output_r;
  process (clk, rst)
  begin
    if (rst = '1') then
      output_r <= (others => '0');
    elsif (rising_edge(clk)) then
      if (enable = '1') then
        output_r <= input;
      end if;
    end if;
  end process;
end architecture;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity adder is
  generic (WIDTH : positive);
  port (
    in1, in2 : in  std_logic_vector(WIDTH - 1 downto 0);
    output   : out std_logic_vector(WIDTH - 1 downto 0)
  );
end adder;
architecture adder_BHV of adder is
begin
  output <= std_logic_vector(unsigned(in1) + unsigned(in2));
end architecture;