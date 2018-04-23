
-- VHDL Instantiation Created from source file Alu.vhd -- 14:28:06 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Alu
	PORT(
		InDat1 : IN std_logic_vector(31 downto 0);
		InDat2 : IN std_logic_vector(31 downto 0);
		InInstrcUC : IN std_logic_vector(5 downto 0);          
		OutDatRF : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Alu: Alu PORT MAP(
		InDat1 => ,
		InDat2 => ,
		InInstrcUC => ,
		OutDatRF => 
	);


