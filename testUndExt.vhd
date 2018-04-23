--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:36:39 04/16/2018
-- Design Name:   
-- Module Name:   C:/Users/Davinson/Downloads/Procesador1-master/testUndExt.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UndExt
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
 
ENTITY testUndExt IS
END testUndExt;
 
ARCHITECTURE behavior OF testUndExt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UndExt
    PORT(
         Inm : IN  std_logic_vector(12 downto 0);
         OutInm : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Inm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal OutInm : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UndExt PORT MAP (
          Inm => Inm,
          OutInm => OutInm
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Inm <= "0000000000101";
      wait for 100 ns;
		Inm <= "1111111111010";
      wait for 100 ns;

      

      wait;
   end process;

END;
