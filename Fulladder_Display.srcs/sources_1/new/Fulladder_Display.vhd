----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2018 18:22:06
-- Design Name: 
-- Module Name: Fulladder_Display - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fulladder_Display is
    Port(   A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);      
			CLK : in STD_LOGIC;
            
            Display_Output : out STD_LOGIC_VECTOR(6 downto 0);
            Display_select : out STD_LOGIC_VECTOR(3 downto 0));           
end Fulladder_Display;

architecture Behavioral of Fulladder_Display is
    
    signal S : STD_LOGIC_VECTOR(4 downto 0);
    signal BCD_O, BCD_TE, BCD_H, BCD_Th : STD_LOGIC_VECTOR(3 downto 0);
	signal a0, b0, c0, d0, e0, f0, g0 : STD_LOGIC;
	signal a1, b1, c1, d1, e1, f1, g1 : STD_LOGIC;
	signal a2, b2, c2, d2, e2, f2, g2 : STD_LOGIC;
	signal a3, b3, c3, d3, e3, f3, g3 : STD_LOGIC;
    
begin

    FBA: entity work.fourbits_adder(Behavioral)
        port map(   A0 => A(0),
                    A1 => A(1),
                    A2 => A(2),
                    A3 => A(3),
                    B0 => B(0),
                    B1 => B(1),
                    B2 => B(2),
                    B3 => B(3),
       
                    S0  => S(0),
                    S1 => S(1),
                    S2 => S(2),
                    S3 => S(3),
                    C_out3  => S(4));
                    
    BtoBCD : entity work.BintoBCD(Behavioral)
        port map(   Bin_In(4 downto 0) => S,
                    Bin_in(13 downto 5) => (others => '0'),
                    CLK_IN => CLK,
					
					BCD_Ones => BCD_O,
					BCD_Tens => BCD_TE,
					BCD_Hundreds => BCD_H,
					BCD_Thousands => BCD_Th);
					
	BCDto7SEG0 : entity work.BCDto7SEG(Behavioral)
		port map(	CA => a0,
					CB => b0,
					CC => c0,
					CD => d0,
					CE => e0,
					CF => f0,
					CG => g0,
        
					A => BCD_O(0),
					B => BCD_O(1),
					C => BCD_O(2),
					D => BCD_O(3));
					
	BCDto7SEG1 : entity work.BCDto7SEG(Behavioral)
		port map(	CA => a1,
					CB => b1,
					CC => c1,
					CD => d1,
					CE => e1,
					CF => f1,
					CG => g1,
        
					A => BCD_TE(0),
					B => BCD_TE(1),
					C => BCD_TE(2),
					D => BCD_TE(3));
	
	BCDto7SEG2 : entity work.BCDto7SEG(Behavioral)
		port map(	CA => a2,
					CB => b2,
					CC => c2,
					CD => d2,
					CE => e2,
					CF => f2,
					CG => g2,
        
					A => BCD_H(0),
					B => BCD_H(1),
					C => BCD_H(2),
					D => BCD_H(3));
                    
    BCDto7SEG3 : entity work.BCDto7SEG(Behavioral)
		port map(	CA => a3,
					CB => b3,
					CC => c3,
					CD => d3,
					CE => e3,
					CF => f3,
					CG => g3,
        
					A => BCD_TH(0),
					B => BCD_TH(1),
					C => BCD_TH(2),
					D => BCD_TH(3));   
        
    Display_D : entity work.DisplayDriver(Behavioral)
		port map(	AN(0) => Display_select(0),
					AN(1) => Display_select(1),
					AN(2) => Display_select(2),
					AN(3) => Display_select(3),
					
					Display_Out(0) => Display_Output(0),
					Display_Out(1) => Display_Output(1),
					Display_Out(2) => Display_Output(2),
					Display_Out(3) => Display_Output(3),
					Display_Out(4) => Display_Output(4),
					Display_Out(5) => Display_Output(5),
					Display_Out(6) => Display_Output(6),
					
					Display_IN0(0) => a0,
					Display_IN0(1) => b0,
					Display_IN0(2) => c0,
					Display_IN0(3) => d0,
					Display_IN0(4) => e0,
					Display_IN0(5) => f0,
					Display_IN0(6) => g0,
					
					Display_IN1(0) => a1,
					Display_IN1(1) => b1,
					Display_IN1(2) => c1,
					Display_IN1(3) => d1,
					Display_IN1(4) => e1,
					Display_IN1(5) => f1,
					Display_IN1(6) => g1,
					
					Display_IN2(0) => a2,
					Display_IN2(1) => b2,
					Display_IN2(2) => c2,
					Display_IN2(3) => d2,
					Display_IN2(4) => e2,
					Display_IN2(5) => f2,
					Display_IN2(6) => g2,
					
					Display_IN3(0) => a3,
					Display_IN3(1) => b3,
					Display_IN3(2) => c3,
					Display_IN3(3) => d3,
					Display_IN3(4) => e3,
					Display_IN3(5) => f3,
					Display_IN3(6) => g3,
			
					CLK_IN => CLK);
end Behavioral;
