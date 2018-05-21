----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:53 04/29/2018 
-- Design Name: 
-- Module Name:    PsrMdf - Behavioral 
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

entity PsrMdf is
    Port ( RegfOut : in  STD_LOGIC_VECTOR (31 downto 0);
           Mpx : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOut : in  STD_LOGIC_VECTOR (31 downto 0);
           UcOut : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PsrMdf;

architecture Behavioral of PsrMdf is

begin
    process (RegfOut, Mpx, AluOut, UcOut)
        begin
-------------------SUMA------------------------
	if(UcOut="001000" or UcOut="001010")then
		nzvc(3)<=AluOut(31); 
      if(AluOut=x"00000000")then
			nzvc(2)<='1';
		else
			nzvc(2)<='0';
		end if;
		nzvc(1)<=(RegfOut(31) and Mpx(31) and (not AluOut(31))) or((not RegfOut(31)) and (not Mpx(31)) and AluOut(31));
		nzvc(0)<=(RegfOut(31) and Mpx(31)) or (not(AluOut(31)) and (RegfOut(31) or Mpx(31)));
	end if;
	
------------------RESTA------------------------
	if(UcOut="001011" or UcOut="001101")then
		nzvc(3)<=AluOut(31);
		if(AluOut=x"00000000")then
			nzvc(2)<='1';
		else
			nzvc(2)<='0';
		end if;
		nzvc(1)<=(RegfOut(31) and (not Mpx(31)) and (not AluOut(31))) or((not RegfOut(31)) and Mpx(31) and AluOut(31));
		nzvc(0)<=((not RegfOut(31)) and Mpx(31)) or(AluOut(31) and ((not RegfOut(31)) or Mpx(31))); 
	end if;
----------------ANDcc,ORcc----------------------
	if ((UcOut="001110") or (UcOut="001111") or (UcOut="010000") or (UcOut="010001") or (UcOut="010010") or (UcOut="010011")) then
		nzvc(3) <= AluOut(31);
		if (AluOut = x"00000000") then
			nzvc(2) <= '1';
		else
			nzvc(2) <= '0';
		end if;
		nzvc(1) <= '0';
		nzvc(0) <= '0';
	end if;
                
    end process;


end Behavioral;

