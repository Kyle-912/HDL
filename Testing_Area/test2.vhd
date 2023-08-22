library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ent is
  port (
    clk : in std_logic;
    rst : in std_logic;
    input : in std_logic_vector(7 downto 0);
    done : out std_logic
  );
end ent;

architecture rtl of ent is
signal input_r : std_logic_vector(7 downto 0);
begin
TEST_PROC : process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      input_r <= (others => '0');

    else
case input_r is

  when "00000000" =>
    

  when others =>

end case;

    end if;
  end if;
end process;
end architecture;