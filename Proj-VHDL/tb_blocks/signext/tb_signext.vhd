-----------------------------------------------------------------
-- MC542 - ORGANIZACAO DE COMPUTADORES - 2o. Semestre de 2007  --
-- EXERCICIO PRATICO 3: TESTBANCH DA UNIDADE DE signextE	   --
-- Prof: Paulo Cesar Centoducatte                              --
-----------------------------------------------------------------
-- Aluno: Haraldo Sergio Albergaria Pereira Filho              --
-- RA: 003059                                                  -- 
-- Data de entrega: 29/10/2007                                 --
-----------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;

entity tb_signext is
end tb_signext;

architecture behav of tb_signext is

Component signext is
port(a    : in  std_logic_vector(15 downto 0);
	y    : out std_logic_vector(31 downto 0));
End Component signext;

for signext_TB: signext use entity work.signext;

signal a   : std_logic_vector(15 downto 0);
signal y	 : std_logic_vector(31 downto 0);
 
Begin
	signext_TB : signext port map (a, y);

	a  <= "0000000000000000",
		 "1000000000000000" after 10 ns,
		 "1100000000000000" after 20 ns,
		 "0100000000000000" after 30 ns,
  		 "0000000000000001" after 40 ns,
		 "0111111111111111" after 50 ns,
		 "1111111111111111" after 60 ns,
		 "0000000000000000" after 70 ns;
	

End  behav;
