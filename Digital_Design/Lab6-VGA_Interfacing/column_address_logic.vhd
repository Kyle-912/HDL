library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_lib.all;

entity column_address_logic is
    port (
        h_count   : in  std_logic_vector(COUNT_RANGE);
        img_pos   : in  std_logic_vector(2 downto 0);
        column    : out std_logic_vector(ROM_ADDR_BOTTOM_HALF_RANGE);
        column_en : out std_logic
    );
end column_address_logic;

architecture column_address_logic_BHV of column_address_logic is
begin
    process(h_count)
    begin
        case(img_pos) is
            when CENTERED =>
                if (unsigned(h_count) >= to_unsigned(CENTERED_X_START, COUNT_WIDTH) AND unsigned(h_count) <= to_unsigned(CENTERED_X_END, COUNT_WIDTH)) then
                    column_en <= '1';
                    column    <= std_logic_vector(resize((unsigned(h_count) - to_unsigned(CENTERED_X_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
                else
                    column_en <= '0';
                    column    <= (others => '0');
                end if;
            when TOP_LEFT =>
                if (unsigned(h_count) >= to_unsigned(TOP_LEFT_X_START, COUNT_WIDTH) AND unsigned(h_count) <= to_unsigned(TOP_LEFT_X_END, COUNT_WIDTH)) then
                    column_en <= '1';
                    column    <= std_logic_vector(resize(unsigned(h_count) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
                else
                    column_en <= '0';
                    column    <= (others => '0');
                end if;
            when TOP_RIGHT =>
                if (unsigned(h_count) >= to_unsigned(TOP_RIGHT_X_START, COUNT_WIDTH) AND unsigned(h_count) <= to_unsigned(TOP_RIGHT_X_END, COUNT_WIDTH)) then
                    column_en <= '1';
                    column    <= std_logic_vector(resize((unsigned(h_count) - to_unsigned(TOP_RIGHT_X_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
                else
                    column_en <= '0';
                    column    <= (others => '0');
                end if;
            when BOTTOM_LEFT =>
                if (unsigned(h_count) >= to_unsigned(BOTTOM_LEFT_X_START, COUNT_WIDTH) AND unsigned(h_count) <= to_unsigned(BOTTOM_LEFT_X_END, COUNT_WIDTH)) then
                    column_en <= '1';
                    column    <= std_logic_vector(resize((unsigned(h_count) - to_unsigned(BOTTOM_LEFT_X_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
                else
                    column_en <= '0';
                    column    <= (others => '0');
                end if;
            when BOTTOM_RIGHT =>
                if (unsigned(h_count) >= to_unsigned(BOTTOM_RIGHT_X_START, COUNT_WIDTH) AND unsigned(h_count) <= to_unsigned(BOTTOM_RIGHT_X_END, COUNT_WIDTH)) then
                    column_en <= '1';
                    column    <= std_logic_vector(resize((unsigned(h_count) - to_unsigned(BOTTOM_RIGHT_X_START, COUNT_WIDTH)) / to_unsigned(RESOLUTION, COUNT_WIDTH), ROM_ADDR_WIDTH/2));
                else
                    column_en <= '0';
                    column    <= (others => '0');
                end if;
            when others =>
                column    <= (others => '0');
                column_en <= '0';
        end case;
    end process;
end architecture;