-----------------------------------------------------------------
-- MC542 - ORGANIZACAO DE COMPUTADORES - 2o. Semestre de 2007  --
-- EXERCICIO PRATICO 3: TESTBANCH DA UNIDADE DE mux2E	   --
-- Prof: Paulo Cesar Centoducatte                              --
-----------------------------------------------------------------
-- Aluno: Haraldo Sergio Albergaria Pereira Filho              --
-- RA: 003059                                                  -- 
-- Data de entrega: 29/10/2007                                 --
-----------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;

entity tb_mux2 is
end tb_mux2;

architecture behav of tb_mux2 is

Component mux2 is
generic(nbits: integer := 32);
port(d0, d1   : in  std_logic_vector(nbits -1 downto 0);
	s        : in  std_logic;
	y	    : out std_logic_vector(nbits -1 downto 0));
End Component mux2;

for mux2_TB: mux2 use entity work.mux2;

signal d0, d1   : std_logic_vector(31 downto 0);
signal s        : std_logic;
signal y	      : std_logic_vector(31 downto 0);
 
Begin
	mux2_TB : mux2 port map (d0, d1, s, y);

	d0 <= "00000000000000000000000000000000";
	d1 <= "00010001000100010001000100010001";
	
	s  <= '0',
	      '1' after 10 ns,
		 '0' after 20 ns;
	

End  behav;
