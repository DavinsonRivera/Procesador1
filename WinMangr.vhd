----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:42 05/10/2018 
-- Design Name: 
-- Module Name:    WinMangr - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WinMangr is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           RegF1In : in  STD_LOGIC_VECTOR (4 downto 0);
           RegF2In : in  STD_LOGIC_VECTOR (4 downto 0);
           RegDIn : in  STD_LOGIC_VECTOR (4 downto 0);
           CwpIn : in  STD_LOGIC_VECTOR (1 downto 0);
           CwpOut : out  STD_LOGIC_VECTOR (1 downto 0);
           RegF1Out : out  STD_LOGIC_VECTOR (5 downto 0);
           RegF2Out : out  STD_LOGIC_VECTOR (5 downto 0);
           RegDOut : out  STD_LOGIC_VECTOR (5 downto 0));
end WinMangr;

architecture Behavioral of WinMangr is

signal rs1t,rs2t,rdt: integer range 0 to 39:=0;

begin

process(CwpIn,Op,Op3,RegF1In,RegF2In,RegDIn)

	begin

--SAVE and RESTORE
----------------------------------------------------------------------
		if(Op = "10") then
			if(Op3 = "111100")then
				CwpOut<=conv_std_logic_vector(conv_integer(CwpIn) - 1,2);

			elsif(Op3 = "111101")then
				CwpOut<=conv_std_logic_vector(conv_integer(CwpIn)+ 1,2);
			end if;
		else
			CwpOut<=CwpIn;
		end if;
		
--REGISTROS
-----------------------------------------------------------------------
      --Bits 24 a 31 entrada
		if(RegF1In>="11000" and RegF1In<="11111") then
				rs1t <= conv_integer(RegF1In)-(conv_integer(CwpIn)*16);
		--Bits 16 a 23 local
		elsif(RegF1In>="10000" and RegF1In<="10111") then
				rs1t <= conv_integer(RegF1In)+(conv_integer(CwpIn)*16);
		--Bits 8 a 15 salida		
		elsif(RegF1In>="01000" and RegF1In<="01111") then
				rs1t <= conv_integer(RegF1In)+ (conv_integer(CwpIn)*16);
		--Bits 0 a 7 globales		
		elsif(RegF1In>="00000" and RegF1In<="00111") then
				rs1t <= conv_integer(RegF1In);
		end if;
		
		--Bits 24 a 31 entrada
		if(RegF2In>="11000" and RegF2In<="11111") then
				rs2t <= conv_integer(RegF2In)-(conv_integer(CwpIn)*16);
		--Bits 16 a 23 local		
		elsif(RegF2In>="10000" and RegF2In<="10111") then
				rs2t <= conv_integer(RegF2In)+(conv_integer(CwpIn)*16);
		--Bits 8 a 15 salida		
		elsif(RegF2In>="01000" and RegF2In<="01111") then
				rs2t <= conv_integer(RegF2In)+ (conv_integer(CwpIn)*16);
		--Bits 0 a 7 globales		
		elsif(RegF2In>="00000" and RegF2In<="00111") then
				rs2t <= conv_integer(RegF2In);
		end if;
		
		--Bits 24 a 31 entrada
		if(RegDIn>="11000" and RegDIn<="11111") then
				rdt<= conv_integer(RegDIn)-(conv_integer(CwpIn)*16);
		--Bits 16 a 23 local
		elsif(RegDIn>="10000" and RegDIn<="10111") then
				rdt<= conv_integer(RegDIn)+(conv_integer(CwpIn)*16);
		--Bits 8 a 15 salida
		elsif(RegDIn>="01000" and RegDIn<="01111") then
				rdt <= conv_integer(RegDIn)+ (conv_integer(CwpIn)*16);
		--Bits 0 a 7 globales
		elsif(RegDIn>="00000" and RegDIn<="00111") then
				rdt <= conv_integer(RegDIn);
		end if;
			
end process;

RegF1Out <= conv_std_logic_vector(rs1t,6);
RegF2Out <= conv_std_logic_vector(rs2t,6);
RegDOut <= conv_std_logic_vector(rdt,6);

end Behavioral;

