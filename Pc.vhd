----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:37 04/09/2018 
-- Design Name: 
-- Module Name:    Pc - Behavioral 
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

entity Pc is
    Port ( InPc : in  STD_LOGIC_VECTOR (31 downto 0);
           OutPc : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end Pc;

architecture Behavioral of Pc is

begin

   process (InPc, clk)
   begin
        if(rising_edge(clk))then
		    OutPc <= InPc;
		  end if;

   end process;
end Behavioral;

