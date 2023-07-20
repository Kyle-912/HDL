library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library altera_mf;
use altera_mf.altera_mf_components.all;
entity RAM_tb is
end RAM_tb;
architecture TB of RAM_tb is
    signal address : std_logic_vector(31 downto 0);
    signal clock   : std_logic := '0';
    signal clockEn : std_logic := '1';
    signal data    : std_logic_vector(31 downto 0);
    signal wren    : std_logic;
    signal q       : std_logic_vector(31 downto 0);
    component RAM_uninitialized is
        port (
            address : in  std_logic_vector(7 downto 0);
            clock   : in  std_logic;
            data    : in  std_logic_vector(31 downto 0);
            wren    : in  std_logic;
            q       : out std_logic_vector(31 downto 0)
        );
    end component;
begin --TB
    clock <= not clock and clockEn after 20 ns;
    UUT : RAM_uninitialized
    port map
    (
        address => address(9 downto 2),
        clock   => clock,
        data    => data,
        wren    => wren,
        q       => q
    );
    process
    begin
        -- Write 0x0A0A0A0A to byte address 0x00000000
        report "testing write 0x0A0A0A0A to byte address 0x00000000";
        address <= std_logic_vector(to_unsigned(0, address'length));
        data    <= std_logic_vector(to_unsigned(168430090, data'length));
        wren    <= '1';
        wait for 40 ns;
        -- Write 0xF0F0F0F0 to byte address 0x00000004
        report "testing write 0xF0F0F0F0 to byte address 0x00000004";
        address <= std_logic_vector(to_unsigned(4, address'length));
        data    <= std_logic_vector(to_signed(16#F0F0F0F0#, data'length));
        wren    <= '1';
        wait for 40 ns;
        -- Read from byte address 0x00000000
        report "testing read from byte address 0x00000000";
        address <= std_logic_vector(to_unsigned(0, address'length));
        data    <= (others => '0');
        wren    <= '0';
        wait for 40 ns;
        assert(q = std_logic_vector(to_unsigned(168430090, q'length))) report "Error: q value is " & integer'image(to_integer(unsigned(q))) & " instead of 168430090" severity warning;
        -- Read from byte address 0x00000001
        report "testing read from byte address 0x00000001";
        address <= std_logic_vector(to_unsigned(1, address'length));
        data    <= (others => '0');
        wren    <= '0';
        wait for 40 ns;
        assert(q = std_logic_vector(to_unsigned(168430090, q'length))) report "Error: q value is " & integer'image(to_integer(unsigned(q))) & " instead of 168430090" severity warning;
        -- Read from byte address 0x00000004
        report "testing read from byte address 0x00000004";
        address <= std_logic_vector(to_unsigned(4, address'length));
        data    <= (others => '0');
        wren    <= '0';
        wait for 40 ns;
        assert(q = std_logic_vector(to_signed(16#F0F0F0F0#, data'length))) report "Error: q value is " & integer'image(to_integer(unsigned(q))) & " instead of 4042322160" severity warning;
        -- Read from byte address 0x00000005
        report "testing read from byte address 0x00000005";
        address <= std_logic_vector(to_unsigned(5, address'length));
        data    <= (others => '0');
        wren    <= '0';
        wait for 40 ns;
        assert(q = std_logic_vector(to_signed(16#F0F0F0F0#, data'length))) report "Error: q value is " & integer'image(to_integer(unsigned(q))) & " instead of 4042322160" severity warning;
        -- Write 0x00001111 to the outport
        report "testing write 0x00001111 to the outport";
        address <= std_logic_vector(to_unsigned(65532, address'length));
        data    <= std_logic_vector(to_unsigned(4369, data'length));
        wren    <= '1';
        wait for 40 ns;
        -- Load 0x00010000 into inport 0
        report "testing load 0x00010000 into inport 0";
        address <= std_logic_vector(to_unsigned(65528, address'length));
        data    <= std_logic_vector(to_unsigned(65536, data'length));
        wren    <= '1';
        wait for 40 ns;
        -- Load 0x00000001 into inport 1
        report "testing load 0x00000001 into inport 1";
        address <= std_logic_vector(to_unsigned(65532, address'length));
        data    <= std_logic_vector(to_unsigned(1, data'length));
        wren    <= '1';
        wait for 40 ns;
        -- Read from inport 0
        report "testing read from inport 0";
        address <= std_logic_vector(to_unsigned(65528, address'length));
        data    <= (others => '0');
        wren    <= '0';
        wait for 40 ns;
        assert(q = std_logic_vector(to_unsigned(65536, q'length))) report "Error: q value is " & integer'image(to_integer(unsigned(q))) & " instead of 65536" severity warning;
        -- Read from inport 1
        report "testing read from inport 1";
        address <= std_logic_vector(to_unsigned(65532, address'length));
        data    <= (others => '0');
        wren    <= '0';
        wait for 40 ns;
        assert(q = std_logic_vector(to_unsigned(1, q'length))) report "Error: q value is " & integer'image(to_integer(unsigned(q))) & " instead of 1" severity warning;
        clockEn <= '0';
        wait;
    end process;
end TB;