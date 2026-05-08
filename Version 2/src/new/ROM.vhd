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
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);   -- 3?4 bits
       data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 11) of std_logic_vector(11 downto 0);

signal program_ROM : rom_type := (
            

                "100010000001",  -- 0: MOVI R1, 1
               "100100000010",  -- 1: MOVI R2, 2
               "100110000011",  -- 2: MOVI R3, 3
               "101110000000",  -- 3: MOVI R7, 0
               "001110010000",  -- 4: ADD  R7, R1
               "001110100000",  -- 5: ADD  R7, R2
               "001110110000",  -- 6: ADD  R7, R3 ? R7=6
               "101110000001",  -- 3: MOVI R7, 1
               "100100000011",  -- 1: MOVI R2, 3
               "010110100000",  -- 7: MUL  R3, R2 ? 3x3=9 in R1
               "011110110000",  --R7 and R3 mulipli
               "110000001011"  --JZR R0,11
);


begin
data <= program_ROM(to_integer(unsigned(address)));

end Behavioral;
