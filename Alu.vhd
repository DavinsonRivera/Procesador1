----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:29 04/09/2018 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; 


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( InDat1 : in  STD_LOGIC_VECTOR (31 downto 0);
           InDat2 : in  STD_LOGIC_VECTOR (31 downto 0);
           InInstrcUC : in  STD_LOGIC_VECTOR (5 downto 0);
			  C : in STD_LOGIC;
           OutDatRF : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin

process(InInstrcUC, InDat1, InDat2)
begin
	case InInstrcUC is 
		when "000000" => OutDatRF <= InDat1 + InDat2;
		when "000001" => OutDatRF <= InDat1 - InDat2;
		when "000010" => OutDatRF <= InDat1 and InDat2;
		when "000011" => OutDatRF <= InDat1 and not InDat2;
		when "000100" => OutDatRF <= InDat1 or InDat2;
		when "000101" => OutDatRF <= InDat1 or not InDat2;
		when "000110" => OutDatRF <= InDat1 xor InDat2;
		when "000111" => OutDatRF <= InDat1 xnor InDat2;
		when "001000" => OutDatRF <= InDat1 + InDat2;--addcc
		when "001001" => OutDatRF <= InDat1 + InDat2 + c;--addx
		when "001010" => OutDatRF <= InDat1 + InDat2 + c;--addxcc
		when "001011" => OutDatRF <= InDat1 - InDat2 ;--subcc
		when "001100" => OutDatRF <= InDat1 - InDat2 - c ;--subx
		when "001101" => OutDatRF <= InDat1 - InDat2 - c ;--subxcc
		when "001110" => OutDatRF <= InDat1 and InDat2;--andcc
		when "001111" => OutDatRF <= InDat1 nand InDat2;--andncc			
		when "010000" => OutDatRF <= InDat1 or InDat2;--orcc
		when "010001" => OutDatRF <= InDat1 xor InDat2;--xorcc
		when "010010" => OutDatRF <= InDat1 xnor InDat2;--xnorcc
		when "010011" => OutDatRF <= InDat1 nor InDat2;--orncc
		when others => OutDatRF <= x"00000000";
	end case;
end process;

end Behavioral;

