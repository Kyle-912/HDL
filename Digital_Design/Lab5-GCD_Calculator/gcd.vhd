library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity gcd is
    generic (WIDTH : positive := 16);
    port (
        clk    : in  std_logic;
        rst    : in  std_logic;
        go     : in  std_logic;
        x      : in  std_logic_vector(WIDTH - 1 downto 0);
        y      : in  std_logic_vector(WIDTH - 1 downto 0);
        output : out std_logic_vector(WIDTH - 1 downto 0);
        done   : out std_logic
    );
end gcd;
architecture FSMD of gcd is
    type state_t is (START, COMPUTE, RESTART);
    signal state_r            : state_t;
    signal x_r, y_r, output_r : std_logic_vector(WIDTH - 1 downto 0);
    signal done_r             : std_logic;
begin -- FSMD
    output <= output_r;
    done   <= done_r;
    process (clk, rst)
    begin
        if (rst = '1') then
            output_r <= (others => '0');
            done_r   <= '1';
            x_r      <= (others => '0');
            y_r      <= (others => '0');
            state_r  <= START;
        elsif (rising_edge(clk)) then
            case(state_r) is
                when START =>
                x_r <= x;
                y_r <= y;
                if (go = '1') then
                    done_r  <= '0';
                    state_r <= COMPUTE;
                end if;
                when COMPUTE =>
                if (unsigned(x_r) /= unsigned(y_r)) then
                    if (unsigned(x_r) < unsigned(y_r)) then
                        y_r <= std_logic_vector(unsigned(y_r) - unsigned(x_r));
                    else
                        x_r <= std_logic_vector(unsigned(x_r) - unsigned(y_r));
                    end if;
                else
                    output_r <= x_r;
                    state_r  <= RESTART;
                end if;
                when RESTART =>
                done_r <= '1';
                if (go = '0') then
                    state_r <= START;
                end if;
                when others => null;
            end case;
        end if;
    end process;
end FSMD;
architecture FSM_PLUS_D1 of gcd is
    signal x_lt_y, x_ne_y                      : std_logic;
    signal x_sel, y_sel, x_en, y_en, output_en : std_logic;
begin -- FSM_PLUS_D1
    U_CTRL1 : entity work.ctrl1
        port map(
            clk       => clk,
            rst       => rst,
            go        => go,
            done      => done,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y,
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en
        );
    U_DP1 : entity work.datapath1
        generic map(WIDTH => WIDTH)
        port map(
            clk       => clk,
            rst       => rst,
            x         => x,
            y         => y,
            output    => output,
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y
        );
end FSM_PLUS_D1;
architecture FSM_PLUS_D2 of gcd is
    signal x_lt_y, x_ne_y                      : std_logic;
    signal x_sel, y_sel, x_en, y_en, output_en : std_logic;
begin -- FSM_PLUS_D2
    U_CTRL2 : entity work.ctrl2
        port map(
            clk       => clk,
            rst       => rst,
            go        => go,
            done      => done,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y,
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en
        );
    U_DP2 : entity work.datapath2
        generic map(WIDTH => WIDTH)
        port map(
            clk       => clk,
            rst       => rst,
            x         => x,
            y         => y,
            output    => output,
            x_sel     => x_sel,
            y_sel     => y_sel,
            x_en      => x_en,
            y_en      => y_en,
            output_en => output_en,
            x_lt_y    => x_lt_y,
            x_ne_y    => x_ne_y
        );
end FSM_PLUS_D2;
-- EXTRA CREDIT
architecture FSMD2 of gcd is
begin -- FSMD2
end FSMD2;