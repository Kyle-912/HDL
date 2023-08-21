library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity datapath2 is
  generic (WIDTH : positive);
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    x         : in  std_logic_vector(WIDTH - 1 downto 0);
    y         : in  std_logic_vector(WIDTH - 1 downto 0);
    output    : out std_logic_vector(WIDTH - 1 downto 0);
    x_sel     : in  std_logic;
    y_sel     : in  std_logic;
    x_en      : in  std_logic;
    y_en      : in  std_logic;
    output_en : in  std_logic;
    x_lt_y    : out std_logic;
    x_ne_y    : out std_logic
  );
end datapath2;
architecture D1 of datapath2 is
  signal mux_x_output, mux_y_output, mux_a_output, mux_b_output, sub_output, reg_x_output, reg_y_output : std_logic_vector(WIDTH - 1 downto 0);
  signal x_lt_y_s                                                                                       : std_logic;
begin
  x_lt_y <= x_lt_y_s;
  U_MUX_X : entity work.mux2x1
    generic map(WIDTH => WIDTH)
    port map(
      input1    => x,
      input2    => sub_output,
      sel    => x_sel,
      output => mux_x_output
    );
  U_MUX_Y : entity work.mux2x1
    generic map(WIDTH => WIDTH)
    port map(
      input1    => y,
      input2    => sub_output,
      sel    => y_sel,
      output => mux_y_output
    );
  U_MUX_A : entity work.mux2x1
    generic map(WIDTH => WIDTH)
    port map(
      input1    => reg_x_output,
      input2    => reg_y_output,
      sel    => x_lt_y_s,
      output => mux_a_output
    );
  U_MUX_B : entity work.mux2x1
    generic map(WIDTH => WIDTH)
    port map(
      input1    => reg_y_output,
      input2    => reg_x_output,
      sel    => x_lt_y_s,
      output => mux_b_output
    );
  U_tmpX_REGISTER : entity work.reg
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      input  => mux_x_output,
      enable => x_en,
      output => reg_x_output
    );
  U_tmpY_REGISTER : entity work.reg
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      input  => mux_y_output,
      enable => y_en,
      output => reg_y_output
    );
  U_OUPUT_REGISTER : entity work.reg
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      input  => reg_x_output,
      enable => output_en,
      output => output
    );
  U_SUBTRACTOR : entity work.subtractor
    generic map(WIDTH => WIDTH)
    port map(
      input1    => mux_a_output,
      input2    => mux_b_output,
      output => sub_output
    );
  U_COMPARATOR : entity work.comparator
    generic map(WIDTH => WIDTH)
    port map(
      x      => reg_x_output,
      y      => reg_y_output,
      x_lt_y => x_lt_y_s,
      x_ne_y => x_ne_y
    );
end architecture;