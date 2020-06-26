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

entity tb_RF is
end tb_RF;

architecture behav of tb_RF is

Component RF is
port(A1  : in std_logic_vector(4 downto 0);
	A2  : in std_logic_vector(4 downto 0);
	A3  : in std_logic_vector(4 downto 0);
	WD3 : in std_logic_vector(31 downto 0);
	clk : in std_logic;
	We3 : in std_logic;
	RD1 : out std_logic_vector(31 downto 0);
	RD2 : out std_logic_vector(31 downto 0));
End Component;

for RF_TB: RF use entity work.RF;
signal A1  : std_logic_vector(4 downto 0);
signal A2  : std_logic_vector(4 downto 0);
signal A3  : std_logic_vector(4 downto 0);
signal WD3 : std_logic_vector(31 downto 0);
signal clk : std_logic;
signal We3 : std_logic;
signal RD1 : std_logic_vector(31 downto 0);
signal RD2 : std_logic_vector(31 downto 0);

signal erro : boolean := false;         -- para terminar a simulacao
signal clock : bit;
 
Begin
	RF_TB : RF port map (A1, A2, A3, WD3, clk, We3, RD1, RD2);

	clock <= not clock after 50 ns;         -- gera o sinal de clock
	clk <= TO_STDULOGIC(clock);

     We3 <= '1', '0' after 3200 ns, '1' after 9600 ns;       -- gera o sinal de enable de escrita

Simula: 
	Process
	Variable aux : unsigned(31 downto 0);
	
	Begin

	A3 <= "00000";
	WD3 <= "11111111111111111111111111111111";
	Wait for 100 ns;

	aux := "00000001000000010000000100000001";
	
	count1: For count1 in 1 to 31 loop
		A3 <= conv_std_logic_vector(count1,5);
		WD3 <= std_logic_vector(aux); 
		aux := aux + "00000001000000010000000100000001";
		Wait for 100 ns;
	End loop count1;
	
	count2: For count2 in 0 to 31 loop
		A3 <= conv_std_logic_vector(count2,5);
		WD3 <= "11111111111111111111111111111111";
		Wait for 100 ns;
	End loop count2;
	
	count3: For count3 in 0 to 31 loop
		A1 <= conv_std_logic_vector(count3,5);
		A2 <= conv_std_logic_vector(31-count3,5);
		A3 <= conv_std_logic_vector(count3,5);
		Wait for 100 ns;
	End loop count3;

	count4: For count4 in 0 to 31 loop
		A1 <= conv_std_logic_vector(count4,5);
		A2 <= conv_std_logic_vector(31-count4,5);
		A3 <= conv_std_logic_vector(count4,5);
		Wait for 100 ns;
	End loop count4;
	
	End Process Simula;

Encerra:  	
	Process
    	Begin
    	Wait for 12850 ns;      -- Define o tempo de simulacao
    	erro <= true;
  	End Process Encerra;
  
  	Assert not erro report "End of Simulation" severity failure;

End  behav;
