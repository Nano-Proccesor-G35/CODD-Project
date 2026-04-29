library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); -- Changed to Vector [cite: 1]
           B : in STD_LOGIC_VECTOR (3 downto 0); -- Changed to Vector [cite: 1]
           C_in : in STD_LOGIC;                  -- Carry-in for Add/Sub logic [cite: 1]
           S : out STD_LOGIC_VECTOR (3 downto 0);-- Changed to Vector [cite: 1]
           C_out : out STD_LOGIC); 
end RCA_4;

architecture Behavioral of RCA_4 is

    -- Component Declaration for your Full Adder
    component FA   
        port (   
            A: in std_logic;   
            B: in std_logic; 
            C_in: in std_logic;   
            S: out std_logic; 
            C_out: out std_logic);   
    end component; 
     
    -- Signals to carry the ripple effect between stages
    SIGNAL FA0_C, FA1_C, FA2_C : std_logic;

begin

    -- FA for Bit 0
    FA_0 : FA 
        port map (   
            A => A(0),   
            B => B(0),
            C_in => C_in, 
            S => S(0),   
            C_out => FA0_C);  
 
    -- FA for Bit 1
    FA_1 : FA 
        port map (   
            A => A(1),   
            B => B(1), 
            C_in => FA0_C,    
            S => S(1),   
            C_out => FA1_C); 
            
    -- FA for Bit 2
    FA_2 : FA 
         port map (   
             A => A(2),   
             B => B(2), 
             C_in => FA1_C,    
             S => S(2),   
             C_out => FA2_C); 
            
    -- FA for Bit 3
    FA_3 : FA 
           port map (   
               A => A(3),   
               B => B(3), 
               C_in => FA2_C,    
               S => S(3),   
               C_out => C_out); 

end Behavioral;