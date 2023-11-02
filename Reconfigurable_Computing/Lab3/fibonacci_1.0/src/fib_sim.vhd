-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Mon Oct  3 14:53:06 2022
-- Host        : ece-b318-stitt running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim c:/Users/gstitt/ip_repo/fib/fib2.vhd
-- Design      : fib
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fib is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    go : in STD_LOGIC;
    n : in STD_LOGIC_VECTOR ( 5 downto 0 );
    result : out STD_LOGIC_VECTOR ( 31 downto 0 );
    done : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fib : entity is true;
end fib;

architecture STRUCTURE of fib is
  signal \FSM_sequential_state_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_r[1]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_r[1]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_r[1]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_r[1]_i_6_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_r[1]_i_7_n_0\ : STD_LOGIC;
  signal \FSM_sequential_state_r[1]_i_8_n_0\ : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal done_OBUF : STD_LOGIC;
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_i_2_n_0 : STD_LOGIC;
  signal go_IBUF : STD_LOGIC;
  signal \i_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \i_r[0]_i_3_n_0\ : STD_LOGIC;
  signal \i_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \i_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \i_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \i_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \i_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \i_r[5]_i_2_n_0\ : STD_LOGIC;
  signal \i_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \i_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \i_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \i_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \i_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \i_r_reg_n_0_[5]\ : STD_LOGIC;
  signal in5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal n_IBUF : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal n_r0 : STD_LOGIC;
  signal \n_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \n_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \n_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \n_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \n_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \n_r_reg_n_0_[5]\ : STD_LOGIC;
  signal result0 : STD_LOGIC;
  signal \result[0]_i_1_n_0\ : STD_LOGIC;
  signal \result[10]_i_1_n_0\ : STD_LOGIC;
  signal \result[11]_i_1_n_0\ : STD_LOGIC;
  signal \result[12]_i_1_n_0\ : STD_LOGIC;
  signal \result[13]_i_1_n_0\ : STD_LOGIC;
  signal \result[14]_i_1_n_0\ : STD_LOGIC;
  signal \result[15]_i_1_n_0\ : STD_LOGIC;
  signal \result[16]_i_1_n_0\ : STD_LOGIC;
  signal \result[17]_i_1_n_0\ : STD_LOGIC;
  signal \result[18]_i_1_n_0\ : STD_LOGIC;
  signal \result[19]_i_1_n_0\ : STD_LOGIC;
  signal \result[1]_i_1_n_0\ : STD_LOGIC;
  signal \result[20]_i_1_n_0\ : STD_LOGIC;
  signal \result[21]_i_1_n_0\ : STD_LOGIC;
  signal \result[22]_i_1_n_0\ : STD_LOGIC;
  signal \result[23]_i_1_n_0\ : STD_LOGIC;
  signal \result[24]_i_1_n_0\ : STD_LOGIC;
  signal \result[25]_i_1_n_0\ : STD_LOGIC;
  signal \result[26]_i_1_n_0\ : STD_LOGIC;
  signal \result[27]_i_1_n_0\ : STD_LOGIC;
  signal \result[28]_i_1_n_0\ : STD_LOGIC;
  signal \result[29]_i_1_n_0\ : STD_LOGIC;
  signal \result[2]_i_1_n_0\ : STD_LOGIC;
  signal \result[30]_i_1_n_0\ : STD_LOGIC;
  signal \result[31]_i_2_n_0\ : STD_LOGIC;
  signal \result[3]_i_1_n_0\ : STD_LOGIC;
  signal \result[4]_i_1_n_0\ : STD_LOGIC;
  signal \result[5]_i_1_n_0\ : STD_LOGIC;
  signal \result[6]_i_1_n_0\ : STD_LOGIC;
  signal \result[7]_i_1_n_0\ : STD_LOGIC;
  signal \result[8]_i_1_n_0\ : STD_LOGIC;
  signal \result[9]_i_1_n_0\ : STD_LOGIC;
  signal result_OBUF : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rst_IBUF : STD_LOGIC;
  signal state_r : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state_r__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal x_r0 : STD_LOGIC;
  signal \x_r[31]_i_1_n_0\ : STD_LOGIC;
  signal \x_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[16]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[17]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[18]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[19]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[20]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[21]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[22]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[23]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[24]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[25]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[26]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[27]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[28]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[29]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[30]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[31]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \x_r_reg_n_0_[9]\ : STD_LOGIC;
  signal \y_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \y_r[11]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[11]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[11]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[11]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[15]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[15]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[15]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[15]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[19]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[19]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[19]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[19]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[23]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[23]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[23]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[23]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[27]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[27]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[27]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[27]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[31]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[31]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[31]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[31]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[3]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[3]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[3]_i_5_n_0\ : STD_LOGIC;
  signal \y_r[7]_i_2_n_0\ : STD_LOGIC;
  signal \y_r[7]_i_3_n_0\ : STD_LOGIC;
  signal \y_r[7]_i_4_n_0\ : STD_LOGIC;
  signal \y_r[7]_i_5_n_0\ : STD_LOGIC;
  signal \y_r_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[11]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[11]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[11]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[19]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[19]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[19]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[27]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[27]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[27]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[31]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[31]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[31]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[3]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[3]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[3]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \y_r_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \y_r_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \y_r_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \y_r_reg_n_0_[0]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[10]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[11]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[12]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[13]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[14]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[15]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[16]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[17]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[18]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[19]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[1]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[20]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[21]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[22]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[23]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[24]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[25]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[26]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[27]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[28]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[29]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[2]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[30]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[31]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[3]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[4]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[5]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[6]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[7]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[8]\ : STD_LOGIC;
  signal \y_r_reg_n_0_[9]\ : STD_LOGIC;
  signal \NLW_y_r_reg[31]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_state_r[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \FSM_sequential_state_r[1]_i_2\ : label is "soft_lutpair3";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_r_reg[0]\ : label is "init:01,compute:10,start:00";
  attribute FSM_ENCODED_STATES of \FSM_sequential_state_r_reg[1]\ : label is "init:01,compute:10,start:00";
  attribute SOFT_HLUTNM of \i_r[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \i_r[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \i_r[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \i_r[5]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \i_r[5]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \result[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \result[10]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \result[11]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \result[12]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \result[13]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \result[14]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \result[15]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \result[16]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \result[17]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \result[18]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \result[19]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \result[1]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \result[20]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \result[21]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \result[22]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \result[23]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \result[24]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \result[25]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \result[26]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \result[27]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \result[28]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \result[29]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \result[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \result[30]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \result[31]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \result[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \result[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \result[5]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \result[6]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \result[7]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \result[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \result[9]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \y_r[0]_i_1\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \y_r_reg[11]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[19]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[27]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[31]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[3]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \y_r_reg[7]_i_1\ : label is 35;
begin
\FSM_sequential_state_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => state_r(1),
      I1 => state_r(0),
      O => \state_r__0\(0)
    );
\FSM_sequential_state_r[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"11FC"
    )
        port map (
      I0 => \FSM_sequential_state_r[1]_i_3_n_0\,
      I1 => state_r(0),
      I2 => go_IBUF,
      I3 => state_r(1),
      O => \FSM_sequential_state_r[1]_i_1_n_0\
    );
\FSM_sequential_state_r[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \FSM_sequential_state_r[1]_i_4_n_0\,
      I1 => state_r(0),
      I2 => state_r(1),
      O => \state_r__0\(1)
    );
\FSM_sequential_state_r[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4F4F4F4F444F4444"
    )
        port map (
      I0 => \i_r_reg_n_0_[5]\,
      I1 => \n_r_reg_n_0_[5]\,
      I2 => \FSM_sequential_state_r[1]_i_5_n_0\,
      I3 => \FSM_sequential_state_r[1]_i_6_n_0\,
      I4 => \FSM_sequential_state_r[1]_i_7_n_0\,
      I5 => \FSM_sequential_state_r[1]_i_8_n_0\,
      O => \FSM_sequential_state_r[1]_i_3_n_0\
    );
\FSM_sequential_state_r[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \n_r_reg_n_0_[4]\,
      I1 => \n_r_reg_n_0_[3]\,
      I2 => \n_r_reg_n_0_[1]\,
      I3 => \n_r_reg_n_0_[2]\,
      I4 => \n_r_reg_n_0_[0]\,
      I5 => \n_r_reg_n_0_[5]\,
      O => \FSM_sequential_state_r[1]_i_4_n_0\
    );
\FSM_sequential_state_r[1]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \n_r_reg_n_0_[4]\,
      I1 => \i_r_reg_n_0_[4]\,
      I2 => \n_r_reg_n_0_[5]\,
      I3 => \i_r_reg_n_0_[5]\,
      O => \FSM_sequential_state_r[1]_i_5_n_0\
    );
\FSM_sequential_state_r[1]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \n_r_reg_n_0_[2]\,
      I1 => \i_r_reg_n_0_[2]\,
      I2 => \n_r_reg_n_0_[3]\,
      I3 => \i_r_reg_n_0_[3]\,
      O => \FSM_sequential_state_r[1]_i_6_n_0\
    );
\FSM_sequential_state_r[1]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B0FBB0FBFFFFB0FB"
    )
        port map (
      I0 => \n_r_reg_n_0_[0]\,
      I1 => \i_r_reg_n_0_[0]\,
      I2 => \n_r_reg_n_0_[1]\,
      I3 => \i_r_reg_n_0_[1]\,
      I4 => \n_r_reg_n_0_[2]\,
      I5 => \i_r_reg_n_0_[2]\,
      O => \FSM_sequential_state_r[1]_i_7_n_0\
    );
\FSM_sequential_state_r[1]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4F44"
    )
        port map (
      I0 => \i_r_reg_n_0_[4]\,
      I1 => \n_r_reg_n_0_[4]\,
      I2 => \i_r_reg_n_0_[3]\,
      I3 => \n_r_reg_n_0_[3]\,
      O => \FSM_sequential_state_r[1]_i_8_n_0\
    );
\FSM_sequential_state_r_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \FSM_sequential_state_r[1]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \state_r__0\(0),
      Q => state_r(0)
    );
\FSM_sequential_state_r_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \FSM_sequential_state_r[1]_i_1_n_0\,
      CLR => rst_IBUF,
      D => \state_r__0\(1),
      Q => state_r(1)
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
done_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => done_OBUF,
      O => done
    );
done_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A3F0A30"
    )
        port map (
      I0 => \FSM_sequential_state_r[1]_i_4_n_0\,
      I1 => \FSM_sequential_state_r[1]_i_3_n_0\,
      I2 => state_r(1),
      I3 => state_r(0),
      I4 => go_IBUF,
      O => done_i_1_n_0
    );
done_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => state_r(1),
      I1 => state_r(0),
      O => done_i_2_n_0
    );
done_reg: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => done_i_1_n_0,
      CLR => rst_IBUF,
      D => done_i_2_n_0,
      Q => done_OBUF
    );
go_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => go,
      O => go_IBUF
    );
\i_r[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => rst_IBUF,
      I1 => state_r(0),
      I2 => state_r(1),
      O => \i_r[0]_i_1_n_0\
    );
\i_r[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0301"
    )
        port map (
      I0 => state_r(1),
      I1 => state_r(0),
      I2 => rst_IBUF,
      I3 => \FSM_sequential_state_r[1]_i_3_n_0\,
      O => x_r0
    );
\i_r[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \i_r_reg_n_0_[0]\,
      O => \i_r[0]_i_3_n_0\
    );
\i_r[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6F"
    )
        port map (
      I0 => \i_r_reg_n_0_[1]\,
      I1 => \i_r_reg_n_0_[0]\,
      I2 => state_r(1),
      O => \i_r[1]_i_1_n_0\
    );
\i_r[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => state_r(1),
      I1 => \i_r_reg_n_0_[0]\,
      I2 => \i_r_reg_n_0_[1]\,
      I3 => \i_r_reg_n_0_[2]\,
      O => \i_r[2]_i_1_n_0\
    );
\i_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAA8000"
    )
        port map (
      I0 => state_r(1),
      I1 => \i_r_reg_n_0_[1]\,
      I2 => \i_r_reg_n_0_[0]\,
      I3 => \i_r_reg_n_0_[2]\,
      I4 => \i_r_reg_n_0_[3]\,
      O => \i_r[3]_i_1_n_0\
    );
\i_r[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2AAAAAAA80000000"
    )
        port map (
      I0 => state_r(1),
      I1 => \i_r_reg_n_0_[3]\,
      I2 => \i_r_reg_n_0_[2]\,
      I3 => \i_r_reg_n_0_[0]\,
      I4 => \i_r_reg_n_0_[1]\,
      I5 => \i_r_reg_n_0_[4]\,
      O => \i_r[4]_i_1_n_0\
    );
\i_r[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => state_r(1),
      I1 => \i_r[5]_i_2_n_0\,
      I2 => \i_r_reg_n_0_[4]\,
      I3 => \i_r_reg_n_0_[5]\,
      O => \i_r[5]_i_1_n_0\
    );
\i_r[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \i_r_reg_n_0_[3]\,
      I1 => \i_r_reg_n_0_[2]\,
      I2 => \i_r_reg_n_0_[0]\,
      I3 => \i_r_reg_n_0_[1]\,
      O => \i_r[5]_i_2_n_0\
    );
\i_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \i_r[0]_i_3_n_0\,
      Q => \i_r_reg_n_0_[0]\,
      R => \i_r[0]_i_1_n_0\
    );
\i_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \i_r[1]_i_1_n_0\,
      Q => \i_r_reg_n_0_[1]\,
      R => '0'
    );
\i_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \i_r[2]_i_1_n_0\,
      Q => \i_r_reg_n_0_[2]\,
      R => '0'
    );
\i_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \i_r[3]_i_1_n_0\,
      Q => \i_r_reg_n_0_[3]\,
      R => '0'
    );
\i_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \i_r[4]_i_1_n_0\,
      Q => \i_r_reg_n_0_[4]\,
      R => '0'
    );
\i_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \i_r[5]_i_1_n_0\,
      Q => \i_r_reg_n_0_[5]\,
      R => '0'
    );
\n_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => n(0),
      O => n_IBUF(0)
    );
\n_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => n(1),
      O => n_IBUF(1)
    );
\n_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => n(2),
      O => n_IBUF(2)
    );
\n_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => n(3),
      O => n_IBUF(3)
    );
\n_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => n(4),
      O => n_IBUF(4)
    );
\n_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => n(5),
      O => n_IBUF(5)
    );
\n_r[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => state_r(0),
      I1 => state_r(1),
      I2 => rst_IBUF,
      O => n_r0
    );
\n_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => n_r0,
      D => n_IBUF(0),
      Q => \n_r_reg_n_0_[0]\,
      R => '0'
    );
\n_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => n_r0,
      D => n_IBUF(1),
      Q => \n_r_reg_n_0_[1]\,
      R => '0'
    );
\n_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => n_r0,
      D => n_IBUF(2),
      Q => \n_r_reg_n_0_[2]\,
      R => '0'
    );
\n_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => n_r0,
      D => n_IBUF(3),
      Q => \n_r_reg_n_0_[3]\,
      R => '0'
    );
\n_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => n_r0,
      D => n_IBUF(4),
      Q => \n_r_reg_n_0_[4]\,
      R => '0'
    );
\n_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => n_r0,
      D => n_IBUF(5),
      Q => \n_r_reg_n_0_[5]\,
      R => '0'
    );
\result[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[0]\,
      I1 => state_r(0),
      O => \result[0]_i_1_n_0\
    );
\result[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[10]\,
      I1 => state_r(0),
      O => \result[10]_i_1_n_0\
    );
\result[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[11]\,
      I1 => state_r(0),
      O => \result[11]_i_1_n_0\
    );
\result[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[12]\,
      I1 => state_r(0),
      O => \result[12]_i_1_n_0\
    );
\result[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[13]\,
      I1 => state_r(0),
      O => \result[13]_i_1_n_0\
    );
\result[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[14]\,
      I1 => state_r(0),
      O => \result[14]_i_1_n_0\
    );
\result[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[15]\,
      I1 => state_r(0),
      O => \result[15]_i_1_n_0\
    );
\result[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[16]\,
      I1 => state_r(0),
      O => \result[16]_i_1_n_0\
    );
\result[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[17]\,
      I1 => state_r(0),
      O => \result[17]_i_1_n_0\
    );
\result[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[18]\,
      I1 => state_r(0),
      O => \result[18]_i_1_n_0\
    );
\result[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[19]\,
      I1 => state_r(0),
      O => \result[19]_i_1_n_0\
    );
\result[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[1]\,
      I1 => state_r(0),
      O => \result[1]_i_1_n_0\
    );
\result[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[20]\,
      I1 => state_r(0),
      O => \result[20]_i_1_n_0\
    );
\result[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[21]\,
      I1 => state_r(0),
      O => \result[21]_i_1_n_0\
    );
\result[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[22]\,
      I1 => state_r(0),
      O => \result[22]_i_1_n_0\
    );
\result[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[23]\,
      I1 => state_r(0),
      O => \result[23]_i_1_n_0\
    );
\result[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[24]\,
      I1 => state_r(0),
      O => \result[24]_i_1_n_0\
    );
\result[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[25]\,
      I1 => state_r(0),
      O => \result[25]_i_1_n_0\
    );
\result[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[26]\,
      I1 => state_r(0),
      O => \result[26]_i_1_n_0\
    );
\result[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[27]\,
      I1 => state_r(0),
      O => \result[27]_i_1_n_0\
    );
\result[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[28]\,
      I1 => state_r(0),
      O => \result[28]_i_1_n_0\
    );
\result[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[29]\,
      I1 => state_r(0),
      O => \result[29]_i_1_n_0\
    );
\result[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[2]\,
      I1 => state_r(0),
      O => \result[2]_i_1_n_0\
    );
\result[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[30]\,
      I1 => state_r(0),
      O => \result[30]_i_1_n_0\
    );
\result[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000838"
    )
        port map (
      I0 => \FSM_sequential_state_r[1]_i_4_n_0\,
      I1 => state_r(0),
      I2 => state_r(1),
      I3 => \FSM_sequential_state_r[1]_i_3_n_0\,
      I4 => rst_IBUF,
      O => result0
    );
\result[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[31]\,
      I1 => state_r(0),
      O => \result[31]_i_2_n_0\
    );
\result[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[3]\,
      I1 => state_r(0),
      O => \result[3]_i_1_n_0\
    );
\result[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[4]\,
      I1 => state_r(0),
      O => \result[4]_i_1_n_0\
    );
\result[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[5]\,
      I1 => state_r(0),
      O => \result[5]_i_1_n_0\
    );
\result[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[6]\,
      I1 => state_r(0),
      O => \result[6]_i_1_n_0\
    );
\result[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[7]\,
      I1 => state_r(0),
      O => \result[7]_i_1_n_0\
    );
\result[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[8]\,
      I1 => state_r(0),
      O => \result[8]_i_1_n_0\
    );
\result[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \y_r_reg_n_0_[9]\,
      I1 => state_r(0),
      O => \result[9]_i_1_n_0\
    );
\result_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(0),
      O => result(0)
    );
\result_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(10),
      O => result(10)
    );
\result_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(11),
      O => result(11)
    );
\result_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(12),
      O => result(12)
    );
\result_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(13),
      O => result(13)
    );
\result_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(14),
      O => result(14)
    );
\result_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(15),
      O => result(15)
    );
\result_OBUF[16]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(16),
      O => result(16)
    );
\result_OBUF[17]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(17),
      O => result(17)
    );
\result_OBUF[18]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(18),
      O => result(18)
    );
\result_OBUF[19]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(19),
      O => result(19)
    );
\result_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(1),
      O => result(1)
    );
\result_OBUF[20]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(20),
      O => result(20)
    );
\result_OBUF[21]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(21),
      O => result(21)
    );
\result_OBUF[22]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(22),
      O => result(22)
    );
\result_OBUF[23]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(23),
      O => result(23)
    );
\result_OBUF[24]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(24),
      O => result(24)
    );
\result_OBUF[25]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(25),
      O => result(25)
    );
\result_OBUF[26]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(26),
      O => result(26)
    );
\result_OBUF[27]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(27),
      O => result(27)
    );
\result_OBUF[28]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(28),
      O => result(28)
    );
\result_OBUF[29]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(29),
      O => result(29)
    );
\result_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(2),
      O => result(2)
    );
\result_OBUF[30]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(30),
      O => result(30)
    );
\result_OBUF[31]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(31),
      O => result(31)
    );
\result_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(3),
      O => result(3)
    );
\result_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(4),
      O => result(4)
    );
\result_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(5),
      O => result(5)
    );
\result_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(6),
      O => result(6)
    );
\result_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(7),
      O => result(7)
    );
\result_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(8),
      O => result(8)
    );
\result_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => result_OBUF(9),
      O => result(9)
    );
\result_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[0]_i_1_n_0\,
      Q => result_OBUF(0),
      R => '0'
    );
\result_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[10]_i_1_n_0\,
      Q => result_OBUF(10),
      R => '0'
    );
\result_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[11]_i_1_n_0\,
      Q => result_OBUF(11),
      R => '0'
    );
\result_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[12]_i_1_n_0\,
      Q => result_OBUF(12),
      R => '0'
    );
\result_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[13]_i_1_n_0\,
      Q => result_OBUF(13),
      R => '0'
    );
\result_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[14]_i_1_n_0\,
      Q => result_OBUF(14),
      R => '0'
    );
\result_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[15]_i_1_n_0\,
      Q => result_OBUF(15),
      R => '0'
    );
\result_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[16]_i_1_n_0\,
      Q => result_OBUF(16),
      R => '0'
    );
\result_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[17]_i_1_n_0\,
      Q => result_OBUF(17),
      R => '0'
    );
\result_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[18]_i_1_n_0\,
      Q => result_OBUF(18),
      R => '0'
    );
\result_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[19]_i_1_n_0\,
      Q => result_OBUF(19),
      R => '0'
    );
\result_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[1]_i_1_n_0\,
      Q => result_OBUF(1),
      R => '0'
    );
\result_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[20]_i_1_n_0\,
      Q => result_OBUF(20),
      R => '0'
    );
\result_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[21]_i_1_n_0\,
      Q => result_OBUF(21),
      R => '0'
    );
\result_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[22]_i_1_n_0\,
      Q => result_OBUF(22),
      R => '0'
    );
\result_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[23]_i_1_n_0\,
      Q => result_OBUF(23),
      R => '0'
    );
\result_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[24]_i_1_n_0\,
      Q => result_OBUF(24),
      R => '0'
    );
\result_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[25]_i_1_n_0\,
      Q => result_OBUF(25),
      R => '0'
    );
\result_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[26]_i_1_n_0\,
      Q => result_OBUF(26),
      R => '0'
    );
\result_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[27]_i_1_n_0\,
      Q => result_OBUF(27),
      R => '0'
    );
\result_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[28]_i_1_n_0\,
      Q => result_OBUF(28),
      R => '0'
    );
\result_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[29]_i_1_n_0\,
      Q => result_OBUF(29),
      R => '0'
    );
\result_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[2]_i_1_n_0\,
      Q => result_OBUF(2),
      R => '0'
    );
\result_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[30]_i_1_n_0\,
      Q => result_OBUF(30),
      R => '0'
    );
\result_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[31]_i_2_n_0\,
      Q => result_OBUF(31),
      R => '0'
    );
\result_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[3]_i_1_n_0\,
      Q => result_OBUF(3),
      R => '0'
    );
\result_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[4]_i_1_n_0\,
      Q => result_OBUF(4),
      R => '0'
    );
\result_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[5]_i_1_n_0\,
      Q => result_OBUF(5),
      R => '0'
    );
\result_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[6]_i_1_n_0\,
      Q => result_OBUF(6),
      R => '0'
    );
\result_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[7]_i_1_n_0\,
      Q => result_OBUF(7),
      R => '0'
    );
\result_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[8]_i_1_n_0\,
      Q => result_OBUF(8),
      R => '0'
    );
\result_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => result0,
      D => \result[9]_i_1_n_0\,
      Q => result_OBUF(9),
      R => '0'
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
\x_r[31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => rst_IBUF,
      I1 => state_r(0),
      I2 => state_r(1),
      O => \x_r[31]_i_1_n_0\
    );
\x_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[0]\,
      Q => \x_r_reg_n_0_[0]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[10]\,
      Q => \x_r_reg_n_0_[10]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[11]\,
      Q => \x_r_reg_n_0_[11]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[12]\,
      Q => \x_r_reg_n_0_[12]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[13]\,
      Q => \x_r_reg_n_0_[13]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[14]\,
      Q => \x_r_reg_n_0_[14]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[15]\,
      Q => \x_r_reg_n_0_[15]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[16]\,
      Q => \x_r_reg_n_0_[16]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[17]\,
      Q => \x_r_reg_n_0_[17]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[18]\,
      Q => \x_r_reg_n_0_[18]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[19]\,
      Q => \x_r_reg_n_0_[19]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[1]\,
      Q => \x_r_reg_n_0_[1]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[20]\,
      Q => \x_r_reg_n_0_[20]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[21]\,
      Q => \x_r_reg_n_0_[21]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[22]\,
      Q => \x_r_reg_n_0_[22]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[23]\,
      Q => \x_r_reg_n_0_[23]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[24]\,
      Q => \x_r_reg_n_0_[24]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[25]\,
      Q => \x_r_reg_n_0_[25]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[26]\,
      Q => \x_r_reg_n_0_[26]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[27]\,
      Q => \x_r_reg_n_0_[27]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[28]\,
      Q => \x_r_reg_n_0_[28]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[29]\,
      Q => \x_r_reg_n_0_[29]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[2]\,
      Q => \x_r_reg_n_0_[2]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[30]\,
      Q => \x_r_reg_n_0_[30]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[31]\,
      Q => \x_r_reg_n_0_[31]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[3]\,
      Q => \x_r_reg_n_0_[3]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[4]\,
      Q => \x_r_reg_n_0_[4]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[5]\,
      Q => \x_r_reg_n_0_[5]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[6]\,
      Q => \x_r_reg_n_0_[6]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[7]\,
      Q => \x_r_reg_n_0_[7]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[8]\,
      Q => \x_r_reg_n_0_[8]\,
      R => \x_r[31]_i_1_n_0\
    );
\x_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r_reg_n_0_[9]\,
      Q => \x_r_reg_n_0_[9]\,
      R => \x_r[31]_i_1_n_0\
    );
\y_r[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => in5(0),
      I1 => state_r(1),
      O => \y_r[0]_i_1_n_0\
    );
\y_r[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[11]\,
      I1 => \y_r_reg_n_0_[11]\,
      O => \y_r[11]_i_2_n_0\
    );
\y_r[11]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[10]\,
      I1 => \y_r_reg_n_0_[10]\,
      O => \y_r[11]_i_3_n_0\
    );
\y_r[11]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[9]\,
      I1 => \y_r_reg_n_0_[9]\,
      O => \y_r[11]_i_4_n_0\
    );
\y_r[11]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[8]\,
      I1 => \y_r_reg_n_0_[8]\,
      O => \y_r[11]_i_5_n_0\
    );
\y_r[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[15]\,
      I1 => \y_r_reg_n_0_[15]\,
      O => \y_r[15]_i_2_n_0\
    );
\y_r[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[14]\,
      I1 => \y_r_reg_n_0_[14]\,
      O => \y_r[15]_i_3_n_0\
    );
\y_r[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[13]\,
      I1 => \y_r_reg_n_0_[13]\,
      O => \y_r[15]_i_4_n_0\
    );
\y_r[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[12]\,
      I1 => \y_r_reg_n_0_[12]\,
      O => \y_r[15]_i_5_n_0\
    );
\y_r[19]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[19]\,
      I1 => \y_r_reg_n_0_[19]\,
      O => \y_r[19]_i_2_n_0\
    );
\y_r[19]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[18]\,
      I1 => \y_r_reg_n_0_[18]\,
      O => \y_r[19]_i_3_n_0\
    );
\y_r[19]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[17]\,
      I1 => \y_r_reg_n_0_[17]\,
      O => \y_r[19]_i_4_n_0\
    );
\y_r[19]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[16]\,
      I1 => \y_r_reg_n_0_[16]\,
      O => \y_r[19]_i_5_n_0\
    );
\y_r[23]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[23]\,
      I1 => \y_r_reg_n_0_[23]\,
      O => \y_r[23]_i_2_n_0\
    );
\y_r[23]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[22]\,
      I1 => \y_r_reg_n_0_[22]\,
      O => \y_r[23]_i_3_n_0\
    );
\y_r[23]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[21]\,
      I1 => \y_r_reg_n_0_[21]\,
      O => \y_r[23]_i_4_n_0\
    );
\y_r[23]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[20]\,
      I1 => \y_r_reg_n_0_[20]\,
      O => \y_r[23]_i_5_n_0\
    );
\y_r[27]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[27]\,
      I1 => \y_r_reg_n_0_[27]\,
      O => \y_r[27]_i_2_n_0\
    );
\y_r[27]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[26]\,
      I1 => \y_r_reg_n_0_[26]\,
      O => \y_r[27]_i_3_n_0\
    );
\y_r[27]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[25]\,
      I1 => \y_r_reg_n_0_[25]\,
      O => \y_r[27]_i_4_n_0\
    );
\y_r[27]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[24]\,
      I1 => \y_r_reg_n_0_[24]\,
      O => \y_r[27]_i_5_n_0\
    );
\y_r[31]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \y_r_reg_n_0_[31]\,
      I1 => \x_r_reg_n_0_[31]\,
      O => \y_r[31]_i_2_n_0\
    );
\y_r[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[30]\,
      I1 => \y_r_reg_n_0_[30]\,
      O => \y_r[31]_i_3_n_0\
    );
\y_r[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[29]\,
      I1 => \y_r_reg_n_0_[29]\,
      O => \y_r[31]_i_4_n_0\
    );
\y_r[31]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[28]\,
      I1 => \y_r_reg_n_0_[28]\,
      O => \y_r[31]_i_5_n_0\
    );
\y_r[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[3]\,
      I1 => \y_r_reg_n_0_[3]\,
      O => \y_r[3]_i_2_n_0\
    );
\y_r[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[2]\,
      I1 => \y_r_reg_n_0_[2]\,
      O => \y_r[3]_i_3_n_0\
    );
\y_r[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[1]\,
      I1 => \y_r_reg_n_0_[1]\,
      O => \y_r[3]_i_4_n_0\
    );
\y_r[3]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[0]\,
      I1 => \y_r_reg_n_0_[0]\,
      O => \y_r[3]_i_5_n_0\
    );
\y_r[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[7]\,
      I1 => \y_r_reg_n_0_[7]\,
      O => \y_r[7]_i_2_n_0\
    );
\y_r[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[6]\,
      I1 => \y_r_reg_n_0_[6]\,
      O => \y_r[7]_i_3_n_0\
    );
\y_r[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[5]\,
      I1 => \y_r_reg_n_0_[5]\,
      O => \y_r[7]_i_4_n_0\
    );
\y_r[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \x_r_reg_n_0_[4]\,
      I1 => \y_r_reg_n_0_[4]\,
      O => \y_r[7]_i_5_n_0\
    );
\y_r_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => \y_r[0]_i_1_n_0\,
      Q => \y_r_reg_n_0_[0]\,
      R => '0'
    );
\y_r_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(10),
      Q => \y_r_reg_n_0_[10]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(11),
      Q => \y_r_reg_n_0_[11]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[11]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[7]_i_1_n_0\,
      CO(3) => \y_r_reg[11]_i_1_n_0\,
      CO(2) => \y_r_reg[11]_i_1_n_1\,
      CO(1) => \y_r_reg[11]_i_1_n_2\,
      CO(0) => \y_r_reg[11]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[11]\,
      DI(2) => \x_r_reg_n_0_[10]\,
      DI(1) => \x_r_reg_n_0_[9]\,
      DI(0) => \x_r_reg_n_0_[8]\,
      O(3 downto 0) => in5(11 downto 8),
      S(3) => \y_r[11]_i_2_n_0\,
      S(2) => \y_r[11]_i_3_n_0\,
      S(1) => \y_r[11]_i_4_n_0\,
      S(0) => \y_r[11]_i_5_n_0\
    );
\y_r_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(12),
      Q => \y_r_reg_n_0_[12]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(13),
      Q => \y_r_reg_n_0_[13]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(14),
      Q => \y_r_reg_n_0_[14]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(15),
      Q => \y_r_reg_n_0_[15]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[15]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[11]_i_1_n_0\,
      CO(3) => \y_r_reg[15]_i_1_n_0\,
      CO(2) => \y_r_reg[15]_i_1_n_1\,
      CO(1) => \y_r_reg[15]_i_1_n_2\,
      CO(0) => \y_r_reg[15]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[15]\,
      DI(2) => \x_r_reg_n_0_[14]\,
      DI(1) => \x_r_reg_n_0_[13]\,
      DI(0) => \x_r_reg_n_0_[12]\,
      O(3 downto 0) => in5(15 downto 12),
      S(3) => \y_r[15]_i_2_n_0\,
      S(2) => \y_r[15]_i_3_n_0\,
      S(1) => \y_r[15]_i_4_n_0\,
      S(0) => \y_r[15]_i_5_n_0\
    );
\y_r_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(16),
      Q => \y_r_reg_n_0_[16]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(17),
      Q => \y_r_reg_n_0_[17]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(18),
      Q => \y_r_reg_n_0_[18]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(19),
      Q => \y_r_reg_n_0_[19]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[19]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[15]_i_1_n_0\,
      CO(3) => \y_r_reg[19]_i_1_n_0\,
      CO(2) => \y_r_reg[19]_i_1_n_1\,
      CO(1) => \y_r_reg[19]_i_1_n_2\,
      CO(0) => \y_r_reg[19]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[19]\,
      DI(2) => \x_r_reg_n_0_[18]\,
      DI(1) => \x_r_reg_n_0_[17]\,
      DI(0) => \x_r_reg_n_0_[16]\,
      O(3 downto 0) => in5(19 downto 16),
      S(3) => \y_r[19]_i_2_n_0\,
      S(2) => \y_r[19]_i_3_n_0\,
      S(1) => \y_r[19]_i_4_n_0\,
      S(0) => \y_r[19]_i_5_n_0\
    );
\y_r_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(1),
      Q => \y_r_reg_n_0_[1]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(20),
      Q => \y_r_reg_n_0_[20]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(21),
      Q => \y_r_reg_n_0_[21]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(22),
      Q => \y_r_reg_n_0_[22]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(23),
      Q => \y_r_reg_n_0_[23]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[23]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[19]_i_1_n_0\,
      CO(3) => \y_r_reg[23]_i_1_n_0\,
      CO(2) => \y_r_reg[23]_i_1_n_1\,
      CO(1) => \y_r_reg[23]_i_1_n_2\,
      CO(0) => \y_r_reg[23]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[23]\,
      DI(2) => \x_r_reg_n_0_[22]\,
      DI(1) => \x_r_reg_n_0_[21]\,
      DI(0) => \x_r_reg_n_0_[20]\,
      O(3 downto 0) => in5(23 downto 20),
      S(3) => \y_r[23]_i_2_n_0\,
      S(2) => \y_r[23]_i_3_n_0\,
      S(1) => \y_r[23]_i_4_n_0\,
      S(0) => \y_r[23]_i_5_n_0\
    );
\y_r_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(24),
      Q => \y_r_reg_n_0_[24]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(25),
      Q => \y_r_reg_n_0_[25]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(26),
      Q => \y_r_reg_n_0_[26]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(27),
      Q => \y_r_reg_n_0_[27]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[27]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[23]_i_1_n_0\,
      CO(3) => \y_r_reg[27]_i_1_n_0\,
      CO(2) => \y_r_reg[27]_i_1_n_1\,
      CO(1) => \y_r_reg[27]_i_1_n_2\,
      CO(0) => \y_r_reg[27]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[27]\,
      DI(2) => \x_r_reg_n_0_[26]\,
      DI(1) => \x_r_reg_n_0_[25]\,
      DI(0) => \x_r_reg_n_0_[24]\,
      O(3 downto 0) => in5(27 downto 24),
      S(3) => \y_r[27]_i_2_n_0\,
      S(2) => \y_r[27]_i_3_n_0\,
      S(1) => \y_r[27]_i_4_n_0\,
      S(0) => \y_r[27]_i_5_n_0\
    );
\y_r_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(28),
      Q => \y_r_reg_n_0_[28]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(29),
      Q => \y_r_reg_n_0_[29]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(2),
      Q => \y_r_reg_n_0_[2]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(30),
      Q => \y_r_reg_n_0_[30]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(31),
      Q => \y_r_reg_n_0_[31]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[31]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[27]_i_1_n_0\,
      CO(3) => \NLW_y_r_reg[31]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \y_r_reg[31]_i_1_n_1\,
      CO(1) => \y_r_reg[31]_i_1_n_2\,
      CO(0) => \y_r_reg[31]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => \x_r_reg_n_0_[30]\,
      DI(1) => \x_r_reg_n_0_[29]\,
      DI(0) => \x_r_reg_n_0_[28]\,
      O(3 downto 0) => in5(31 downto 28),
      S(3) => \y_r[31]_i_2_n_0\,
      S(2) => \y_r[31]_i_3_n_0\,
      S(1) => \y_r[31]_i_4_n_0\,
      S(0) => \y_r[31]_i_5_n_0\
    );
\y_r_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(3),
      Q => \y_r_reg_n_0_[3]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[3]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \y_r_reg[3]_i_1_n_0\,
      CO(2) => \y_r_reg[3]_i_1_n_1\,
      CO(1) => \y_r_reg[3]_i_1_n_2\,
      CO(0) => \y_r_reg[3]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[3]\,
      DI(2) => \x_r_reg_n_0_[2]\,
      DI(1) => \x_r_reg_n_0_[1]\,
      DI(0) => \x_r_reg_n_0_[0]\,
      O(3 downto 0) => in5(3 downto 0),
      S(3) => \y_r[3]_i_2_n_0\,
      S(2) => \y_r[3]_i_3_n_0\,
      S(1) => \y_r[3]_i_4_n_0\,
      S(0) => \y_r[3]_i_5_n_0\
    );
\y_r_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(4),
      Q => \y_r_reg_n_0_[4]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(5),
      Q => \y_r_reg_n_0_[5]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(6),
      Q => \y_r_reg_n_0_[6]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(7),
      Q => \y_r_reg_n_0_[7]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[7]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \y_r_reg[3]_i_1_n_0\,
      CO(3) => \y_r_reg[7]_i_1_n_0\,
      CO(2) => \y_r_reg[7]_i_1_n_1\,
      CO(1) => \y_r_reg[7]_i_1_n_2\,
      CO(0) => \y_r_reg[7]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \x_r_reg_n_0_[7]\,
      DI(2) => \x_r_reg_n_0_[6]\,
      DI(1) => \x_r_reg_n_0_[5]\,
      DI(0) => \x_r_reg_n_0_[4]\,
      O(3 downto 0) => in5(7 downto 4),
      S(3) => \y_r[7]_i_2_n_0\,
      S(2) => \y_r[7]_i_3_n_0\,
      S(1) => \y_r[7]_i_4_n_0\,
      S(0) => \y_r[7]_i_5_n_0\
    );
\y_r_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(8),
      Q => \y_r_reg_n_0_[8]\,
      R => \i_r[0]_i_1_n_0\
    );
\y_r_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => x_r0,
      D => in5(9),
      Q => \y_r_reg_n_0_[9]\,
      R => \i_r[0]_i_1_n_0\
    );
end STRUCTURE;
