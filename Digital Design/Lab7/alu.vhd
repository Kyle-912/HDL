library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is 
	port
	(
		input1       : in  std_logic_vector(31 downto 0);
		input2       : in  std_logic_vector(31 downto 0);
		OPSelect     : in  std_logic_vector(4 downto 0);
        shift_amount : in  std_logic_vector(4 downto 0);
		result       : out std_logic_vector(31 downto 0);
        result_hi    : out std_logic_vector(31 downto 0);
		branch_taken : out std_logic
	); 
end alu;

architecture BHV of alu is
begin
    process(input1, input2, OPSelect, shift_amount)
        variable temp_mult_s : signed(2*32-1 downto 0);
        variable temp_mult_u : unsigned(2*32-1 downto 0);
        variable temp_shift  : std_logic_vector(31 downto 0);
        variable sign_bit    : std_logic;
    begin
        result       <= (others => '0');
        result_hi    <= (others => '0');
        branch_taken <= '0';
        case(OPSelect) is
            when "00000" => --addu
                result <= std_logic_vector(unsigned(input1) + unsigned(input2));
            when "00001" => --subu
                result <= std_logic_vector(unsigned(input1) - unsigned(input2));
            when "00010" => --mult
                temp_mult_s := signed(input1) * signed(input2);
                result      <= std_logic_vector(temp_mult_s(31 downto 0));
                result_hi   <= std_logic_vector(temp_mult_s(32*2-1 downto 32));
            when "00011" => --multu
                temp_mult_u := unsigned(input1) * unsigned(input2);
                result      <= std_logic_vector(temp_mult_u(31 downto 0));
                result_hi   <= std_logic_vector(temp_mult_u(32*2-1 downto 32));
            when "00100" => --and
                result <= input1 and input2;
            when "00101" => --or
                result <= input1 or input2;
            when "00110" => --xor
                result <= input1 xor input2;
            when "00111" => --srl
                result <= std_logic_vector(shift_right(unsigned(input2), to_integer(unsigned(shift_amount))));
            when "01000" => --sll
                result <= std_logic_vector(shift_left(unsigned(input2), to_integer(unsigned(shift_amount))));
            when "01001" => --sra
                sign_bit := input2(31);
                temp_shift := std_logic_vector(shift_right(unsigned(input2), to_integer(unsigned(shift_amount))));
                temp_shift(31 downto 32-to_integer(unsigned(shift_amount))) := (others => sign_bit);
                result <= temp_shift;
            when "01010" => --slt
                if (signed(input1) < signed(input2)) then
                    result <= std_logic_vector(to_unsigned(1, 32));
                else
                    result <= (others => '0');
                end if;
            when "01011" => --sltu
                if (unsigned(input1) < unsigned(input2)) then
                    result <= std_logic_vector(to_unsigned(1, 32));
                else
                    result <= (others => '0');
                end if;
            when "01100" => --mfhi
                result <= (others => '0');
            when "01101" => --mflo
                result <= (others => '0');
            when "01110" => --lw
                result <= (others => '0');
            when "01111" => --sw
                result <= (others => '0');
            when "10000" => --beq
                if (unsigned(input1) = unsigned(input2)) then
                    branch_taken <= '1';
                end if;
            when "10001" => --bne
                if (unsigned(input1) /= unsigned(input2)) then
                    branch_taken <= '1';
                end if;
            when "10010" => --blez
                if (signed(input1) <= to_signed(0, input1'length)) then
                    branch_taken <= '1';
                end if;
                result <= (others => '0');
            when "10011" => --bgtz
                if (signed(input1) > to_signed(0, input1'length)) then
                    branch_taken <= '1';
                end if;
                result <= (others => '0');
            when "10100" => --bltz
                if (signed(input1) < to_signed(0, input1'length)) then
                    branch_taken <= '1';
                end if;
                result <= (others => '0');
            when "10101" => --bgez
                if (signed(input1) >= to_signed(0, input1'length)) then
                    branch_taken <= '1';
                end if;
                result <= (others => '0');
            when "11000" => --jr
                result <= input1;
            when others =>
                result <= (others => '0');
        end case;
    end process;
end BHV;