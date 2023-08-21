library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity datapath1 is
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
end datapath1;
architecture D1 of datapath1 is
  signal mux_to_reg_x, mux_to_reg_y, sub1_output, sub2_output, reg_x_output, reg_y_output : std_logic_vector(WIDTH - 1 downto 0);
begin
  U_MUX_X : entity work.mux2x1
    generic map(WIDTH => WIDTH)
    port map(
      input0 => x,
      input1 => sub1_output,
      sel    => x_sel,
      output => mux_to_reg_x
    );
  U_MUX_Y : entity work.mux2x1
    generic map(WIDTH => WIDTH)
    port map(
      input0 => y,
      input1 => sub2_output,
      sel    => y_sel,
      output => mux_to_reg_y
    );
  U_tmpX_REGISTER : entity work.reg
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      input  => mux_to_reg_x,
      enable => x_en,
      output => reg_x_output
    );
  U_tmpY_REGISTER : entity work.reg
    generic map(WIDTH => WIDTH)
    port map(
      clk    => clk,
      rst    => rst,
      input  => mux_to_reg_y,
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
  U_SUBTRACTOR1 : entity work.subtractor
    generic map(WIDTH => WIDTH)
    port map(
      in1 => reg_x_output,
      in2 => reg_y_output,
      output => sub1_output
    );
  U_SUBTRACTOR2 : entity work.subtractor
    generic map(WIDTH => WIDTH)
    port map(
      in1 => reg_y_output,
      in2 => reg_x_output,
      output => sub2_output
    );
  U_COMPARATOR : entity work.comparator
    generic map(WIDTH => WIDTH)
    port map(
      x      => reg_x_output,
      y      => reg_y_output,
      x_lt_y => x_lt_y,
      x_ne_y => x_ne_y
    );
end architecture;