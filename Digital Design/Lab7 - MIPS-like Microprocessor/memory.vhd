library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library altera_mf;
use altera_mf.altera_mf_components.all;
entity memory is
    port (
        clock       : in  std_logic;
        address     : in  std_logic_vector(31 downto 0);
        data        : in  std_logic_vector(31 downto 0);
        mem_write   : in  std_logic;
        switch_data : in  std_logic_vector(31 downto 0);
        port_select : in  std_logic;
        in_port_en  : in  std_logic;
        out_port    : out std_logic_vector(31 downto 0);
        output      : out std_logic_vector(31 downto 0)
    );
end memory;
architecture BHV of memory is
    signal from_memory     : std_logic_vector(31 downto 0);
    signal in_port0_r      : std_logic_vector(31 downto 0);
    signal in_port0_en     : std_logic;
    signal in_port1_r      : std_logic_vector(31 downto 0);
    signal in_port1_en     : std_logic;
    signal out_port_en     : std_logic;
    signal output_select   : std_logic_vector(1 downto 0);
    signal output_select_r : std_logic_vector(1 downto 0);
    signal RAM_wr_en       : std_logic;
begin
    RAM : entity work.RAM_TestCase7_fixed
        port map
        (
            address => address(9 downto 2),
            clock   => clock,
            data    => data,
            wren    => RAM_wr_en,
            q       => from_memory
        );
    INPORT0_R : entity work.register_32bit_en
        port map
        (
            clk    => clock,
            en     => in_port0_en,
            input  => switch_data,
            output => in_port0_r
        );
    INPORT1_R : entity work.register_32bit_en
        port map
        (
            clk    => clock,
            en     => in_port1_en,
            input  => switch_data,
            output => in_port1_r
        );
    OUTPORT_R : entity work.register_32bit_en
        port map
        (
            clk    => clock,
            en     => out_port_en,
            input  => data,
            output => out_port
        );
    MUX3X1 : entity work.MUX3X1
        port map
        (
            input0 => in_port0_r,
            input1 => in_port1_r,
            input2 => from_memory,
            sel    => output_select_r,
            output => output
        );
    SELECT_LOGIC : entity work.select_logic
        port map
        (
            MemWrite      => mem_write,
            address       => address,
            out_port_en   => out_port_en,
            RAM_wr_en     => RAM_wr_en,
            output_select => output_select
        );
    process (clock)
    begin
        if (rising_edge(clock)) then
            output_select_r <= output_select;
        end if;
    end process;
    process (clock)
    begin
        if (rising_edge(clock)) then
            if (in_port_en = '1') then
                if (port_select = '0') then
                    in_port0_en <= '1';
                elsif (port_select = '1') then
                    in_port1_en <= '1';
                end if;
            else
                in_port0_en <= '0';
                in_port1_en <= '0';
            end if;
        end if;
    end process;
end architecture;