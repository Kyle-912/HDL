library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity alu_controller is
  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    ALUOp     : in  std_logic_vector(5 downto 0);
    IR5_0     : in  std_logic_vector(5 downto 0);
    OPSelect  : out std_logic_vector(4 downto 0);
    ALU_LO_HI : out std_logic_vector(1 downto 0);
    HI_en     : out std_logic;
    LO_en     : out std_logic
  );
end alu_controller;
architecture BHV of alu_controller is
  signal ALU_LO_HI_r : std_logic_vector(1 downto 0) := "00";
begin
  ALU_LO_HI <= ALU_LO_HI_r; -- registered to account for 1 cycle delay from ALU
  process (clk, rst)
  begin
    if (rst = '1') then
      ALU_LO_HI_r <= "00";
    elsif (rising_edge(clk)) then
      HI_en <= '0';
      LO_en <= '0';
      case(ALUOp) is
        when "000000" => -- r-type
        case(IR5_0) is
          when "100001" => -- addu
          OPSelect    <= "00000";
          ALU_LO_HI_r <= "00";
          when "100011" => -- subu
          OPSelect    <= "00001";
          ALU_LO_HI_r <= "00";
          when "011000" => -- mult
          OPSelect    <= "00010";
          HI_en       <= '1';
          LO_en       <= '1';
          ALU_LO_HI_r <= "00";
          when "011001" => -- multu
          OPSelect    <= "00011";
          HI_en       <= '1';
          LO_en       <= '1';
          ALU_LO_HI_r <= "00";
          when "100100" => -- and
          OPSelect    <= "00100";
          ALU_LO_HI_r <= "00";
          when "100101" => -- or
          OPSelect    <= "00101";
          ALU_LO_HI_r <= "00";
          when "100110" => -- xor
          OPSelect    <= "00110";
          ALU_LO_HI_r <= "00";
          when "000010" => -- srl
          OPSelect    <= "00111";
          ALU_LO_HI_r <= "00";
          when "000000" => -- sll
          OPSelect    <= "01000";
          ALU_LO_HI_r <= "00";
          when "000011" => -- sra
          OPSelect    <= "01001";
          ALU_LO_HI_r <= "00";
          when "101010" => -- slt
          OPSelect    <= "01010";
          ALU_LO_HI_r <= "00";
          when "101011" => -- sltu
          OPSelect    <= "01011";
          ALU_LO_HI_r <= "00";
          when "010000" => -- mfhi
          OPSelect    <= "01100";
          ALU_LO_HI_r <= "10";
          when "010010" => -- mflo
          OPSelect    <= "01101";
          ALU_LO_HI_r <= "01";
          when "001000" => -- jr
          OPSelect    <= "11000";
          ALU_LO_HI_r <= "00";
          when others => null;
        end case;
        when "000001" => -- forced add for PC inc, address calculation, and addi
        OPSelect    <= "00000";
        ALU_LO_HI_r <= "00";
        when "000010" => -- forced sub for subi
        OPSelect    <= "00001";
        ALU_LO_HI_r <= "00";
        when "000011" => -- forced and for andi
        OPSelect    <= "00100";
        ALU_LO_HI_r <= "00";
        when "000100" => -- forced or for ori
        OPSelect    <= "00101";
        ALU_LO_HI_r <= "00";
        when "000101" => -- forced xor for xori
        OPSelect    <= "00110";
        ALU_LO_HI_r <= "00";
        when "000110" => -- forced slt for slti
        OPSelect    <= "01010";
        ALU_LO_HI_r <= "00";
        when "000111" => -- forced sltu for sltiu
        OPSelect    <= "01011";
        ALU_LO_HI_r <= "00";
        when "001000" => -- beq
        OPSelect    <= "10000";
        ALU_LO_HI_r <= "00";
        when "001001" => -- bne
        OPSelect    <= "10001";
        ALU_LO_HI_r <= "00";
        when "001010" => -- blez
        OPSelect    <= "10010";
        ALU_LO_HI_r <= "00";
        when "001011" => -- bgtz
        OPSelect    <= "10011";
        ALU_LO_HI_r <= "00";
        when "001100" => -- bltz
        OPSelect    <= "10100";
        ALU_LO_HI_r <= "00";
        when "001101" => -- bgez
        OPSelect    <= "10101";
        ALU_LO_HI_r <= "00";
        when "001110" => -- forced jr for jal
        OPSelect    <= "11000";
        ALU_LO_HI_r <= "00";
        when others => null;
      end case;
    end if;
  end process;
end architecture;