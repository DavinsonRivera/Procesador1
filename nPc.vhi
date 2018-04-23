
-- VHDL Instantiation Created from source file nPc.vhd -- 13:12:31 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT nPc
	PORT(
		entrada_nPc : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		salida_nPc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_nPc: nPc PORT MAP(
		entrada_nPc => ,
		reset => ,
		salida_nPc => ,
		clk => 
	);


