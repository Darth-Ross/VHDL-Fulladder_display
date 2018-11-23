----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.11.2018 13:40:50
-- Design Name: 
-- Module Name: fourbits_adder - Behavioral
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

entity fourbits_adder is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
   
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
         
           C_out3 : out STD_LOGIC);          
end fourbits_adder;

architecture Behavioral of fourbits_adder is

component fulladder is 
Port ( A : in STD_LOGIC;      
       B : in STD_LOGIC;      
       C_in : in STD_LOGIC;   
       S : out STD_LOGIC;     
       C_out : out STD_LOGIC);
end component;

signal C0, C1, C2: STD_LOGIC;

begin
FA0: fulladder port map (
    A => A0,
    B => B0,
    C_in => '0',
    S => S0,
    C_out => C0);

FA1: fulladder port map (
    A => A1,
    B => B1,
    C_in => C0,
    S => S1,
    C_out => C1);
    
FA2: fulladder port map (
    A => A2,
    B => B2,
    C_in => C1,
    S => S2,
    C_out => C2);

FA3: fulladder port map (
    A => A3,
    B => B3,
    C_in => C2,
    S => S3,
    C_out => C_out3);
end Behavioral;
