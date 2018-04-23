
-- VHDL Instantiation Created from source file UniCntrl.vhd -- 13:45:55 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT UniCntrl
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		OutAlu : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_UniCntrl: UniCntrl PORT MAP(
		OP => ,
		OP3 => ,
		OutAlu => 
	);


