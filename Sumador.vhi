
-- VHDL Instantiation Created from source file Sumador.vhd -- 10:41:55 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Sumador
	PORT(
		EntradaSumador : IN std_logic_vector(31 downto 0);
		Inicio : IN std_logic_vector(31 downto 0);          
		SalidaSumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Sumador: Sumador PORT MAP(
		EntradaSumador => ,
		SalidaSumador => ,
		Inicio => 
	);


