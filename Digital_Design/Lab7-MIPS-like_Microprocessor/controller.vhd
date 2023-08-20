library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity controller is
  port (
    clk         : in  std_logic;
    rst         : in  std_logic;
    Opcode      : in  std_logic_vector(5 downto 0);
    Specifier1  : in  std_logic_vector(5 downto 0);
    Specifier2  : in  std_logic_vector(4 downto 0);
    PCWrite     : out std_logic;
    PCWriteCond : out std_logic;
    IorD        : out std_logic;
    MemWrite    : out std_logic;
    MemToReg    : out std_logic;
    IRWrite     : out std_logic;
    JumpAndLink : out std_logic;
    IsSigned    : out std_logic;
    PCSource    : out std_logic_vector(1 downto 0);
    ALUOp       : out std_logic_vector(5 downto 0);
    ALUSrcA     : out std_logic;
    ALUSrcB     : out std_logic_vector(1 downto 0);
    RegWrite    : out std_logic;
    RegDst      : out std_logic
  );
end controller;
architecture BHV of controller is
  type state_t is (HALT, INSTRUCTION_1, INSTRUCTION_2, LOAD_1, LOAD_2, LOAD_3, LOAD_4, STORE_1, STORE_2, STORE_3, R_1, R_2, ADDI_1, ADDI_2, SUBI_1, SUBI_2, ANDI_1, ANDI_2, ORI_1, ORI_2, XORI_1, XORI_2, SLTI_1, SLTI_2, SLTIU_1, SLTIU_2, JUMP_1, JUMP_2, JR_1, JR_2, JR_3, JAL_1, JAL_2, BEQ_1, BEQ_2, BEQ_3, BNE_1, BNE_2, BNE_3, BLEZ_1, BLEZ_2, BLEZ_3, BGTZ_1, BGTZ_2, BGTZ_3, BLTZ_BGEZ_1, BLTZ_BGEZ_2, BLTZ_BGEZ_3);
  signal state_r, next_state_r : state_t;
begin
  process (clk, rst)
  begin
    if (rst = '1') then
      state_r <= INSTRUCTION_1;
    elsif (rising_edge(clk)) then
      state_r <= next_state_r;
    end if;
  end process;
  process (state_r, Opcode, Specifier1, Specifier2)
  begin
    PCWrite     <= '0';
    PCWriteCond <= '0';
    IorD        <= '0';
    MemWrite    <= '0';
    MemToReg    <= '0';
    IRWrite     <= '0';
    JumpAndLink <= '0';
    IsSigned    <= '0';
    PCSource    <= "00";
    ALUOp       <= "000000";
    ALUSrcA     <= '0';
    ALUSrcB     <= "00";
    RegWrite    <= '0';
    RegDst      <= '0';
    case (state_r) is
      when INSTRUCTION_1 =>
        IorD         <= '0'; -- <Fetch instruction>
        IRWrite      <= '1'; -- <Store instruction in IR>
        ALUOp        <= "000001";
        next_state_r <= INSTRUCTION_2;
      when INSTRUCTION_2 =>
        -- <PC = PC + 4>
        ALUSrcA  <= '0';
        ALUSrcB  <= "01";
        PCSource <= "00";
        PCWrite  <= '1';
        case(Opcode) is
        when "100011" => -- lw
          ALUOp        <= "000001";
          next_state_r <= LOAD_1;
        when "101011" => -- sw
          ALUOp        <= "000001";
          next_state_r <= STORE_1;
        when "000000" =>                          -- r-type
          if (unsigned(Specifier1) = "001000") then -- jump register
            ALUOp        <= "000000";
            next_state_r <= JR_1;
          else
            ALUOp        <= "000000";
            next_state_r <= R_1;
          end if;
        when "001001" => -- i-type addi
          ALUOp        <= "000001";
          next_state_r <= ADDI_1;
        when "010000" => -- i-type subi
          ALUOp        <= "000010";
          next_state_r <= SUBI_1;
        when "001100" => -- i-type andi
          ALUOp        <= "000011";
          next_state_r <= ANDI_1;
        when "001101" => -- i-type ori
          ALUOp        <= "000100";
          next_state_r <= ORI_1;
        when "001110" => -- i-type xori
          ALUOp        <= "000101";
          next_state_r <= XORI_1;
        when "001010" => -- i-type slti
          ALUOp        <= "000110";
          next_state_r <= SLTI_1;
        when "001011" => -- i-type sltiu
          ALUOp        <= "000111";
          next_state_r <= SLTIU_1;
        when "000100" => -- b-type beq
          ALUOp        <= "000001";
          next_state_r <= BEQ_1;
        when "000101" => -- b-type bne
          ALUOp        <= "000001";
          next_state_r <= BNE_1;
        when "000110" => -- b-type blez
          ALUOp        <= "000001";
          next_state_r <= BLEZ_1;
        when "000111" => -- b-type bgtz
          ALUOp        <= "000001";
          next_state_r <= BGTZ_1;
        when "000001" => -- b-type bltz,bgez
          ALUOp        <= "000001";
          next_state_r <= BLTZ_BGEZ_1;
        when "000010" => -- jump
          next_state_r <= JUMP_1;
        when "000011" => -- jump and link
          ALUOp        <= "001110";
          next_state_r <= JAL_1;
        when "111111" => -- halt
          next_state_r <= HALT;
        when others => --null;
          next_state_r <= HALT;
        end case;
      when LOAD_1 =>
        -- <Compute memory address>
        IsSigned     <= '0';
        ALUSrcB      <= "10";
        ALUSrcA      <= '1';
        next_state_r <= LOAD_2;
      when LOAD_2 =>
        IorD         <= '1'; -- <Send memory address to memory>
        next_state_r <= LOAD_3;
      when LOAD_3 =>
        --wait for value from memory to appear in memory data register
        next_state_r <= LOAD_4;
      when LOAD_4 =>
        -- <Retrieve data from memory and load it to register>
        MemToReg     <= '1';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when STORE_1 =>
        -- <Compute memory address>
        IsSigned     <= '0';
        ALUSrcB      <= "10";
        ALUSrcA      <= '1';
        next_state_r <= STORE_2;
      when STORE_2 =>
        IorD         <= '1'; -- <Send memory address to memory>
        MemWrite     <= '1'; -- <Write data to that address>
        next_state_r <= STORE_3;
      when STORE_3 => -- <Wait for next instruction to be output from memory>
        next_state_r <= INSTRUCTION_1;
      when R_1 => -- <Route register values to alu and select r-type>
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        next_state_r <= R_2;
      when R_2 =>
        -- <Disable HI_en/LO_en to store proper result from mult/multu>
        ALUOp        <= "000001";
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '1';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when ADDI_1 => -- <Route register and immediate values to alu and force add>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '1';
        next_state_r <= ADDI_2;
      when ADDI_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when SUBI_1 => -- <Route register and immediate values to alu and force sub>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '1';
        next_state_r <= SUBI_2;
      when SUBI_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when ANDI_1 => -- <Route register and immediate values to alu and force and>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '0';
        next_state_r <= ANDI_2;
      when ANDI_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when ORI_1 => -- <Route register and immediate values to alu and force or>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '0';
        next_state_r <= ORI_2;
      when ORI_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when XORI_1 => -- <Route register and immediate values to alu and force xor>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '0';
        next_state_r <= XORI_2;
      when XORI_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when SLTI_1 => -- <Route register and immediate values to alu and force slt>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '1';
        next_state_r <= SLTI_2;
      when SLTI_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when SLTIU_1 => -- <Route register and immediate values to alu and force sltu>
        ALUSrcA      <= '1';
        ALUSrcB      <= "10";
        IsSigned     <= '1';
        next_state_r <= SLTIU_2;
      when SLTIU_2 => -- <Store result in register>
        MemToReg     <= '0';
        RegDst       <= '0';
        RegWrite     <= '1';
        next_state_r <= INSTRUCTION_1;
      when BEQ_1 => -- <Calculate branch target>
        ALUSrcA      <= '0';
        ALUSrcB      <= "11";
        IsSigned     <= '1';
        ALUOp        <= "001000"; -- beq
        next_state_r <= BEQ_2;
      when BEQ_2 => -- <Evaluate branch>
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        PCWriteCond  <= '1';
        PCSource     <= "01";
        next_state_r <= BEQ_3;
      when BEQ_3 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when BNE_1 => -- <Calculate branch target>
        ALUSrcA      <= '0';
        ALUSrcB      <= "11";
        IsSigned     <= '1';
        ALUOp        <= "001001"; -- bne
        next_state_r <= BNE_2;
      when BNE_2 => -- <Evaluate branch>
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        PCWriteCond  <= '1';
        PCSource     <= "01";
        next_state_r <= BNE_3;
      when BNE_3 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when BLEZ_1 => -- <Calculate branch target>
        ALUSrcA      <= '0';
        ALUSrcB      <= "11";
        IsSigned     <= '1';
        ALUOp        <= "001010"; -- blez
        next_state_r <= BLEZ_2;
      when BLEZ_2 => -- <Evaluate branch>
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        PCWriteCond  <= '1';
        PCSource     <= "01";
        next_state_r <= BLEZ_3;
      when BLEZ_3 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when BGTZ_1 => -- <Calculate branch target>
        ALUSrcA      <= '0';
        ALUSrcB      <= "11";
        IsSigned     <= '1';
        ALUOp        <= "001011"; -- bgtz
        next_state_r <= BGTZ_2;
      when BGTZ_2 => -- <Evaluate branch>
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        PCWriteCond  <= '1';
        PCSource     <= "01";
        next_state_r <= BGTZ_3;
      when BGTZ_3 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when BLTZ_BGEZ_1 => -- <Calculate branch target>
        ALUSrcA  <= '0';
        ALUSrcB  <= "11";
        IsSigned <= '1';
        if (unsigned(Specifier2) = "00000") then
          ALUOp <= "001100"; -- bltz
        elsif (unsigned(Specifier2) = "00001") then
          ALUOp <= "001101"; -- bgez
        end if;
        next_state_r <= BLTZ_BGEZ_2;
      when BLTZ_BGEZ_2 => -- <Evaluate branch>
        ALUSrcA      <= '1';
        ALUSrcB      <= "00";
        PCWriteCond  <= '1';
        PCSource     <= "01";
        next_state_r <= BLTZ_BGEZ_3;
      when BLTZ_BGEZ_3 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when JUMP_1 => -- <Write value from instruction to program counter>
        PCSource     <= "10";
        PCWrite      <= '1';
        next_state_r <= JUMP_2;
      when JUMP_2 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when JR_1 => -- <Write register value to program counter>
        ALUSrcA      <= '1';
        PCSource     <= "00";
        PCWrite      <= '1';
        next_state_r <= JR_2;
      when JR_2 =>
        -- <Stall for program counter timing>
        next_state_r <= INSTRUCTION_1;
      when JAL_1 => -- <Write value from instruction to program counter>
        PCSource     <= "10";
        PCWrite      <= '1';
        ALUSrcA      <= '0'; -- <Pass current program counter to alu>
        next_state_r <= JAL_2;
      when JAL_2 => -- <Write program counter to R31>
        MemToReg     <= '0';
        JumpAndLink  <= '1';
        next_state_r <= INSTRUCTION_1;
      when HALT =>
        next_state_r <= state_r;
      when others =>
        next_state_r <= state_r;
    end case;
  end process;
end architecture;