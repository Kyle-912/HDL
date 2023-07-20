library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity alu_sla is
    generic (
        WIDTH : positive := 16
    );
    port (
        input1   : in  std_logic_vector(WIDTH - 1 downto 0);
        input2   : in  std_logic_vector(WIDTH - 1 downto 0);
        sel      : in  std_logic_vector(3 downto 0);
        output   : out std_logic_vector(WIDTH - 1 downto 0);
        overflow : out std_logic
    );
end alu_sla;
architecture BHV of alu_sla is
begin
    process (input1, input2, sel)
        variable temp_add     : unsigned(WIDTH downto 0);
        variable temp_mult    : unsigned(2 * WIDTH - 1 downto 0);
        variable mult_ovf     : unsigned(2 * WIDTH - 1 downto 0);
        variable temp_reverse : unsigned(WIDTH - 1 downto 0);
        variable temp_swap    : unsigned(WIDTH - 1 downto 0) := conv_unsigned('0', WIDTH);
    begin
        overflow <= '0';
        case(sel) is
            when "0000" =>
            temp_add := conv_unsigned(unsigned(input1), WIDTH + 1) + unsigned(input2);
            output   <= std_logic_vector(temp_add(WIDTH - 1 downto 0));
            overflow <= temp_add(WIDTH);
            when "0001" =>
            output <= input1 - input2;
            when "0010" =>
            temp_mult := unsigned(input1) * unsigned(input2);
            output <= std_logic_vector(temp_mult(WIDTH - 1 downto 0));
            mult_ovf := unsigned(temp_mult) - temp_mult(WIDTH - 1 downto 0);
            if (mult_ovf > 0) then
                overflow <= '1';
            end if;
            when "0011" =>
            output <= input1 and input2;
            when "0100" =>
            output <= input1 or input2;
            when "0101" =>
            output <= input1 xor input2;
            when "0110" =>
            output <= input1 nor input2;
            when "0111" =>
            output <= not(input1);
            when "1000" =>
            overflow <= input1(WIDTH - 1);
            output   <= std_logic_vector(shl(unsigned(input1), "01"));
            when "1001" =>
            output <= std_logic_vector(shr(unsigned(input1), "01"));
            when "1010" =>
            temp_swap := conv_unsigned(unsigned(input1(WIDTH - 1 downto WIDTH/2)), WIDTH);
            temp_swap := shl(temp_swap, conv_unsigned(WIDTH/2, WIDTH));
            temp_swap := unsigned(std_logic_vector(temp_swap) or input1((WIDTH/2) - 1 downto 0));
            output <= std_logic_vector(temp_swap);
            when "1011" =>
            for i in 0 to WIDTH - 1 loop
                temp_reverse(i) := input1(WIDTH - 1 - i);
            end loop;
            output <= std_logic_vector(temp_reverse);
            when others       =>
            output <= (others => '0');
        end case;
    end process;
end BHV;