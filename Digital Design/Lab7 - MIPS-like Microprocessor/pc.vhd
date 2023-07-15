library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
    port
    (
        clk          : in  std_logic;
        rst          : in  std_logic;
        input        : in  std_logic_vector(31 downto 0);
        PCWrite      : in  std_logic;
        PCWriteCond  : in  std_logic;
        branch_taken : in  std_logic;
        PC           : out std_logic_vector(31 downto 0)
    );
end pc;

architecture BHV of pc is
    signal PC_r : std_logic_vector(31 downto 0) := (others => '0');
begin
    PC <= PC_r;
    process(clk, rst)
    begin
        if (rst = '1') then
            PC_r <= (others => '0');
        elsif (rising_edge(clk)) then
            if (PCWrite = '1' OR (PCWriteCond = '1' AND branch_taken = '1')) then
                PC_r <= input;
            end if;
        end if;
    end process;
end architecture;