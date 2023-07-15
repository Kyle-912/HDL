library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity datapath is
    generic (WIDTH : positive := 32);
    port (
        clk50MHz    : in  std_logic;
        rst         : in  std_logic;
        switch_data : in  std_logic_vector(31 downto 0);
        port_select : in  std_logic;
        in_port_en  : in  std_logic;
        out_port    : out std_logic_vector(31 downto 0)
    );
end datapath;

architecture BHV of datapath is
    signal result, result_hi, pc_out, alu_out, HI_out, LO_out, memory_out, memory_data_r_out, sign_extend_out, reg_a, reg_b, mux1_out, mux3_out, mux4_out, mux5_out, mux6_out, mux7_out : std_logic_vector(31 downto 0);
    signal mux2_out          : std_logic_vector(4 downto 0);
    signal ALU_LO_HI         : std_logic_vector(1 downto 0);
    signal OPSelect          : std_logic_vector(4 downto 0);
    signal HI_en, LO_en      : std_logic;
    signal branch_taken      : std_logic;
    signal IR25_0            : std_logic_vector(25 downto 0);
    signal IR31_26, IR5_0    : std_logic_vector(5 downto 0);
    signal IR25_21, IR20_16, IR15_11, IR10_6 : std_logic_vector(4 downto 0);
    signal IR15_0            : std_logic_vector(15 downto 0);
    signal PCWrite, PCWriteCond, IorD, MemWrite, MemToReg, IRWrite, JumpAndLink, IsSigned, ALUSrcA, RegWrite, RegDst : std_logic;
    signal PCSource, ALUSrcB : std_logic_vector(1 downto 0);
    signal ALUOp             : std_logic_vector(5 downto 0);
begin
    U_ALU : entity work.alu
    port map(
        input1       => mux4_out,
        input2       => mux5_out,
        OPSelect     => OPSelect,
        shift_amount => IR10_6,
        result       => result,
        result_hi    => result_hi,
        branch_taken => branch_taken
    );

    U_REGISTER_FILE : entity work.register_file
    port map(
        clk         => clk50MHz,
        rst         => rst,
        read_reg_1  => IR25_21,
        read_reg_2  => IR20_16,
        write_reg   => mux2_out,
        write_data  => mux3_out,
        read_data1  => reg_a,
        read_data2  => reg_b,
        RegWrite    => RegWrite,
        JumpAndLink => JumpAndLink
    );

    U_IR : entity work.ir 
    port map(
        clk     => clk50MHz,
        rst     => rst,
        input   => memory_out,
        IRWrite => IRWrite,
        IR5_0   => IR5_0,
        IR25_0  => IR25_0,
        IR31_26 => IR31_26,
        IR25_21 => IR25_21,
        IR20_16 => IR20_16,
        IR15_11 => IR15_11,
        IR15_0  => IR15_0,
        IR10_6  => IR10_6,
        IR      => open
    );

    U_PC : entity work.pc
    port map(
        clk          => clk50MHz,
        rst          => rst,
        input        => mux6_out,
        PC           => pc_out,
        PCWrite      => PCWrite,
        PCWriteCond  => PCWriteCond,
        branch_taken => branch_taken
    );

    U_MEMORY_DATA_R : entity work.register_32bit
    port map(
        clk    => clk50MHz,
        input  => memory_out,
        output => memory_data_r_out
    );

    U_ALUOUT_R : entity work.register_32bit
    port map(
        clk    => clk50MHz,
        input  => result,
        output => alu_out
    );

    U_HI_R : entity work.register_32bit_en
    port map(
        clk    => clk50MHz,
        en     => HI_en,
        input  => result_hi,
        output => HI_out
    );

    U_LO_R : entity work.register_32bit_en
    port map(
        clk    => clk50MHz,
        en     => LO_en,
        input  => result,
        output => LO_out
    );

    U_CONTROLLER : entity work.controller
    port map(
        clk         => clk50MHz,
        rst         => rst,
        Opcode      => IR31_26,
        Specifier1  => IR5_0,
        Specifier2  => IR20_16,
        PCWrite     => PCWrite,
        PCWriteCond => PCWriteCond,
        IorD        => IorD,
        MemWrite    => MemWrite,
        MemToReg    => MemToReg,
        IRWrite     => IRWrite,
        JumpAndLink => JumpAndLink,
        IsSigned    => IsSigned,
        PCSource    => PCSource,
        ALUOp       => ALUOp,
        ALUSrcA     => ALUSrcA,
        ALUSrcB     => ALUSrcB,
        RegWrite    => RegWrite,
        RegDst      => RegDst
    );

    U_ALU_CONTROLLER : entity work.alu_controller
    port map(
        clk       => clk50MHz,
        rst       => rst,
        ALUOp     => ALUOp,
        IR5_0     => IR5_0,
        OPSelect  => OPSelect,
        ALU_LO_HI => ALU_LO_HI,
        HI_en     => HI_en,
        LO_en     => LO_en
    );

    U_MEMORY : entity work.memory
    port map(
        clock       => clk50MHz,
        address     => mux1_out,
        data        => reg_b,
        mem_write   => MemWrite,
        switch_data => switch_data,
        port_select => port_select,
        in_port_en  => in_port_en,
        out_port    => out_port,
        output      => memory_out
    );

    U_SIGN_EXTENDED : entity work.sign_extend
    port map(
        input    => IR15_0,
        IsSigned => IsSigned,
        output   => sign_extend_out
    );

    U_MUX1 : entity work.mux2x1
    generic map (WIDTH => 32)
    port map ( 
        input0 => pc_out,
        input1 => alu_out,
        sel    => IorD,
        output => mux1_out
    );

    U_MUX2 : entity work.mux2x1
    generic map (WIDTH => 5)
    port map ( 
        input0 => IR20_16,
        input1 => IR15_11,
        sel    => RegDst,
        output => mux2_out
    );

    U_MUX3 : entity work.mux2x1
    generic map (WIDTH => 32)
    port map ( 
        input0 => mux7_out,
        input1 => memory_data_r_out,
        sel    => MemToReg,
        output => mux3_out
    );

    U_MUX4 : entity work.mux2x1
    generic map (WIDTH => 32)
    port map ( 
        input0 => pc_out,
        input1 => reg_a,
        sel    => ALUSrcA,
        output => mux4_out
    );

    U_MUX5 : entity work.mux4x1
    port map (
        input0 => reg_b,
        input1 => std_logic_vector(to_unsigned(4, 32)),
        input2 => sign_extend_out,
        input3 => sign_extend_out,
        sel    => ALUSrcB,
        output => mux5_out
    );

    U_MUX6 : entity work.mux3x1_special
    port map ( 
        input0   => result,
        input1   => alu_out,
        input2_1 => pc_out(31 downto 28),
        input2_2 => IR25_0,
        sel      => PCSource,
        output   => mux6_out
    );

    U_MUX7 : entity work.mux3x1
    port map ( 
        input0 => alu_out,
        input1 => LO_out,
        input2 => HI_out,
        sel    => ALU_LO_HI,
        output => mux7_out
    );

end architecture;