-----------------------------------------------------------------
-- MC542 - ORGANIZACAO DE COMPUTADORES - 2o. Semestre de 2007  --
-- PROJETO PRATICO: MIPS PIPELINE                              --
-- Prof: Paulo Cesar Centoducatte                              --
-----------------------------------------------------------------
-- Alunos:                                                     --
-- Haraldo Sergio Albergaria Pereira Filho          RA: 003059 --
-- Jonatas Botelho da Silva                         RA: 033546 --
-- Data de entrega: 04/12/2007                                 --
-----------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;

Entity Control is
port(Opcode   : in  std_logic_vector(5 downto 0);
     Funct    : in  std_logic_vector(5 downto 0);
     MentoReg : out std_logic;
     MemWrite : out std_logic;
     ALUCntr  : out std_logic_vector(3 downto 0);
     ALUSrc   : out std_logic;
     Branch   : out std_logic;
     Jump     : out std_logic;
     RegDst   : out std_logic;
     RegWrite : out std_logic);
End Control;

Architecture Behavior of Control is

Begin 

	Process (Opcode, Funct)
	Begin
		Case Opcode Is

			When "000000" => -- R-type
				ALUCntr <= Funct(3 downto 0);
				MentoReg <= '0';
				MemWrite <= '0';
				Branch   <= '0';
				ALUSrc   <= '0';
				Jump     <= '0';
				RegDst   <= '1';
				RegWrite <= '1';

			When "100011" => -- lw
				ALUCntr  <= "0000";
				MentoReg <= '1';
				MemWrite <= '0';
				Branch   <= '0';
				ALUSrc   <= '1';
				Jump     <= '0';
				RegDst   <= '0';
				RegWrite <= '1';

			When "101011" => -- sw
				ALUCntr  <= "0000";
				MemWrite <= '1';
				Branch   <= '0';
				ALUSrc   <= '1';
				Jump     <= '0';
				RegWrite <= '0';

			When "001000" => -- addi
				ALUCntr  <= "0000";
				MentoReg <= '0';
				MemWrite <= '0';
				Branch   <= '0';
				ALUSrc   <= '1';
				Jump     <= '0';
				RegDst   <= '0';
				RegWrite <= '1';

			When "001001" => -- subi
				ALUCntr  <= "0010";
				MentoReg <= '0';
				MemWrite <= '0';
				Branch   <= '0';
				ALUSrc   <= '1';
				Jump     <= '0';
				RegDst   <= '0';
				RegWrite <= '1';

			When "000010" => -- j
				MemWrite <= '0';
				Jump     <= '1';
				RegWrite <= '0';

			When "000011" => -- jal
				MemWrite <= '0';
				Jump     <= '1';
				RegWrite <= '1';

			When "000100" => -- beq
				ALUCntr  <= "0010";
				MemWrite <= '0';
				Branch   <= '1';
				ALUSrc   <= '0';
				Jump     <= '0';
				RegWrite <= '0';

			When others =>	null;
				
		End Case;
		
	End Process;

	
End Behavior;

