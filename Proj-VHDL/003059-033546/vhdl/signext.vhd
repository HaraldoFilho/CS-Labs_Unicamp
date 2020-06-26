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

Entity signext is
port(a : in  std_logic_vector(15 downto 0);
     y : out std_logic_vector(31 downto 0));
End signext;

Architecture Behavior of signext is

Begin 
	
	y <= "0000000000000000" & a when a(15) = '0' else "1111111111111111" & a;
	
End Behavior;
