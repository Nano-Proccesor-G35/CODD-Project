----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2026 05:24:47 PM
-- Design Name: 
-- Module Name: Adder3bit - Behavioral
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

entity Adder3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end Adder3bit;

architecture Behavioral of Adder3bit is

-- This component declaration exactly matches your FA file
    component FA
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C_in : in STD_LOGIC;
               S : out STD_LOGIC;
               C_out : out STD_LOGIC);
    end component;

    -- Internal signal to pass the carry bit from one FA to the next
    signal C : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- The initial carry-in is hardcoded to '0' since this is used to increment the PC
    C(0) <= '0';

    -- Bit 0 (Least Significant Bit)
    FA0: FA port map (
        A     => A(0),
        B     => B(0),
        C_in  => C(0),
        S     => S(0),
        C_out => C(1)  -- Passes carry to FA1
    );

    -- Bit 1
    FA1: FA port map (
        A     => A(1),
        B     => B(1),
        C_in  => C(1),  -- Receives carry from FA0
        S     => S(1),
        C_out => C(2)  -- Passes carry to FA2
    );

    -- Bit 2 (Most Significant Bit)
    FA2: FA port map (
        A     => A(2),
        B     => B(2),
        C_in  => C(2),  -- Receives carry from FA1
        S     => S(2),
        C_out => C(3)  -- Final carry out
    );

    -- Connect the final carry to the output port
    Cout <= C(3);

end Behavioral;
