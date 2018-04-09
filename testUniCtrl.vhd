--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:26:42 04/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Davinson/Downloads/Procesador1-master/testUniCtrl.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UniCntrl
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
 
ENTITY testUniCtrl IS
END testUniCtrl;
 
ARCHITECTURE behavior OF testUniCtrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UniCntrl
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         OutAlu : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OutAlu : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UniCntrl PORT MAP (
          OP => OP,
          OP3 => OP3,
          OutAlu => OutAlu
        );

    

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		OP <= "10";
      OP3 <= "000000";
      wait for 100 ns;	
		OP <= "10";
      OP3 <= "000100";
      wait for 100 ns;	
		OP <= "10";
      OP3 <= "000001";
      wait for 100 ns;
		OP <= "10";
      OP3 <= "000101";
      wait for 100 ns;		


      wait;
   end process;

END;
