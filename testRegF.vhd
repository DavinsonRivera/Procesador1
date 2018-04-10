--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:24:11 04/09/2018
-- Design Name:   
-- Module Name:   C:/Users/Davinson/Downloads/Procesador1-master/testRegF.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegF
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
 
ENTITY testRegF IS
END testRegF;
 
ARCHITECTURE behavior OF testRegF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegF
    PORT(
         InReg1 : IN  std_logic_vector(4 downto 0);
         InReg2 : IN  std_logic_vector(4 downto 0);
         RegD : IN  std_logic_vector(4 downto 0);
         reset : IN  std_logic;
         DatOutAlu : IN  std_logic_vector(31 downto 0);
         Out1 : OUT  std_logic_vector(31 downto 0);
         Out2 : OUT  std_logic_vector(31 downto 0);
         Out3 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal InReg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal InReg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RegD : std_logic_vector(4 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal DatOutAlu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Out1 : std_logic_vector(31 downto 0);
   signal Out2 : std_logic_vector(31 downto 0);
   signal Out3 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegF PORT MAP (
          InReg1 => InReg1,
          InReg2 => InReg2,
          RegD => RegD,
          reset => reset,
          DatOutAlu => DatOutAlu,
          Out1 => Out1,
          Out2 => Out2,
          Out3 => Out3
        );

    

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '0';
		InReg1 <= "10000";
      InReg2 <= "10001";
      RegD <= "00001";
      DatOutAlu <= x"00000003";
      wait for 100 ns;	

      

      wait;
   end process;

END;
