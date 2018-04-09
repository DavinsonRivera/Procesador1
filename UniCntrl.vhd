----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:47 04/09/2018 
-- Design Name: 
-- Module Name:    UniCntrl - Behavioral 
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

entity UniCntrl is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           OutAlu : out  STD_LOGIC_VECTOR (5 downto 0));
end UniCntrl;

architecture Behavioral of UniCntrl is

begin

process(OP, OP3)
begin
	if(OP="10")then
		case OP3 is
			when "000000" => OutAlu <= OP3;
			when "000100" => OutAlu <= OP3;
			when "000001" => OutAlu <= OP3;
			when "000101" => OutAlu <= OP3;
			when "000010" => OutAlu <= OP3;
			when "000110" => OutAlu <= OP3;
			when "000011" => OutAlu <= OP3;
			when "000111" => OutAlu <= OP3;
			when others => OutAlu <= "111111";
		end case;
	end if;
end process;

end Behavioral;

