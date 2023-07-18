library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity select_logic is
    port (
        MemWrite      : in  std_logic;
        address       : in  std_logic_vector(31 downto 0);
        out_port_en   : out std_logic;
        RAM_wr_en     : out std_logic;
        output_select : out std_logic_vector(1 downto 0)
    );
end select_logic;
architecture BHV of select_logic is
begin
    process (MemWrite, address)
    begin
        if (MemWrite = '1') then
            if (address = std_logic_vector(to_unsigned(65532, address'length))) then -- address=outport
                out_port_en   <= '1';
                RAM_wr_en     <= '0';
                output_select <= "00";
            else
                out_port_en   <= '0';
                RAM_wr_en     <= '1';
                output_select <= "00";
            end if;
        else
            out_port_en <= '0';
            RAM_wr_en   <= '0';
            if (address = std_logic_vector(to_unsigned(65528, address'length))) then -- address=inport0
                out_port_en   <= '0';
                RAM_wr_en     <= '0';
                output_select <= "00";
            elsif (address = std_logic_vector(to_unsigned(65532, address'length))) then -- address=inport1
                out_port_en   <= '0';
                RAM_wr_en     <= '0';
                output_select <= "01";
            else
                out_port_en   <= '0';
                RAM_wr_en     <= '0';
                output_select <= "10";
            end if;
        end if;
    end process;
end architecture;