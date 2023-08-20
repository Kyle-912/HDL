library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library altera_mf;
use altera_mf.altera_mf_components.all;
entity memory_tb is
end memory_tb;
architecture TB of memory_tb is
  signal clock       : std_logic := '0';
  signal clockEn     : std_logic := '1';
  signal address     : std_logic_vector(31 downto 0);
  signal data        : std_logic_vector(31 downto 0);
  -- signal mem_read    : std_logic;
  signal mem_write   : std_logic;
  signal switch_data : std_logic_vector(31 downto 0);
  signal port_select : std_logic;
  signal in_port_en  : std_logic;
  signal out_port    : std_logic_vector(31 downto 0);
  signal output      : std_logic_vector(31 downto 0);
  component memory is
    port (
      clock       : in  std_logic;
      address     : in  std_logic_vector(31 downto 0);
      data        : in  std_logic_vector(31 downto 0);
      -- mem_read    : in  std_logic;
      mem_write   : in  std_logic;
      switch_data : in  std_logic_vector(31 downto 0);
      port_select : in  std_logic;
      in_port_en  : in  std_logic;
      out_port    : out std_logic_vector(31 downto 0);
      output      : out std_logic_vector(31 downto 0)
    );
  end component;
begin --TB
  clock <= not clock and clockEn after 40 ns;
  UUT : memory
  port map
  (
    clock       => clock,
    address     => address,
    data        => data,
    -- mem_read => -- mem_read,
    mem_write   => mem_write,
    switch_data => switch_data,
    port_select => port_select,
    in_port_en  => in_port_en,
    out_port    => out_port,
    output      => output
  );
  process
  begin
    -- Write 0x0A0A0A0A to byte address 0x00000000
    report "testing write 0x0A0A0A0A to byte address 0x00000000";
    address     <= std_logic_vector(to_unsigned(0, address'length));
    data        <= std_logic_vector(to_unsigned(168430090, data'length));
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '1';
    -- mem_read    <= '0';
    wait for 40 ns;
    -- Write 0xF0F0F0F0 to byte address 0x00000004
    report "testing write 0xF0F0F0F0 to byte address 0x00000004";
    address     <= std_logic_vector(to_unsigned(4, address'length));
    data        <= std_logic_vector(to_signed(16#F0F0F0F0#, data'length));
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '1';
    -- mem_read    <= '0';
    wait for 40 ns;
    -- Read from byte address 0x00000000
    report "testing read from byte address 0x00000000";
    address     <= std_logic_vector(to_unsigned(0, address'length));
    data        <= (others => '0');
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '0';
    -- mem_read    <= '1';
    wait for 40 ns;
    assert(output = std_logic_vector(to_unsigned(168430090, output'length))) report "Error: output value is " & integer'image(to_integer(unsigned(output))) & " instead of 168430090" severity warning;
    -- Read from byte address 0x00000001
    report "testing read from byte address 0x00000001";
    address     <= std_logic_vector(to_unsigned(1, address'length));
    data        <= (others => '0');
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '0';
    -- mem_read    <= '1';
    wait for 40 ns;
    assert(output = std_logic_vector(to_unsigned(168430090, output'length))) report "Error: output value is " & integer'image(to_integer(unsigned(output))) & " instead of 168430090" severity warning;
    -- Read from byte address 0x00000004
    report "testing read from byte address 0x00000004";
    address     <= std_logic_vector(to_unsigned(4, address'length));
    data        <= (others => '0');
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '0';
    -- mem_read    <= '1';
    wait for 40 ns;
    assert(output = std_logic_vector(to_signed(16#F0F0F0F0#, data'length))) report "Error: output value is " & integer'image(to_integer(unsigned(output))) & " instead of 4042322160" severity warning;
    -- Read from byte address 0x00000005
    report "testing read from byte address 0x00000005";
    address     <= std_logic_vector(to_unsigned(5, address'length));
    data        <= (others => '0');
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '0';
    -- mem_read    <= '1';
    wait for 40 ns;
    assert(output = std_logic_vector(to_signed(16#F0F0F0F0#, data'length))) report "Error: output value is " & integer'image(to_integer(unsigned(output))) & " instead of 4042322160" severity warning;
    -- Write 0x00001111 to the outport
    report "testing write 0x00001111 to the outport";
    address     <= std_logic_vector(to_unsigned(65532, address'length));
    data        <= std_logic_vector(to_unsigned(4369, data'length));
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '1';
    -- mem_read    <= '0';
    wait for 40 ns;
    assert(out_port = std_logic_vector(to_unsigned(4369, data'length))) report "Error: out port value is " & integer'image(to_integer(unsigned(out_port))) & " instead of 4369" severity warning;
    -- Load 0x00010000 into inport 0
    report "testing load 0x00010000 into inport 0";
    address     <= std_logic_vector(to_unsigned(65528, address'length));
    data        <= (others => '0'); --std_logic_vector(to_unsigned(65536, data'length));
    switch_data <= std_logic_vector(to_unsigned(65536, data'length));
    port_select <= '0';
    in_port_en  <= '1';
    mem_write   <= '0';
    -- mem_read    <= '0';
    wait for 40 ns;
    -- Load 0x00000001 into inport 1
    report "testing load 0x00000001 into inport 1";
    address     <= std_logic_vector(to_unsigned(65532, address'length));
    data        <= (others => '0'); --std_logic_vector(to_unsigned(1, data'length));
    switch_data <= std_logic_vector(to_unsigned(1, data'length));
    port_select <= '1';
    in_port_en  <= '1';
    mem_write   <= '0';
    -- mem_read    <= '0';
    wait for 40 ns;
    -- Read from inport 0
    report "testing read from inport 0";
    address     <= std_logic_vector(to_unsigned(65528, address'length));
    data        <= (others => '0');
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '0';
    -- mem_read    <= '1';
    wait for 40 ns;
    assert(output = std_logic_vector(to_unsigned(65536, output'length))) report "Error: output value is " & integer'image(to_integer(unsigned(output))) & " instead of 65536" severity warning;
    -- Read from inport 1
    report "testing read from inport 1";
    address     <= std_logic_vector(to_unsigned(65532, address'length));
    data        <= (others => '0');
    switch_data <= (others => '0');
    port_select <= '0';
    in_port_en  <= '0';
    mem_write   <= '0';
    -- mem_read    <= '1';
    wait for 40 ns;
    assert(output = std_logic_vector(to_unsigned(1, output'length))) report "Error: output value is " & integer'image(to_integer(unsigned(output))) & " instead of 1" severity warning;
    clockEn <= '0';
    wait;
  end process;
end TB;