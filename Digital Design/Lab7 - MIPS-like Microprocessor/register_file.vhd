library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
    port(
        clk         : in  std_logic;
        rst         : in  std_logic;
        read_reg_1  : in  std_logic_vector(4 downto 0);
        read_reg_2  : in  std_logic_vector(4 downto 0);
        write_reg   : in  std_logic_vector(4 downto 0);
        RegWrite    : in  std_logic;
        JumpAndLink : in  std_logic;
        write_data  : in  std_logic_vector(31 downto 0);
        read_data1  : out std_logic_vector(31 downto 0);
        read_data2  : out std_logic_vector(31 downto 0)
        );
end register_file;

architecture sync_read_during_write of register_file is
    type reg_array is array(0 to 31) of std_logic_vector(31 downto 0);
    signal regs : reg_array;
    signal read_reg_1_r : std_logic_vector(4 downto 0);
    signal read_reg_2_r : std_logic_vector(4 downto 0);
begin
    process (clk, rst) is
    begin
        if (rst = '1') then
            for i in regs'range loop
                regs(i) <= (others => '0');
            end loop;
        elsif (rising_edge(clk)) then
            regs(0) <= (others => '0');
            if (RegWrite = '1') then
                if (write_reg /= "00000") then
                    regs(to_integer(unsigned(write_reg))) <= write_data;
                end if;
            elsif (JumpAndLink = '1') then
                regs(31) <= write_data;
            end if;
            read_reg_1_r <= read_reg_1;
            read_reg_2_r <= read_reg_2;
        end if;
    end process;

    read_data1 <= regs(to_integer(unsigned(read_reg_1_r)));
    read_data2 <= regs(to_integer(unsigned(read_reg_2_r)));
    
end sync_read_during_write;