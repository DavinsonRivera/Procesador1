
-- VHDL Instantiation Created from source file Pc.vhd -- 13:23:58 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Pc
	PORT(
		InPc : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		OutPc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Pc: Pc PORT MAP(
		InPc => ,
		OutPc => ,
		reset => ,
		clk => 
	);


