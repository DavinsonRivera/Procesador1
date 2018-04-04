----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:56:12 04/03/2018 
-- Design Name: 
-- Module Name:    Sumador - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all; 

--Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sumador is
    Port ( EntradaSumador : in  STD_LOGIC_VECTOR (31 downto 0);
           SalidaSumador : out  STD_LOGIC_VECTOR (31 downto 0);
           Inicio : in  STD_LOGIC_VECTOR (31 downto 0));
end Sumador;

architecture Behavioral of Sumador is

begin

   process(EntradaSumador,Inicio)
   begin
		SalidaSumador <= EntradaSumador + Inicio ; 
   end process;

end Behavioral;

