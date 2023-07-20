library ieee;
use ieee.std_logic_1164.all;
-- DO NOT CHANGE ANYTHING IN THE ENTITY
entity fa is
    port (
        input1    : in  std_logic;
        input2    : in  std_logic;
        carry_in  : in  std_logic;
        sum       : out std_logic;
        carry_out : out std_logic);
end fa;
-- DEFINE THE FULL ADDER HERE
architecture BHV of fa is
begin
    --	process(carry_in, input1, input2)
    --	begin
    --	if (carry_in = '0') then
    --		if (input1 = '0') then
    --			if (input2 = '0') then
    --				sum <= '0';
    --				carry_out <= '0'; --000
    --			else
    --				sum <= '1';
    --				carry_out <= '0'; --001
    --			end if;
    --		else
    --			if (input2 = '0') then
    --				sum <= '1';
    --				carry_out <= '0'; --010
    --			else
    --				sum <= '0';
    --				carry_out <= '1'; --011
    --			end if;
    --		end if;
    --	else
    --		if (input1 = '0') then
    --			if (input2 = '0') then
    --				sum <= '1';
    --				carry_out <= '0'; --100
    --			else
    --				sum <= '0';
    --				carry_out <= '1'; --101
    --			end if;
    --		else
    --			if (input2 = '0') then
    --				sum <= '0';
    --				carry_out <= '1'; --110
    --			else
    --				sum <= '1';
    --				carry_out <= '1'; --111
    --			end if;
    --		end if;
    --	end if;
    --	end process;
    sum       <= (input1 xor input2 xor carry_in);
    carry_out <= ((input1 and input2) or (input1 and carry_in) or (input2 and carry_in));
end BHV;