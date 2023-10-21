-- Entity: memory_map
-- This entity establishes connections with user-defined addresses and
-- internal FPGA components (e.g. registers and blockRAMs).
--
-- Note: Make sure to use the addresses in user_pkg. Also, in your C code,
-- make sure to use the same constants.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.config_pkg.all;
use work.user_pkg.all;

entity memory_map is
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    wr_en   : in  std_logic;
    wr_addr : in  std_logic_vector(MMAP_ADDR_RANGE);
    wr_data : in  std_logic_vector(MMAP_DATA_RANGE);
    rd_en   : in  std_logic;
    rd_addr : in  std_logic_vector(MMAP_ADDR_RANGE);
    rd_data : out std_logic_vector(MMAP_DATA_RANGE);

    -- application-specific I/O
    go      : out std_logic;
    n       : out std_logic_vector(5 downto 0);
    result  : in  std_logic_vector(31 downto 0);
    done    : in  std_logic
  );
end memory_map;

architecture BHV of memory_map is
  signal go_r : std_logic;
  signal n_r  : std_logic_vector(n'range);
begin
  process (clk, rst)
  begin
    if rst = '1' then
      go_r <= '0';
      n_r  <= (others => '0');
    elsif rising_edge(clk) then
      if wr_en = '1' then
        case wr_addr is
          when std_logic_vector(to_unsigned(0, wr_addr'length)) =>
            go_r <= wr_data(0);

          when std_logic_vector(to_unsigned(1, wr_addr'length)) =>
            n_r <= wr_data(n'range);

          when others => null;
        end case;
      end if;
      if rd_en = '1' then
        case rd_addr is
          when std_logic_vector(to_unsigned(2, rd_addr'length)) =>
            rd_data <= result;

          when std_logic_vector(to_unsigned(3, rd_addr'length)) =>
            rd_data(0) <= done;

          when others => null;
        end case;
      end if;
    end if;
  end process;
end BHV;