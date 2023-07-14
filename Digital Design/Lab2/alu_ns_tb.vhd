library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_ns_tb is
end alu_ns_tb;

architecture TB of alu_ns_tb is

    constant WIDTH  : positive                           := 16;
    signal input1   : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal input2   : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal sel      : std_logic_vector(3 downto 0)       := (others => '0');
    signal output   : std_logic_vector(WIDTH-1 downto 0);
    signal overflow : std_logic;
	 
	 component alu_ns is 
	generic
	(
		WIDTH : positive := 16 
	);
	port
	(
		input1 : in std_logic_vector(WIDTH-1 downto 0);
		input2 : in std_logic_vector(WIDTH-1 downto 0);
		sel : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(WIDTH-1 downto 0);
		overflow : out std_logic
	); 
end component;

begin  -- TB

    UUT : alu_ns
        generic map (WIDTH => WIDTH)
        port map (
            input1   => input1,
            input2   => input2,
            sel      => sel,
            output   => output,
            overflow => overflow);

    process
    begin

        -- test 2+6 (no overflow)
        sel    <= "0000";
        input1 <= std_logic_vector(to_unsigned(2, input1'length));
        input2 <= std_logic_vector(to_unsigned(6, input2'length));
        wait for 40 ns;
        assert(output = std_logic_vector(to_unsigned(8, output'length))) report "Error : 2+6 = " & integer'image(to_integer(unsigned(output))) & " instead of 8" severity warning;
        assert(overflow = '0') report "Error                                   : overflow incorrect for 2+8" severity warning;

        -- test 250+50 (with overflow)
        sel    <= "0000";
        input1 <= std_logic_vector(to_unsigned(250, input1'length));
        input2 <= std_logic_vector(to_unsigned(50, input2'length));
        wait for 40 ns;
		-- Truncated output for 300 is 44.
		-- You can put 300 in the to_unsigned call, but you will receive a simulation warning about a truncated value.
        assert(output = std_logic_vector(to_unsigned(44, output'length))) report "Error : 250+50 = " & integer'image(to_integer(unsigned(output))) & " instead of 44" severity warning;
        assert(overflow = '1') report "Error                                     : overflow incorrect for 250+50" severity warning;

        -- test 5*6
        sel    <= "0010";
        input1 <= std_logic_vector(to_unsigned(5, input1'length));
        input2 <= std_logic_vector(to_unsigned(6, input2'length));
        wait for 40 ns;
        assert(output = std_logic_vector(to_unsigned(30, output'length))) report "Error : 5*6 = " & integer'image(to_integer(unsigned(output))) & " instead of 30" severity warning;
        assert(overflow = '0') report "Error                                    : overflow incorrect for 5*6" severity warning;

        -- test 64*64
        sel    <= "0010";
        input1 <= std_logic_vector(to_unsigned(64, input1'length));
        input2 <= std_logic_vector(to_unsigned(64, input2'length));
        wait for 40 ns;
		-- Truncated output for 4096 is 0.
		-- You can put 4096 in the to_unsigned call, but you will receive a simulation warning about a truncated value.
        assert(output = std_logic_vector(to_unsigned(0, output'length))) report "Error : 64*64 = " & integer'image(to_integer(unsigned(output))) & " instead of 0" severity warning;
        assert(overflow = '1') report "Error                                      : overflow incorrect for 64*64" severity warning;

        -- test 60-50
		  sel <= "0001";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(10, output'length))) report "Error on subtraction" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test and
		  sel <= "0011";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(48, output'length))) report "Error on and" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test or
		  sel <= "0100";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(62, output'length))) report "Error on or" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test xor
		  sel <= "0101";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(14, output'length))) report "Error on xor" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test nor
		  sel <= "0110";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(1, output'length))) report "Error on nor" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test not
		  sel <= "0111";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(3, output'length))) report "Error on not" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test left shift
		  sel <= "1000";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(120, output'length))) report "Error on left shift" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test right shift
		  sel <= "1001";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(30, output'length))) report "Error on right shift" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test swap
		  sel <= "1010";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(195, output'length))) report "Error on swap" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test reverse
		  sel <= "1011";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(60, output'length))) report "Error on reverse" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test extra 1
		  sel <= "1100";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(0, output'length))) report "Error on extra 1" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test extra 2
		  sel <= "1101";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(0, output'length))) report "Error on extra 2" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test extra 3
		  sel <= "1110";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(0, output'length))) report "Error on extra 3" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
		  -- test extra 4
		  sel <= "1111";
		  input1 <= std_logic_vector(to_unsigned(60, input1'length));
		  input2 <= std_logic_vector(to_unsigned(50, input2'length));
		  wait for 40 ns;
		  assert(output = std_logic_vector(to_unsigned(0, output'length))) report "Error on extra 4" severity warning;
		  assert(overflow = '0') report "Error on  overflow" severity warning;
		  
        wait;

    end process;



end TB;