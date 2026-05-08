library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
 
 signal program_ROM : rom_type := (
       -- "100000000001", -- 0
       -- "100010000010", --1
       -- "010100000011", --2
       -- "001110000000", --3
        --"001110010000", --4
        --"001110100000",--5
        --"001110110000", --6
        --"110000000111" --7
                   "100010000001",  --MOVI R1,1
                   "100100000010", --MOVI R2,2
                   "100110000011", --MOVI R3,3
                   "101110000000", --MOVI R7,0 
                   "001110010000", --ADD R7,R1
                   "001110100000", --ADD R7,R2
                   "001110110000", --ADD R7,R3
                   "010010100000",   -- 7: MUL  R1, R2  → 3x3 = 9 in R1
                   "110000000111"  --JZR R0,7

 );
begin
data <= program_ROM(to_integer(unsigned(address)));

end Behavioral;
