-----------------------------------------------------------------
-- MC542 - ORGANIZACAO DE COMPUTADORES - 2o. Semestre de 2007  --
-- EXERCICIO PRATICO 2: UNIDADE LOGICA E ARITMETICA DE 32 BITS --
-- Prof: Paulo Cesar Centoducatte                              --
-----------------------------------------------------------------
-- Aluno: Haraldo Sergio Albergaria Pereira Filho              --
-- RA: 003059                                                  -- 
-- Data de entrega: 15/10/2007                                 --
-----------------------------------------------------------------

Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;

entity tb_reg is
end tb_reg;

architecture behav of tb_reg is

Component reg is
generic(nbits: integer := 32);
port(clk	    : in std_logic;
	reset    : in std_logic;
	d        : in  std_logic_vector(nbits -1 downto 0);
	q        : out std_logic_vector(nbits -1 downto 0));
End Component;

for reg_TB: reg use entity work.reg;

signal clk	 : std_logic;
signal reset    : std_logic;
signal d        : std_logic_vector(31 downto 0);
signal q        : std_logic_vector(31 downto 0);
	
signal erro : boolean := false;         -- para terminar a simulacao
signal clock : bit;
 
Begin
	reg_TB : reg port map (clk, reset, d, q);

	clock <= not clock after 50 ns;         -- gera o sinal de clock
	clk <= TO_STDULOGIC(clock);

     reset <= '1', '0' after 200 ns, '1' after 1000 ns, '0' after 2000 ns, '1' after 3000 ns;       -- gera o sinal de enable de escrita

Simula: 
	Process
	
	Begin

	count: For count in 1 to 100 loop
		d <= conv_std_logic_vector(count,32);
		Wait for 100 ns;
	End loop count;
	
	End Process Simula;

Encerra:  	
	Process
    	Begin
    	Wait for 4000 ns;      -- Define o tempo de simulacao
    	erro <= true;
  	End Process Encerra;
  
  	Assert not erro report "End of Simulation" severity failure;

End  behav;
