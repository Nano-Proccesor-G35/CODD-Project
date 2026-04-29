
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is

COMPONENT Multiplier_4
    PORT  (
        A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );
 END COMPONENT;
 
 SIGNAL A,B : STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL Y: STD_LOGIC_VECTOR(7 DOWNTO 0);
 

begin
UUT : Multiplier_4 PORT MAP (
    A=>A,
    B=>B,
    Y=>Y);
    
PROCESS BEGIN
    
    A<="1010";
    B<="1001";

    WAIT FOR 100ns;

    A<="0011";

    WAIT FOR 100ns;

    B<="0001";

    WAIT FOR 100ns;

    A<="0111";

    WAIT FOR 100ns;

    B<="0110";

    WAIT FOR 100ns;

    A<="1011";

    WAIT FOR 100ns;

    B<="1010";

    WAIT FOR 100ns;

    A<="1111";

    WAIT FOR 100ns;

    B<="1101";

    WAIT FOR 100ns;

    B<="1111";

    WAIT;

END PROCESS;

end Behavioral;
