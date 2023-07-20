library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity adder is
    generic (
        WIDTH : positive := 8);
    port (
        x, y      : in  std_logic_vector(WIDTH - 1 downto 0);
        carry_in  : in  std_logic;
        s         : out std_logic_vector(WIDTH - 1 downto 0);
        carry_out : out std_logic);
end adder;
architecture RIPPLE_CARRY of adder is
    signal carry : std_logic_vector(WIDTH downto 0);
begin -- RIPPLE_CARRY
    U_RCA : for i in 0 to WIDTH - 1 generate
        U_FA : entity work.fa
            port map
            (
                input1    => x(i),
                input2    => y(i),
                carry_in  => carry(i),
                sum       => s(i),
                carry_out => carry(i + 1)
            );
    end generate;
    carry(0)  <= carry_in;
    carry_out <= carry(WIDTH);
end RIPPLE_CARRY;
architecture CARRY_LOOKAHEAD of adder is --attempted completion with ai but still broken
    signal carry : std_logic_vector(WIDTH downto 0);
begin
    process (x, y, carry_in)
        -- generate and propagate bits
        variable g, p   : std_logic_vector(WIDTH - 1 downto 0);
        -- and'd p sequences
        variable p_ands : std_logic_vector(WIDTH - 1 downto 0);
    begin
        -- calculate generate (g) and propagate (p) values
        for i in 0 to WIDTH - 1 loop
            g(i) := x(i) and y(i);
            p(i) := x(i) or y(i);
        end loop; -- i
        carry(0) <= carry_in;
        -- calculate each carry bit
        for i in 1 to WIDTH loop
            -- calculate and'd p terms for ith carry logic
            -- the index j corresponds to the lowest Pj value in the sequence
            -- e.g., PiPi-1...Pj
            for j in 0 to i - 1 loop
                p_ands(j) := '1';
                -- and everything from Pj to Pi-1
                for k in j to i - 1 loop
                    p_ands(j) := p_ands(j) and p(k);
                end loop;
            end loop;
            carry(i) <= g(i - 1);
            -- handle all of the pg minterms
            for j in 1 to i - 1 loop
                carry(i) <= carry(i) or (g(j) and p_ands(j));
            end loop;
            -- handle the final propagate of the carry in
            carry(i) <= carry(i) or (p_ands(0) and carry_in);
        end loop; -- i
        -- set the outputs
        for i in 0 to WIDTH - 1 loop
            s(i) <= x(i) xor y(i) xor carry(i);
        end loop; -- i
        carry_out <= carry(WIDTH);
    end process;
end CARRY_LOOKAHEAD;
-- You don't have to change any of the code for the following
-- architecture. However, read the lab instructions to create
-- an RTL schematic of this entity so you can see how the
-- synthesized circuit differs from the previous carry
-- lookahead circuit.
architecture CARRY_LOOKAHEAD_BAD_SYNTHESIS of adder is
begin -- CARRY_LOOKAHEAD_BAD_SYNTHESIS
    process (x, y, carry_in)
        -- generate and propagate bits
        variable g, p  : std_logic_vector(WIDTH - 1 downto 0);
        -- internal carry bits
        variable carry : std_logic_vector(WIDTH downto 0);
    begin
        -- calculate generate (g) and propogate (p) values
        for i in 0 to WIDTH - 1 loop
            g(i) := x(i) and y(i);
            p(i) := x(i) or y(i);
        end loop; -- i
        -- calculate carry bits (the order here is very important)
        -- Problem: defining the carries this way causes the synthesis
        -- tool to chain everything together like a ripple carry.
        -- See RTL view in synthesis tool.
        carry(0) := carry_in;
        for i in 0 to WIDTH - 1 loop
            carry(i + 1) := g(i) or (p(i) and carry(i));
        end loop; -- i
        -- set the outputs
        for i in 0 to WIDTH - 1 loop
            s(i) <= x(i) xor y(i) xor carry(i);
        end loop; -- i
        carry_out <= carry(WIDTH);
    end process;
end CARRY_LOOKAHEAD_BAD_SYNTHESIS;
architecture HIERARCHICAL of adder is
    signal bp1, bg1, bp2, bg2, c_out1 : std_logic;
begin -- HIERARCHICAL
    U_CLA8 : for i in 0 to 0 generate
        U_CLA4_1 : entity work.cla4
            port map
            (
                x        => x(3 downto 0),
                y        => y(3 downto 0),
                s        => s(3 downto 0),
                bg       => bg1,
                bp       => bp1,
                carry_in => carry_in
            );
        U_CLA4_2 : entity work.cla4
            port map
            (
                x        => x(7 downto 4),
                y        => y(7 downto 4),
                s        => s(7 downto 4),
                bg       => bg2,
                bp       => bp2,
                carry_in => c_out1
            );
        U_CGEN2 : entity work.cgen2
            port map
            (
                c_out1 => c_out1,
                c_out2 => carry_out,
                c_in   => carry_in,
                bg_in1 => bg1,
                bp_in1 => bp1,
                bg_in2 => bg2,
                bp_in2 => bp2
            );
    end generate;
end HIERARCHICAL;