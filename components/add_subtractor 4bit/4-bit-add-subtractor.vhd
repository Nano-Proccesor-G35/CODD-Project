----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2026 03:36:05 PM
-- Design Name: 
-- Module Name: 4-bit-add-subtractor - Behavioral
-- Project Name: 
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

entity add_subtractor_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CTRL : in STD_LOGIC;  -- 0 for Add, 1 for Subtract
           S_AS : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end add_subtractor_4bit;

architecture Behavioral of add_subtractor_4bit is

    -- 1. COMPONENT DECLARATION (Essential since you are importing RCA_4)
    COMPONENT RCA_4
        PORT(
            A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            C_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL B_inter, S_inter: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

    -- 2. XOR LOGIC (Must happen before or during port map)
    B_inter(0) <= B(0) XOR CTRL; 
    B_inter(1) <= B(1) XOR CTRL;
    B_inter(2) <= B(2) XOR CTRL;
    B_inter(3) <= B(3) XOR CTRL;

    -- 3. PORT MAP (Fixed signal names to match entity Port)
    RCA_4_0 : RCA_4
        port map(
            A => A,           -- Changed from A_AS
            B => B_inter,
            C_in => CTRL,     -- CTRL acts as Cin (+1) for subtraction
            S => S_inter,
            C_out => OverFlow
        );

    -- 4. ZERO FLAG LOGIC
    Zero <= '1' when S_inter = "0000" else '0';

    S_AS <= S_inter;

end Behavioral;