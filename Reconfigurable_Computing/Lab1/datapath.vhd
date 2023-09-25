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
  signal n_reg_out      : std_logic_vector(n'range);
  signal i_mux_out      : std_logic_vector(n'range);
  signal i_reg_out      : std_logic_vector(n'range);
  signal x_mux_out      : std_logic_vector(result'range);
  signal x_reg_out      : std_logic_vector(result'range);
  signal y_mux_out      : std_logic_vector(result'range);
  signal y_reg_out      : std_logic_vector(result'range);
  signal adder1_out     : std_logic_vector(n'range);
  signal adder2_out     : std_logic_vector(result'range);
  signal result_mux_out : std_logic_vector(result'range);
  signal result_reg_out : std_logic_vector(result'range);
begin
  U_N_REG : entity work.reg
    generic map(WIDTH => n'length)
    port map(
      clk    => clk,
      rst    => rst,
      input  => n,
      enable => n_en
    );

  U_COMPARATOR_EQUAL : entity work.comparator
    generic map(WIDTH => n'length)
    port map(
      x       => std_logic_vector(to_unsigned(0, n'length)),
      y       => n_reg_out,
      x_lte_y => open,
      x_e_y   => n_eq_0
    );

  U_COMPARATOR_LTE : entity work.comparator
    generic map(WIDTH => n'length)
    port map(
      x       => i_reg_out,
      y       => n_reg_out,
      x_lte_y => i_le_n,
      x_e_y   => open
    );

  U_I_MUX : entity work.mux2x1
    generic map(WIDTH => n'length)
    port map(
      input0 => std_logic_vector(to_unsigned(2, n'length)),
      input1 => adder1_out,
      sel    => i_sel,
      output => i_mux_out
    );

  U_I_REG : entity work.reg
    generic map(WIDTH => n'length)
    port map(
      clk    => clk,
      rst    => rst,
      input  => i_mux_out,
      enable => i_en,
      output => i_reg_out
    );

  U_ADDER1 : entity work.adder
    generic map(WIDTH => n'length)
    port map(
      in1    => i_reg_out,
      in2    => std_logic_vector(to_unsigned(1, n'length)),
      output => adder1_out
    );

  U_X_MUX : entity work.mux2x1
    generic map(WIDTH => result'length)
    port map(
      input0 => std_logic_vector(to_unsigned(0, result'length)),
      input1 => y_reg_out,
      sel    => x_sel,
      output => x_mux_out
    );

    U_X_REG : entity work.reg
    generic map (WIDTH => result'length)
    port map(
      clk      => clk,
      rst      => rst,
      input => x_mux_out,
      enable => x_en,
      output => x_reg_out
    );
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity comparator is
  generic (WIDTH : positive);
  port (
    x, y           : in  std_logic_vector(WIDTH - 1 downto 0);
    x_lte_y, x_e_y : out std_logic
  );
end comparator;
architecture comparator_BHV of comparator is
begin
  process (x, y)
  begin
    if (unsigned(x) <= unsigned(y)) then
      x_lte_y         <= '1';
    else
      x_lte_y <= '0';
    end if;
    if (unsigned(x) = unsigned(y)) then
      x_e_y <= '1';
    else
      x_e_y <= '0';
    end if;
  end process;
end architecture;