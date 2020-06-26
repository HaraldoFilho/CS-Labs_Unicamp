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
Use ieee.numeric_std.all;

Entity ALU is
    port(SrcA       : in  std_logic_vector(31 downto 0);
         SrcB       : in  std_logic_vector(31 downto 0);
         AluControl : in  std_logic_vector(3 downto 0);
         AluResult  : out std_logic_vector(31 downto 0);
         Zero       : out std_logic;
         Overflow   : out std_logic);
End ALU;

Architecture Behavior of ALU is
Signal temp_v : std_logic_vector(32 downto 0);  -- array auxiliar do tipo std_logic_vector de de 33 bits (32 bits + 1 bit 
									   -- para a geracao do bit de carry out)
Begin 
	Process (AluControl, SrcA, SrcB, temp_v)
	Variable temp_u : unsigned(32 downto 0);   -- variaveis auxiliares de 33 bits (32 bits para a execucao das operacoes
	Variable temp_s : signed(32 downto 0);     -- aritimeticas e mais 1 bit para a geracao do carry out)
	Variable temp_l : unsigned(31 downto 0);   -- variavel auxiliar de 32 bits para as funcoes logicas 							   
	
	Begin
		Case AluControl Is

			When "0000" =>   -- SOMA = A + B (signed)
				temp_s := ('0' & signed(SrcA)) + ('0' & signed(SrcB));
				temp_v <= std_logic_vector(temp_s);
				AluResult <= temp_v(31 downto 0);
				Overflow <= temp_v(32) xor SrcA(31) xor SrCB(31) xor temp_v(31);
				if temp_v(31 downto 0) = "00000000000000000000000000000000"
				then Zero <= '1';
				else Zero <= '0';
				end if;

			When "0001" =>   -- SOMA = A + B (unsigned)
				temp_u := ('0' & unsigned(SrcA)) + ('0' & unsigned(SrcB));
				temp_v <= std_logic_vector(temp_u);
				AluResult <= temp_v(31 downto 0);
				Overflow <= temp_v(32);
				if temp_v(31 downto 0) = "00000000000000000000000000000000"
				then Zero <= '1';
				else Zero <= '0';
				end if;

			When "0010" =>   -- SUBTRACAO = A - B (signed)
				temp_s := ('0' & signed(SrcA)) - ('0' & signed(SrcB));
				temp_v <= std_logic_vector(temp_s);
				AluResult <= temp_v(31 downto 0);
				Overflow <= temp_v(32) xor SrcA(31) xor SrCB(31) xor temp_v(31);
				if temp_v(31 downto 0) = "00000000000000000000000000000000"
				then Zero <= '1';
				else Zero <= '0';
				end if;
				
			When "0011" =>   -- SUBTRACAO = A - B (unsigned)
				temp_u := ('0' & unsigned(SrcA)) - ('0' & unsigned(SrcB));
				temp_v <= std_logic_vector(temp_u);
				AluResult <= temp_v(31 downto 0);
				Overflow <= temp_v(32);
				if temp_v(31 downto 0) = "00000000000000000000000000000000"
				then Zero <= '1';
				else Zero <= '0';
				end if;
				
			When "0100" =>   -- A AND B
				temp_l := unsigned(SrcA) and unsigned(SrcB);
				AluResult <= std_logic_vector(temp_l);
				if temp_l = 0
				then Zero <= '1';
				else Zero <= '0';
				end if;
				Overflow <= '0';
				
			When "0101" =>   -- A OR B
				temp_l := unsigned(SrcA) or unsigned(SrcB);
				AluResult <= std_logic_vector(temp_l);
				if temp_l = 0
				then Zero <= '1';
				else Zero <= '0';
				end if;
				Overflow <= '0';
				

			When "0110" =>   -- A XOR B
				temp_l := unsigned(SrcA) xor unsigned(SrcB);
				AluResult <= std_logic_vector(temp_l);
				if temp_l = 0
				then Zero <= '1';
				else Zero <= '0';
				end if;
				Overflow <= '0';
				
			When "0111" =>   -- A NOR B
				temp_l := unsigned(SrcA) nor unsigned(SrcB);
				AluResult <= std_logic_vector(temp_l);
				if temp_l = 0
				then Zero <= '1';
				else Zero <= '0';
				end if;
				Overflow <= '0';
				
			When "1010" =>   -- SLT = SET SE A < B (signed)	
				if signed(SrcA) < signed(SrcB) 
				then 
				AluResult <= "00000000000000000000000000000001";
				Zero <= '0';
				else 
				AluResult <= "00000000000000000000000000000000";
				Zero <= '1';
				end if;
				Overflow <= '0';

			When "1011" =>   -- SLT = SET SE A < B (unsigned)	
				if unsigned(SrcA) < unsigned(SrcB) 
				then 
				AluResult <= "00000000000000000000000000000001";
				Zero <= '0';
				else 
				AluResult <= "00000000000000000000000000000000";
				Zero <= '1';
				end if;
				Overflow <= '0';

			When others =>	null;
				
		End Case;
	End Process;

End Behavior;
