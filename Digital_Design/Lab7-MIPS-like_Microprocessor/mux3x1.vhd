library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mux3x1 is
  port (
    input0 : in  std_logic_vector(31 downto 0);
    input1 : in  std_logic_vector(31 downto 0);
    input2 : in  std_logic_vector(31 downto 0);
    sel    : in  std_logic_vector(1 downto 0);
    output : out std_logic_vector(31 downto 0)
  );
end mux3x1;
architecture BHV of mux3x1 is
begin
  process (input0, input1, input2, sel)
  begin
    case (sel) is
      when "00" =>
        output <= input0;
      when "01" =>
        output <= input1;
      when "10" =>
        output <= input2;
      when "11"         =>
        output <= (others => '0');
      when others       => null;
    end case;
  end process;
end architecture;