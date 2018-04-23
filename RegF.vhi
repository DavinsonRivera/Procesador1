
-- VHDL Instantiation Created from source file RegF.vhd -- 14:02:18 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT RegF
	PORT(
		InReg1 : IN std_logic_vector(4 downto 0);
		InReg2 : IN std_logic_vector(4 downto 0);
		RegD : IN std_logic_vector(4 downto 0);
		reset : IN std_logic;
		DatOutAlu : IN std_logic_vector(31 downto 0);          
		Out1 : OUT std_logic_vector(31 downto 0);
		Out2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_RegF: RegF PORT MAP(
		InReg1 => ,
		InReg2 => ,
		RegD => ,
		reset => ,
		DatOutAlu => ,
		Out1 => ,
		Out2 => 
	);


