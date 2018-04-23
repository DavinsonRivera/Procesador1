----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:21 04/16/2018 
-- Design Name: 
-- Module Name:    MuPlx - Behavioral 
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

entity MuPlx is
    Port ( I : in  STD_LOGIC;
           Opr2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Inm : in  STD_LOGIC_VECTOR (31 downto 0);
           OutMpx : out  STD_LOGIC_VECTOR (31 downto 0));
end MuPlx;

architecture Behavioral of MuPlx is

begin
   
	process(I, Opr2, Inm)
	begin
			if(I = '1')then
				OutMpx <= Inm;
			else
				OutMpx <= Opr2;
			end if;
	end process;

end Behavioral;

