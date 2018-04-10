--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:40:02 04/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Davinson/Downloads/Procesador1-master/testAlu.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Alu
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
 
ENTITY testAlu IS
END testAlu;
 
ARCHITECTURE behavior OF testAlu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         InDat1 : IN  std_logic_vector(31 downto 0);
         InDat2 : IN  std_logic_vector(31 downto 0);
         InInstrcUC : IN  std_logic_vector(5 downto 0);
         OutDatRF : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal InDat1 : std_logic_vector(31 downto 0) := (others => '0');
   signal InDat2 : std_logic_vector(31 downto 0) := (others => '0');
   signal InInstrcUC : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OutDatRF : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          InDat1 => InDat1,
          InDat2 => InDat2,
          InInstrcUC => InInstrcUC,
          OutDatRF => OutDatRF
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		InDat1 <= x"00000004";
      InDat2 <= x"00000002";
      InInstrcUC <= "000000";
      wait for 100 ns;	
		InDat1 <= x"00000007";
      InDat2 <= x"00000005";
      InInstrcUC <= "000001";
      wait for 100 ns;	
		InDat1 <= x"00000003";
      InDat2 <= x"00000004";
      InInstrcUC <= "000010";
      wait for 100 ns;	

      


      wait;
   end process;

END;
