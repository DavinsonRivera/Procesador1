----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:41 04/19/2018 
-- Design Name: 
-- Module Name:    Procesador1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Procesador1 is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           OutProcesador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador1;

architecture Behavioral of Procesador1 is

COMPONENT Sumador
	PORT(
		EntradaSumador : IN std_logic_vector(31 downto 0);
		Inicio : IN std_logic_vector(31 downto 0);          
		SalidaSumador : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT nPc
	PORT(
		entrada_nPc : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		salida_nPc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
COMPONENT Pc
	PORT(
		InPc : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		OutPc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
COMPONENT InstructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	

COMPONENT UniCntrl
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		OutAlu : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

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
	
COMPONENT MuPlx
	PORT(
		I : IN std_logic;
		Opr2 : IN std_logic_vector(31 downto 0);
		Inm : IN std_logic_vector(31 downto 0);          
		OutMpx : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
COMPONENT UndExt
	PORT(
		Inm : IN std_logic_vector(12 downto 0);          
		OutInm : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	

COMPONENT Alu
	PORT(
		InDat1 : IN std_logic_vector(31 downto 0);
		InDat2 : IN std_logic_vector(31 downto 0);
		InInstrcUC : IN std_logic_vector(5 downto 0); 
		C : in STD_LOGIC;
		OutDatRF : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT PsrMdf
	PORT(
		RegfOut : IN std_logic_vector(31 downto 0);
		Mpx : IN std_logic_vector(31 downto 0);
		AluOut : IN std_logic_vector(31 downto 0);
		UcOut : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT Psr
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;          
		C : OUT std_logic
		);
	END COMPONENT;

signal SumadorToNpc, NpcToPc, PcToInstMem, ImToUc_Rf_Ue, AluToRf, RfToAlu, RfToMpx, UndExtToMpx, MpxToAlu :  STD_LOGIC_VECTOR (31 downto 0);
signal UcToAlu : STD_LOGIC_VECTOR (5 downto 0);
signal PsrMdfToPsr  : STD_LOGIC_VECTOR (3 downto 0);
signal PsrToAlu : STD_LOGIC;

begin

Inst_Sumador: Sumador PORT MAP(
		EntradaSumador => PcToInstMem,
		SalidaSumador => SumadorToNpc,
		Inicio => X"00000001"
	);
	
Inst_nPc: nPc PORT MAP(
		entrada_nPc => SumadorToNpc,
		reset => reset,
		salida_nPc => NpcToPc,
		clk => clk
	);	

Inst_Pc: Pc PORT MAP(
		InPc => NpcToPc,
		OutPc => PcToInstMem,
		reset => reset,
		clk => clk
	);
	
Inst_InstructionMemory: InstructionMemory PORT MAP(
		address => PcToInstMem,
		reset => reset,
		outInstruction => ImToUc_Rf_Ue
	);	
	
Inst_UniCntrl: UniCntrl PORT MAP(
		OP => ImToUc_Rf_Ue(31 downto 30),
		OP3 => ImToUc_Rf_Ue(24 downto 19),
		OutAlu => UcToAlu
	);	

Inst_RegF: RegF PORT MAP(
		InReg1 => ImToUc_Rf_Ue(18 downto 14),
		InReg2 => ImToUc_Rf_Ue(4 downto 0),
		RegD => ImToUc_Rf_Ue(29 downto 25),
		reset => reset,
		DatOutAlu => AluToRf,
		Out1 => RfToAlu,
		Out2 => RfToMpx
	);
	
Inst_MuPlx: MuPlx PORT MAP(
		I => ImToUc_Rf_Ue(13),
		Opr2 => RfToMpx,
		Inm => UndExtToMpx,
		OutMpx => MpxToAlu
	);	
	
Inst_UndExt: UndExt PORT MAP(
		Inm => ImToUc_Rf_Ue(12 downto 0),
		OutInm => UndExtToMpx
	);	

Inst_Alu: Alu PORT MAP(
		InDat1 => RfToAlu,
		InDat2 => MpxToAlu,
		InInstrcUC => UcToAlu,
		c => PsrToAlu,
		OutDatRF => AluToRf
	);
	
Inst_PsrMdf: PsrMdf PORT MAP(
		RegfOut => RfToAlu,
		Mpx => MpxToAlu,
		AluOut => AluToRf,
		UcOut => UcToAlu,
		nzvc => PsrMdfToPsr
	);	
	
Inst_Psr: Psr PORT MAP(
		nzvc => PsrMdfToPsr,
		C => PsrToAlu,
		clk => clk,
		reset => reset
	);	

OutProcesador <= AluToRf;	
	

end Behavioral;

