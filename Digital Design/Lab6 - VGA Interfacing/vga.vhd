library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.vga_lib.all;

entity vga is
    port (clk              : in  std_logic;
          rst              : in  std_logic;
          img_pos          : in  std_logic_vector(2 downto 0);
          red, green, blue : out std_logic_vector(3 downto 0);
          h_sync, v_sync   : out std_logic;
          video_on         : out std_logic);
end vga;

architecture default_arch of vga is
    signal h_count, v_count             : std_logic_vector(COUNT_RANGE);
    signal address                      : std_logic_vector(ROM_ADDR_RANGE);
    signal q, colors                    : std_logic_vector(11 downto 0);
    signal column_en, row_en, video_en  : std_logic;
begin  -- STR
    U_VGA_SYNC_GEN : entity work.vga_sync_gen
    port map(
        clk      => clk,
        rst      => rst,
        h_count  => h_count,
        v_count  => v_count,
        h_sync   => h_sync,
        v_sync   => v_sync,
        video_on => video_en
    );

    U_COLUMN : entity work.column_address_logic
    port map(
        h_count   => h_count,
        img_pos   => img_pos,
        column    => address(ROM_ADDR_BOTTOM_HALF_RANGE),
        column_en => column_en
    );

    U_ROW : entity work.row_address_logic
    port map(
        v_count   => v_count,
        img_pos   => img_pos,
        row    => address(ROM_ADDR_TOP_HALF_RANGE),
        row_en => row_en
    );

    U_ROM_1 : if (ROM_SELECT = 1) generate
        U_ROM : entity work.vga_rom
        port map(
            address => address,
            clock   => clk,
            q       => q
        );
    end generate;

    U_ROM_2 : if (ROM_SELECT = 2) generate
        U_ROM : entity work.vga_rom2
        port map(
            address => address,
            clock   => clk,
            q       => q
        );
    end generate;

    U_ROM_3 : if (ROM_SELECT = 3) generate
        U_ROM : entity work.vga_rom3
        port map(
            address => address,
            clock   => clk,
            q       => q
        );
    end generate;

    U_2x1 : entity work.vga_mux2x1
    port map(
        in1    => q,
        in2    => (others => '0'),
        sel1   => video_en,
        sel2   => column_en,
        sel3   => row_en,
        output => colors
    );

    video_on <= video_en;

    red   <= colors(11 downto 8);
    green <= colors(7 downto 4);
    blue  <= colors(3 downto 0);

end default_arch;
