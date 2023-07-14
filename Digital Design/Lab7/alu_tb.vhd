library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture TB of alu_tb is

    constant WIDTH       : positive                           := 32;
    signal input1        : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal input2        : std_logic_vector(WIDTH-1 downto 0) := (others => '0');
    signal OPSelect      : std_logic_vector(4 downto 0)       := (others => '0');
    signal IR10_6        : std_logic_vector(4 downto 0)       := (others => '0');
    signal result        : std_logic_vector(WIDTH-1 downto 0);
    signal result_hi     : std_logic_vector(WIDTH-1 downto 0);
    signal branch_taken  : std_logic;
	 
	component alu is 
	    generic
	    (
	    	WIDTH : positive := 32 
	    );
	    port
	    (
	    	input1       : in  std_logic_vector(WIDTH-1 downto 0);
	    	input2       : in  std_logic_vector(WIDTH-1 downto 0);
	    	OPSelect     : in  std_logic_vector(4 downto 0);
            IR10_6       : in  std_logic_vector(4 downto 0);
	    	result       : out std_logic_vector(WIDTH-1 downto 0);
	    	result_hi    : out std_logic_vector(WIDTH-1 downto 0);
	    	branch_taken : out std_logic
	    ); 
    end component;

begin  -- TB

    UUT : alu
        generic map (WIDTH => WIDTH)
        port map 
        (
            input1   => input1,
            input2   => input2,
            OPSelect => OPSelect,
            IR10_6   => IR10_6,
            result   => result,
            result_hi => result_hi,
            branch_taken => branch_taken
        );

    process
    begin
        -- test 10 + 15
        OPSelect <= "00000";
        input1 <= std_logic_vector(to_unsigned(10, input1'length));
        input2 <= std_logic_vector(to_unsigned(15, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 10 + 15";
        assert(result = std_logic_vector(to_unsigned(25, result'length))) report "Error: 10 + 15 = " & integer'image(to_integer(unsigned(result))) & " instead of 25" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for 10 + 15" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for 10 + 15" severity warning;

        -- test 25 - 10
        OPSelect <= "00010";
        input1 <= std_logic_vector(to_unsigned(25, input1'length));
        input2 <= std_logic_vector(to_unsigned(10, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 25 - 10";
        assert(result = std_logic_vector(to_unsigned(15, result'length))) report "Error: 25 - 10 = " & integer'image(to_integer(unsigned(result))) & " instead of 15" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for 25 - 10" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for 25 - 10" severity warning;

        -- test 10 * -4
        OPSelect <= "00100";
        input1 <= std_logic_vector(to_unsigned(10, input1'length));
        input2 <= std_logic_vector(to_signed(-4, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 10 * -4";
        assert(result = std_logic_vector(to_signed(-40, result'length))) report "Error: Result value for 10 * -4 = " & integer'image(to_integer(signed(result))) & " instead of -40" severity warning;
        assert(result_hi = std_logic_vector(to_signed(-1, result_hi'length))) report "Error: Result High value for 10 * -4 = " & integer'image(to_integer(signed(result_hi))) & " instead of -1" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for 10 * -4" severity warning;

        -- test 65536 * 131072
        OPSelect <= "00101";
        input1 <= std_logic_vector(to_unsigned(65536, input1'length));
        input2 <= std_logic_vector(to_unsigned(131072, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 65536 * 131072";
        assert(result = std_logic_vector(to_unsigned(0, result'length))) report "Error: Result value for 65536 * 131072 = " & integer'image(to_integer(unsigned(result))) & " instead of 0" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(2, result_hi'length))) report "Error: Result High value for 65536 * 131072 = " & integer'image(to_integer(unsigned(result_hi))) & " instead of 2" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for 65536 * 131072" severity warning;

        -- test 0x0000FFFF and 0xFFFF1234
        OPSelect <= "00110";
        input1 <= std_logic_vector(to_unsigned(65535, input1'length));
        input2 <= std_logic_vector(to_signed(-60876, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 0x0000FFFF and 0xFFFF1234";
        assert(result = std_logic_vector(to_signed(4660, result'length))) report "Error: 0x0000FFFF and 0xFFFF1234 = " & integer'image(to_integer(unsigned(result))) & " instead of 4660" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for 0x0000FFFF and 0xFFFF1234" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for 0x0000FFFF and 0xFFFF1234" severity warning;

        -- test shift right logical of 0x0000000F by 4
        OPSelect <= "01100";
        input1 <= std_logic_vector(to_unsigned(0, input1'length));
        input2 <= std_logic_vector(to_signed(15, input2'length));
        IR10_6 <= "00100";
        wait for 40 ns;
        report "testing shift right logical of 0x0000000F by 4";
        assert(result = std_logic_vector(to_unsigned(0, result'length))) report "Error: shift right logical of 0x0000000F by 4 = " & integer'image(to_integer(unsigned(result))) & " instead of 0" severity warning;
        assert(result_hi = std_logic_vector(to_signed(0, result_hi'length))) report "Error: Result High value is non-zero for shift right logical of 0x0000000F by 4" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for shift right logical of 0x0000000F by 4" severity warning;

        -- test shift right arithmetic of 0xF0000008 by 1
        OPSelect <= "01110";
        input1 <= std_logic_vector(to_unsigned(0, input1'length));
        input2 <= std_logic_vector(to_signed(-268435448, input2'length));
        IR10_6 <= "00001";
        wait for 40 ns;
        report "testing shift right arithmetic of 0xF0000008 by 1";
        assert(result = std_logic_vector(to_signed(-134217724, result'length))) report "Error: shift right arithmetic of 0xF0000008 by 1 = " & integer'image(to_integer(signed(result))) & " instead of -134217724" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for shift right arithmetic of 0xF0000008 by 1" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for shift right arithmetic of 0xF0000008 by 1" severity warning;

        -- test shift right arithmetic of 0x00000008 by 1
        OPSelect <= "01110";
        input1 <= std_logic_vector(to_unsigned(0, input1'length));
        input2 <= std_logic_vector(to_unsigned(8, input2'length));
        IR10_6 <= "00001";
        wait for 40 ns;
        report "testing shift right arithmetic of 0x00000008 by 1";
        assert(result = std_logic_vector(to_signed(4, result'length))) report "Error: shift right arithmetic of 0x00000008 by 1 = " & integer'image(to_integer(signed(result))) & " instead of 4" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for shift right arithmetic of 0x00000008 by 1" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for shift right arithmetic of 0x00000008 by 1" severity warning;

        -- test set on less than using 10 and 15
        OPSelect <= "01111";
        input1 <= std_logic_vector(to_unsigned(10, input1'length));
        input2 <= std_logic_vector(to_unsigned(15, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing set on less than using 10 and 15";
        assert(result = std_logic_vector(to_unsigned(1, result'length))) report "Error: Result not set for 10 < 15" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for set on less than using 10 and 15" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for set on less than using 10 and 15" severity warning;

        -- test set on less than using 15 and 10
        OPSelect <= "01111";
        input1 <= std_logic_vector(to_unsigned(15, input1'length));
        input2 <= std_logic_vector(to_unsigned(10, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing set on less than using 15 and 10";
        assert(result = std_logic_vector(to_unsigned(0, result'length))) report "Error: Result incorrectly set for 15 < 10" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for set on less than using 15 and 10" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for set on less than using 15 and 10" severity warning;

        -- test 5 <= 0
        OPSelect <= "11001";
        input1 <= std_logic_vector(to_unsigned(5, input1'length));
        input2 <= std_logic_vector(to_unsigned(0, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 5 <= 0";
        assert(result = std_logic_vector(to_unsigned(0, result'length))) report "Error: Result value is non-zero for 5 <= 0" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for 5 <= 0" severity warning;
        assert(branch_taken = '0') report "Error: branch_taken incorrect for 5 <= 0" severity warning;

        -- test 5 > 0
        OPSelect <= "11010";
        input1 <= std_logic_vector(to_unsigned(5, input1'length));
        input2 <= std_logic_vector(to_unsigned(0, input2'length));
        IR10_6 <= "00000";
        wait for 40 ns;
        report "testing 5 > 0";
        assert(result = std_logic_vector(to_unsigned(0, result'length))) report "Error: Result value is non-zero for 5 > 0" severity warning;
        assert(result_hi = std_logic_vector(to_unsigned(0, result_hi'length))) report "Error: Result High value is non-zero for 5 > 0" severity warning;
        assert(branch_taken = '1') report "Error: branch_taken incorrect for 5 > 0" severity warning;
		  
        wait;

    end process;

end TB;