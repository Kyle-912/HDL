library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity addr_gen is
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    go      : in  std_logic;
    en      : in  std_logic;
    size    : in  std_logic_vector(C_MEM_ADDR_WIDTH downto 0);
    rd_addr : out std_logic_vector(C_MEM_ADDR_WIDTH - 1 downto 0);
    rd_en   : out std_logic;
    done    : out std_logic
  );
end addr_gen;

architecture bhv of addr_gen is
  signal rd_en_delay_r : std_logic;
begin
  process (clk, rst)
  begin
    if rst = '1' then
      rd_en_delay_r <= '0';

    elsif rising_edge(clk) then
      rd_en_delay_r <= '1'; --TODO:
      if en = '1' then
        if go = '1' then
          
        else
          
        end if;
      end if;

    end if;
  end process;
  rd_en <= rd_en_delay_r;
end architecture;