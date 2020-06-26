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

Entity mux2 is
generic(nbits: integer := 32);
port(d0, d1 : in  std_logic_vector(nbits -1 downto 0);
     s      : in  std_logic;
     y      : out std_logic_vector(nbits -1 downto 0));
End mux2;

Architecture Behavior of mux2 is

Begin 

	y <= d1 when s = '1' else d0;
	
End Behavior;
