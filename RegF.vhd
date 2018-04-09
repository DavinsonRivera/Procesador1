----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:00 04/06/2018 
-- Design Name: 
-- Module Name:    RegF - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegF is
    Port ( InReg1 : in  STD_LOGIC_VECTOR (4 downto 0);
           InReg2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RegD : in  STD_LOGIC_VECTOR (4 downto 0);
           reset : in  STD_LOGIC;
           DatOutAlu : in  STD_LOGIC_VECTOR (31 downto 0);
           Out1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Out2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegF;

architecture Behavioral of RegF is

   type rom_type is array (31 downto 0) of std_logic_vector (31 downto 0);
   signal Regtr : rom_type := ( 		x"00000000",
							   				x"00000000",
								   			x"00000000",
									   		x"00000000",
										   	x"00000000",
							   				x"00000000",
								   			x"00000000",
									   		x"00000000",
										   	x"00000000",
					   						x"00000000",
						   					x"00000000",
							   				x"00000000",
								   			x"00000000",
									   		x"00000000",
										   	x"0000000C",
					   						x"0000000B",
						   					x"00000000",
							   				x"00000000",
								   			x"00000000",
									   		x"00000000",
										   	x"00000000",
											   x"00000000",
				   							x"00000000",
					   						x"00000000",
						   					x"00000000",
							   				x"00000000",
					   						x"00000000",
						   					x"0000000a",
							   				x"00000000",
								   			x"00000000",
									   		x"00000000",
										   	x"00000000"
							   				);

begin

   process(reset,InReg1,InReg2,RegD,DatOutAlu)
	begin
	
			if(reset = '1')then
				Out1 <= (others=>'0');
				Out2 <= (others=>'0');

				Regtr <= (others => x"00000000");
			else
				Out1 <= Regtr(conv_integer(InReg1));
				Out2 <= Regtr(conv_integer(InReg2));
				if(RegD /= "000000")then
					Regtr(conv_integer(RegD)) <= DatOutAlu;
				end if;
			end if;
	end process;

end Behavioral;

