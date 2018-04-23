
-- VHDL Instantiation Created from source file InstructionMemory.vhd -- 13:29:04 04/19/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT InstructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_InstructionMemory: InstructionMemory PORT MAP(
		address => ,
		reset => ,
		outInstruction => 
	);


