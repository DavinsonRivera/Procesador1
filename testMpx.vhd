--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:11:45 04/16/2018
-- Design Name:   
-- Module Name:   C:/Users/Davinson/Downloads/Procesador1-master/testMpx.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MuPlx
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testMpx IS
END testMpx;
 
ARCHITECTURE behavior OF testMpx IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MuPlx
    PORT(
         I : IN  std_logic;
         Opr2 : IN  std_logic_vector(31 downto 0);
         Inm : IN  std_logic_vector(31 downto 0);
         OutMpx : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic := '0';
   signal Opr2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Inm : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal OutMpx : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MuPlx PORT MAP (
          I => I,
          Opr2 => Opr2,
          Inm => Inm,
          OutMpx => OutMpx
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		I <= '1';
      Opr2 <= x"00000003";
      Inm <= x"00000006";
      wait for 100 ns;	
      I <= '0';
      Opr2 <= x"00000003";
      Inm <= x"00000006";
      wait for 100 ns;	

      wait;
   end process;

END;
