library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_lib.all;
entity row_address_logic is
  port (
    v_count : in  std_logic_vector(COUNT_RANGE);
    img_pos : in  std_logic_vector(2 downto 0);
    row     : out std_logic_vector(ROM_ADDR_BOTTOM_HALF_RANGE);
    row_en  : out std_logic
  );
end row_address_logic;
architecture row_address_logic_BHV of row_address_logic is
begin
  process (v_count)
  begin
    case(img_pos) is
      when CENTERED =>
      if (unsigned(v_count) >= to_unsigned(CENTERED_Y_START, COUNT_WIDTH) and unsigned(v_count) <= to_unsigned(CENTERED_Y_END, COUNT_WIDTH)) then
        row_en <= '1';
        row    <= std_logic_vector(resize((unsigned(v_count) - to_unsigned(CENTERED_Y_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
      else
        row_en <= '0';
        row    <= (others => '0');
      end if;
      when TOP_LEFT =>
      if (unsigned(v_count) >= to_unsigned(TOP_LEFT_Y_START, COUNT_WIDTH) and unsigned(v_count) <= to_unsigned(TOP_LEFT_Y_END, COUNT_WIDTH)) then
        row_en <= '1';
        row    <= std_logic_vector(resize(unsigned(v_count) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
      else
        row_en <= '0';
        row    <= (others => '0');
      end if;
      when TOP_RIGHT =>
      if (unsigned(v_count) >= to_unsigned(TOP_RIGHT_Y_START, COUNT_WIDTH) and unsigned(v_count) <= to_unsigned(TOP_RIGHT_Y_END, COUNT_WIDTH)) then
        row_en <= '1';
        row    <= std_logic_vector(resize((unsigned(v_count) - to_unsigned(TOP_RIGHT_Y_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
      else
        row_en <= '0';
        row    <= (others => '0');
      end if;
      when BOTTOM_LEFT =>
      if (unsigned(v_count) >= to_unsigned(BOTTOM_LEFT_Y_START, COUNT_WIDTH) and unsigned(v_count) <= to_unsigned(BOTTOM_LEFT_Y_END, COUNT_WIDTH)) then
        row_en <= '1';
        row    <= std_logic_vector(resize((unsigned(v_count) - to_unsigned(BOTTOM_LEFT_Y_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
      else
        row_en <= '0';
        row    <= (others => '0');
      end if;
      when BOTTOM_RIGHT =>
      if (unsigned(v_count) >= to_unsigned(BOTTOM_RIGHT_Y_START, COUNT_WIDTH) and unsigned(v_count) <= to_unsigned(BOTTOM_RIGHT_Y_END, COUNT_WIDTH)) then
        row_en <= '1';
        row    <= std_logic_vector(resize((unsigned(v_count) - to_unsigned(BOTTOM_RIGHT_Y_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
      else
        row_en <= '0';
        row    <= (others => '0');
      end if;
      when others =>
      row    <= (others => '0');
      row_en <= '0';
    end case;
  end process;
end architecture;