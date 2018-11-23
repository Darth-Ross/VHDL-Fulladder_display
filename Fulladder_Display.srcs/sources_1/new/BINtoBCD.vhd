----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2018 22:57:29
-- Design Name: 
-- Module Name: BintoBCD - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BintoBCD is
    Port  (	BIN_in : IN STD_LOGIC_VECTOR (13 downto 0);
            CLK_IN : IN STD_LOGIC;
	
			BCD_Ones : OUT STD_LOGIC_VECTOR (3 downto 0);
			BCD_Tens : OUT STD_LOGIC_VECTOR (3 downto 0);	
			BCD_Hundreds : OUT  STD_LOGIC_VECTOR (3 downto 0);
			BCD_Thousands : OUT STD_LOGIC_VECTOR (3 downto 0)
		  );
     
end BintoBCD;

architecture Behavioral of BintoBCD is

begin
	BCD_Conversion : process (BIN_in, CLK_IN) 
        variable BCD : Unsigned (15 downto 0) := (others => '0');
        Variable Bin_Temp : STD_LOGIC_VECTOR(13 downto 0); 
        
        
	begin 
	
		BCD := (others => '0');
		Bin_Temp (13 downto 0) := BIN_in;
		
		      if rising_edge(CLK_IN) then
                    if BCD (3 downto 0) > 4 then
                        BCD(3 downto 0):= BCD(3 downto 0) + 3;
                    end if;
                    
                    if BCD (7 downto 4) > 4 then
                        BCD(7 downto 4) := BCD(7 downto 4) + 3;
                    end if;
                    
                    if BCD (11 downto 8) > 4 then
                        BCD(11 downto 8) := BCD(11 downto 8) + 3;
                    end if;
                    
                    if BCD (15 downto 12) > 4 then
                        BCD(15 downto 12) := BCD(15 downto 12) + 3;
                    end if;
                    
                    BCD := BCD(14 downto 0) &  Bin_Temp(13); 
                    Bin_Temp := Bin_Temp(12 downto 0) & '0';
                    
              end if;
              
                BCD_Ones <= STD_LOGIC_VECTOR(BCD(3 downto 0));
                BCD_Tens <= STD_LOGIC_VECTOR(BCD(7 downto 4));
                BCD_Hundreds <= STD_LOGIC_VECTOR(BCD(11 downto 8));
                BCD_Thousands <= STD_LOGIC_VECTOR(BCD(15 downto 12));
                
	end process BCD_Conversion;
	
end Behavioral;
