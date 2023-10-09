library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity peripheral_test is
  generic (width : positive);
  port (
    in0  : in  std_logic_vector(width - 1 downto 0);
    in1  : in  std_logic_vector(width - 1 downto 0);
    in2  : in  std_logic_vector(width - 1 downto 0);
    in3  : in  std_logic_vector(width - 1 downto 0);
    out0 : out std_logic_vector(width - 1 downto 0);
    out1 : out std_logic_vector(width - 1 downto 0);
    out2 : out std_logic_vector(width - 1 downto 0);
    out3 : out std_logic_vector(width - 1 downto 0)
  );
end peripheral_test;

architecture default_a of peripheral_test is
  signal in0_int, in1_int, result_int : integer;
begin
  in0_int    <= to_integer(unsigned(in0));
  in1_int    <= to_integer(unsigned(in1));
  result_int <= in0_int * in1_int;
  out0       <= std_logic_vector(to_unsigned(result_int, out0'length));

  out1 <= std_logic_vector(unsigned(in0) + unsigned(in1));

  out2 <= std_logic_vector(unsigned(in2) - unsigned(in1));
end architecture;