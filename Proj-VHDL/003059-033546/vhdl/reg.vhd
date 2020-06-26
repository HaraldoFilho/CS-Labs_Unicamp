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
Use ieee.std_logic_arith.all;

Entity reg is
generic(nbits: integer := 32);
port(clk      : in  std_logic;
     reset    : in  std_logic;
     d        : in  std_logic_vector(nbits -1 downto 0);
     q        : out std_logic_vector(nbits -1 downto 0));
End reg;

Architecture Behavior of reg is

Begin 
	Process (clk, reset)
	Begin
	
	if reset = '1' then q <= CONV_STD_LOGIC_VECTOR(0, nbits);
	elsif Clk'EVENT and clk = '1' then q <= d;
	end if;
	
	End Process;
	
End Behavior;
