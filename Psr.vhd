----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:45:03 04/30/2018 
-- Design Name: 
-- Module Name:    Psr - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Psr is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC;
           clk : in  STD_LOGIC;
			  CwpIn: in STD_LOGIC_VECTOR (1 downto 0);
			  CwpOut: out STD_LOGIC_VECTOR (1 downto 0);
           reset : in  STD_LOGIC);
end Psr;

architecture Behavioral of Psr is

begin
process(reset,nzvc,CwpIn)
begin
   if(reset='1')then
		
		C <= '0';
	else
		if(rising_edge(clk))then
			C <= nzvc(0);
		end if;
	end if;
end process;
   
CwpOut <= CwpIn;

end Behavioral;

