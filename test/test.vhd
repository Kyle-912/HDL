library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
    port (
        clk : in std_logic;
        rst : in std_logic;
        input : in std_logic_vector(7 downto 0);
        done : out std_logic
    );
end test;

architecture bhv of test is
    type state_type is (IDLE, CHECK, DONE);
    signal state : state_type;
    signal input_r : std_logic_vector(7 downto 0);
begin
    TEST_PROC : process(clk, rst)
    begin
        if rst = '1' then
            input_r <= (others => '0');
    
        elsif rising_edge(clk) then
            case state is
            
                when IDLE =>
                    state <= CHECK;

                when CHECK =>
                    if unsigned(input) = to_unsigned(0, input'length) then
                        input_r <= input;
                        state <= DONE;
                    end if;

                when DONE =>
                    done <= '1';

                when others => null;
            
            end case;
    
        end if;
    end process;
end architecture;