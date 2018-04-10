--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:30:05 04/03/2018
-- Design Name:   
-- Module Name:   C:/Users/Davinson/Dropbox/Documentos/UTP/arquitectura/ProcesdrsArqitecra/Procesador1/testSumador.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador
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
 
ENTITY testSumador IS
END testSumador;
 
ARCHITECTURE behavior OF testSumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         EntradaSumador : IN  std_logic_vector(31 downto 0);
         SalidaSumador : OUT  std_logic_vector(31 downto 0);
         Inicio : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EntradaSumador : std_logic_vector(31 downto 0) := (others => '0');
   signal Inicio : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal SalidaSumador : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          EntradaSumador => EntradaSumador,
          SalidaSumador => SalidaSumador,
          Inicio => Inicio
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin	
	
      Inicio <= "00000000000000000000000000000010";
		EntradaSumador<= "00000000000000000000000000000001";
		wait for 100 ns;	
      Inicio <= "00000000000000000000000000000001";
		EntradaSumador<= "00000000000000000000000000000100";
		wait for 100 ns;	
      Inicio <= "00000000000000000000000000000001";
		EntradaSumador<= "00000000000000000000000000000111";
      
      -- insert stimulus here 

      wait;
   end process;

END;
