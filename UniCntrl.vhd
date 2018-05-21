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
			when "000000" => OutAlu <="000000";--suma
			when "000100" => OutAlu <="000001";--resta
			when "000001" => OutAlu <="000010";--And
			when "000101" => OutAlu <="000011";--Nand
			when "000010" => OutAlu <="000100";--Or
			when "000110" => OutAlu <="000101";--Nor
			when "000011" => OutAlu <="000110";--Xor
			when "000111" => OutAlu <="000111";--Xnor
			when "010000" => OutAlu <="001000";--ADDcc
			when "001000" => OutAlu <="001001";--ADDx
			when "011000" => OutAlu <="001010";--ADDXcc
			when "010100" => OutAlu <="001011";--SUBcc
			when "001100" => OutAlu <="001100";--SUBx
			when "011100" => OutAlu <="001101";--SUBccx
			when "010001" => OutAlu <="001110";--andcc
			when "010101" => OutAlu <="001111";--andncc
			when "010010" => OutAlu <="010000";--orcc
			when "010011" => OutAlu <="010001";--xorcc
			when "010111" => OutAlu <="010010";--xnorcc
			when "010110" => OutAlu <="010011";--orncc
			when others => OutAlu <= "111111";
		end case;
	end if;
end process;

end Behavioral;

