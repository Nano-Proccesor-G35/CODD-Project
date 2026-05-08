----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: 240549F
-- 
-- Create Date: 05/08/2026 04:21:09 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
-- Project Name: NanoProcessor
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Instruction_Decoder is
   Port ( data : in STD_LOGIC_VECTOR (11 downto 0);
        Reg_check_jump : in STD_LOGIC_VECTOR(3 downto 0);
        Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
        Reg_Sel_A : out STD_LOGIC_VECTOR (2 downto 0);
        Load_sel : out STD_LOGIC;
        Immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
        Reg_Sel_B : out STD_LOGIC_VECTOR (2 downto 0);
        Add_Sub_Sel : out STD_LOGIC_VECTOR(1 downto 0);
        Jump_Flag : out STD_LOGIC;
        Address_To_Jump : out STD_LOGIC_VECTOR (2 downto 0);
        --CMP_En : out STD_LOGIC;
        MuL_Sel : out STD_LOGIC);  --this is for mutiplication selection
    
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

 Reg_En <= data(9 downto 7);
 Reg_Sel_A <= data(9 downto 7);
 Reg_Sel_B <=  data(6 downto 4);
 
 Load_Sel <= data(11)and not(data(10));
 Immediate_val <= data(3 downto 0);
 
 Add_Sub_Sel <= data(11 downto 10);
 
 Jump_Flag <= NOT( Reg_check_jump(0) Or  Reg_check_jump(1) OR Reg_check_jump(2) OR Reg_check_jump(3)) AND data(11) AND data(10);
 
 Address_To_Jump <= data(2 downto 0);

 --CMP_En <= (NOT data(11)) AND data(10) AND (NOT data(9)) AND (NOT data(8)) AND (NOT data(7));-- this is for comparator 01 000 RRR 0000
 MuL_Sel <= (NOT data(11)) AND data(10) AND (data(9) OR data(8) OR data(7));  --this is for multiplication 

end Behavioral;
