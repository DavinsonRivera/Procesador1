----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:26 04/16/2018 
-- Design Name: 
-- Module Name:    UndExt - Behavioral 
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

entity UndExt is
    Port ( Inm : in  STD_LOGIC_VECTOR (12 downto 0);
           OutInm : out  STD_LOGIC_VECTOR (31 downto 0));
end UndExt;

architecture Behavioral of UndExt is

begin

   process(Inm)
	begin
			if(Inm (12) = '1')then
				OutInm(12 downto 0) <= Inm;
				OutInm(31 downto 13) <= (others=>'1');
			else
				OutInm(12 downto 0) <= Inm;
				OutInm(31 downto 13) <= (others=>'0');
			end if;
	end process;

end Behavioral;

