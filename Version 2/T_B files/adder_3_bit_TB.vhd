----------------------------------------------------------------------------------
-- Company: UOM CSE
-- Engineer: 240549F
-- 
-- Create Date: 05/07/2026 04:00:19 AM
-- Design Name: 
-- Module Name: adder_3_bit_TB - Behavioral
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

entity adder_3_bit_TB is
--  Port ( );
end adder_3_bit_TB;

architecture Behavioral of adder_3_bit_TB is

component adder_3_bit port(
          A : in STD_LOGIC_Vector(2 downto 0);
           S : out STD_LOGIC_vector(2 downto 0));
end component;

SIGNAL A,S : STD_LOGIC_VECTOR(2 downto 0);

begin
UUT : adder_3_bit port map(
        A => A,
        S => S
);

process
begin 

--INDEX 240549F (G35)   111 010 101 111 100 101

A <="101"; --last 3 of index
wait for 100ns;

A <="100"; --next last 3 of index
wait for 100ns;

A <="001";
wait for 100ns;

A <="010";
wait for 100ns;

A <="011";
wait for 100ns;

A <="010";
wait for 100ns;

A <="011";
wait for 100ns;

A <="011";
wait for 100ns;

A <="111";
wait;

end process;

end Behavioral;
