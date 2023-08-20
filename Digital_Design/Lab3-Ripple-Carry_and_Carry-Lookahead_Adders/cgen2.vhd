library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity cgen2 is port (
  c_in, bg_in1, bp_in1, bg_in2, bp_in2 : in  std_logic;
  c_out1, c_out2, bg_out, bp_out       : out std_logic
);
end cgen2;
architecture cgen2_BHV of cgen2 is
begin
  bg_out <= bg_in2 or (bp_in2 and bg_in1);
  bp_out <= bp_in2 and bp_in1;
  c_out1 <= bg_in1 or (bp_in1 and c_in);
  c_out2 <= bg_in2 or (bg_in1 and bp_in2) or (bp_in2 and bp_in1 and c_in);
end cgen2_BHV;