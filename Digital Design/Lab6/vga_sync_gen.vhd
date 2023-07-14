library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_lib.all;

entity vga_sync_gen is
    port (clk                      : in  std_logic;
          rst                      : in  std_logic;
          h_count, v_count         : out std_logic_vector(COUNT_RANGE);
          h_sync, v_sync, video_on : out std_logic);
end vga_sync_gen;

architecture BHV of vga_sync_gen is
    signal h_count_r, v_count_r           : std_logic_vector(COUNT_RANGE);
    signal h_sync_r, v_sync_r, video_on_r : std_logic;
begin
    process(clk, rst)
    begin
        if (rst = '1') then
            h_count_r  <= (others => '0');
            v_count_r  <= (others => '0');
            h_sync_r   <= '1';
            v_sync_r   <= '1';
            video_on_r <= '0';
        elsif (rising_edge(clk)) then
            if (unsigned(h_count_r) /= to_unsigned(H_MAX, COUNT_WIDTH)) then --h inc
                h_count_r <= std_logic_vector(unsigned(h_count_r) + to_unsigned(1, COUNT_WIDTH)); 
            else
                h_count_r <= (others => '0');
            end if;

            if (unsigned(h_count_r) = to_unsigned(H_VERT_INC, COUNT_WIDTH)) then --v inc
                if (unsigned(v_count_r) /= to_unsigned(V_MAX, COUNT_WIDTH)) then
                    v_count_r <= std_logic_vector(unsigned(v_count_r) + to_unsigned(1, COUNT_WIDTH)); 
                else
                    v_count_r <= (others => '0');
                end if;
            end if;

            if (unsigned(h_count_r) = to_unsigned(HSYNC_BEGIN, COUNT_WIDTH)) then -- h sync
                h_sync_r <= '0';
            elsif (unsigned(h_count_r) = to_unsigned(HSYNC_END, COUNT_WIDTH)) then
                h_sync_r <= '1';
            end if;

            if (unsigned(v_count_r) = to_unsigned(VSYNC_BEGIN, COUNT_WIDTH)) then -- v sync
                v_sync_r <= '0';
            elsif (unsigned(v_count_r) = to_unsigned(VSYNC_END, COUNT_WIDTH)) then
                v_sync_r <= '1';
            end if;

            if (unsigned(h_count_r) <= to_unsigned(H_DISPLAY_END, COUNT_WIDTH) AND unsigned(v_count_r) <= to_unsigned(V_DISPLAY_END, COUNT_WIDTH)) then -- video on
                video_on_r <= '1';
            else
                video_on_r <= '0';
            end if;
        end if;
    end process;
    h_count  <= h_count_r;
    v_count  <= v_count_r;
    h_sync   <= h_sync_r;
    v_sync   <= v_sync_r;
    video_on <= video_on_r;
end BHV;
