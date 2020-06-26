-----------------------------------------------------------------
-- MC542 - ORGANIZACAO DE COMPUTADORES - 2o. Semestre de 2007  --
-- EXERCICIO PRATICO 3: TESTBANCH DA UNIDADE DE CONTROLE	   --
-- Prof: Paulo Cesar Centoducatte                              --
-----------------------------------------------------------------
-- Aluno: Haraldo Sergio Albergaria Pereira Filho              --
-- RA: 003059                                                  -- 
-- Data de entrega: 29/10/2007                                 --
-----------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;

entity tb_control is
end tb_control;

architecture behav of tb_control is

Component Control is
port(Opcode 	: in std_logic_vector(5 downto 0);
	Funct 	: in std_logic_vector(5 downto 0);
	MentoReg 	: out std_logic;
	MemWrite 	: out std_logic;
	ALUCntr	: out std_logic_vector(3 downto 0);
	ALUSrc	: out std_logic;
	Branch	: out std_logic;
	Jump 	: out std_logic;
	RegDst 	: out std_logic;
	RegWrite	: out std_logic);
End Component Control;

for CONTROL_TB: CONTROL use entity work.CONTROL;
signal Opcode 		: std_logic_vector(5 downto 0);
signal Funct 		: std_logic_vector(5 downto 0);
signal Branch 		: std_logic;
signal MentoReg 	: std_logic;
signal MemWrite 	: std_logic;
signal ALUCntr		: std_logic_vector(3 downto 0);
signal ALUSrc		: std_logic;
signal Jump 		: std_logic;
signal RegDst 		: std_logic;
signal RegWrite	: std_logic;
 
Begin
	CONTROL_TB : CONTROL port map (Opcode, Funct, MentoReg, MemWrite, ALUCntr, ALUSrc, Branch, Jump, RegDst, RegWrite);

	Opcode <= "000000", 			 
			"100011" after 100 ns,    
			"101011" after 110 ns,    
			"001000" after 120 ns,   
			"001001" after 130 ns,   
			"000010" after 140 ns,
			"000011" after 150 ns,
			"000011" after 160 ns,
			"111111" after 170 ns;
			
	Funct <=	"100000",
			"100001" after 10 ns,
			"100010" after 20 ns,
			"100011" after 30 ns,
			"100100" after 40 ns,
			"100101" after 50 ns,
			"100110" after 60 ns,
			"100111" after 70 ns,
			"101010" after 80 ns,
			"101011" after 90 ns,
			"000000" after 100 ns;

End  behav;
