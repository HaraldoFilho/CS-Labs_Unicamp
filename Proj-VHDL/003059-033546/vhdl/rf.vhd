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
Use ieee.std_logic_unsigned.all;

Entity RF is
port(A1  : in  std_logic_vector(4 downto 0);
     A2  : in  std_logic_vector(4 downto 0);
     A3  : in  std_logic_vector(4 downto 0);
     WD3 : in  std_logic_vector(31 downto 0);
     clk : in  std_logic;
     We3 : in  std_logic;
     RD1 : out std_logic_vector(31 downto 0);
     RD2 : out std_logic_vector(31 downto 0));
End RF;

Architecture Behavior of RF is
Type Vector is array(0 to 31) of std_logic_vector(31 downto 0);
Signal Reg: Vector;

Begin 

Write: 
	Process (clk, We3, A3, WD3)
	Begin

	Reg(0) <= "00000000000000000000000000000000";
	
	if We3 = '1' and conv_integer(A3) /= 0 and (Clk'EVENT and clk = '1')
	then Reg(conv_integer(A3)) <= WD3;
	End if;

	End Process Write;

Read: 
	Process (A1, A2)
	Begin
	
	RD1 <= Reg(conv_integer(A1));
	RD2 <= Reg(conv_integer(A2));

	End Process Read;

End Behavior;
