library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity alu_ns is
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
end alu_ns;
architecture BHV of alu_ns is
begin
    process (input1, input2, sel)
        variable temp_add     : unsigned(WIDTH downto 0);
        variable temp_mult    : unsigned(2 * WIDTH - 1 downto 0);
        variable mult_ovf     : unsigned(2 * WIDTH - 1 downto 0);
        variable temp_reverse : unsigned(WIDTH - 1 downto 0);
        variable temp_swap    : unsigned(WIDTH - 1 downto 0);
    begin
        overflow <= '0';
        case(sel) is
            when "0000" =>
            temp_add := resize(unsigned(input1), WIDTH + 1) + unsigned(input2);
            output   <= std_logic_vector(temp_add(WIDTH - 1 downto 0));
            overflow <= temp_add(WIDTH);
            when "0001" =>
            output <= std_logic_vector(unsigned(input1) - unsigned(input2));
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
            output   <= std_logic_vector(shift_left(unsigned(input1), 1));
            when "1001" =>
            output <= std_logic_vector(shift_right(unsigned(input1), 1));
            when "1010" =>
            temp_swap := resize(unsigned(input1(WIDTH - 1 downto WIDTH/2)), WIDTH);
            temp_swap := shift_left(temp_swap, WIDTH/2);
            temp_swap := unsigned(std_logic_vector(temp_swap) or input1((WIDTH/2) - 1 downto 0));
            output <= std_logic_vector(temp_swap);
            when "1011" =>
            for i in 0 to WIDTH - 1 loop
                temp_reverse(i) := input1(WIDTH - 1 - i);
            end loop;
            output <= std_logic_vector(temp_reverse);
            when "1100"       =>
            output <= (others => '0');
            when "1101"       =>
            output <= (others => '0');
            when "1110"       =>
            output <= (others => '0');
            when "1111"       =>
            output <= (others => '0');
            when others       =>
        end case;
    end process;
end BHV;
--std_logic_vector(resize(to_unsigned('0'), WIDTH));