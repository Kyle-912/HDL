library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ctrl1 is
    port (
        clk       : in  std_logic;
        rst       : in  std_logic;
        go        : in  std_logic;
        done      : out std_logic;
        x_lt_y    : in  std_logic;
        x_ne_y    : in  std_logic;
        x_sel     : out std_logic;
        y_sel     : out std_logic;
        x_en      : out std_logic;
        y_en      : out std_logic;
        output_en : out std_logic
    );
end ctrl1;
architecture ctrl1_BHV of ctrl1 is
    type state_t is (START, COMPUTE, RESTART);
    signal state_r, next_state : state_t := START;
begin
    process (clk, rst)
    begin
        if (rst = '1') then
            state_r <= START;
        elsif (rising_edge(clk)) then
            state_r <= next_state;
        end if;
    end process;
    process (state_r, go, x_lt_y, x_ne_y)
    begin
        next_state <= state_r;
        x_sel      <= '0';
        y_sel      <= '0';
        x_en       <= '0';
        y_en       <= '0';
        output_en  <= '0';
        case(state_r) is
            when START =>
            x_sel <= '0';
            y_sel <= '0';
            x_en  <= '1';
            y_en  <= '1';
            done  <= '1';
            if (go = '1') then
                done       <= '0';
                next_state <= COMPUTE;
            end if;
            when COMPUTE =>
            if (x_ne_y = '1') then
                if (x_lt_y = '1') then
                    y_sel <= '1';
                    y_en  <= '1';
                else
                    x_sel <= '1';
                    x_en  <= '1';
                end if;
            else
                output_en  <= '1';
                next_state <= RESTART;
            end if;
            when RESTART =>
            done <= '1';
            if (go = '0') then
                next_state <= START;
            end if;
            when others => null;
        end case;
    end process;
end architecture; --port/signals probably wrong