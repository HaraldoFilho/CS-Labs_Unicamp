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

entity tb_mips is
end tb_mips;

architecture behav of tb_mips is

Component mips is
generic(nbits : positive := 32);
port(Instruction : in  std_logic_vector(nbits -1 downto 0);
	Data		  : in  std_logic_vector(nbits -1 downto 0);
	clk 		  : in  std_logic;
	reset 	  : in  std_logic;
	PCF 		  : out std_logic_vector(nbits -1 downto 0);
	ALUOutM 	  : out std_logic_vector(nbits -1 downto 0);
	WriteDataM  : out std_logic_vector(nbits -1 downto 0);
	MemWriteM   : out std_logic);
End Component mips;

for MIPS_TB: MIPS use entity work.MIPS;
signal Instruction	  : std_logic_vector(31 downto 0);
signal Data		  : std_logic_vector(31 downto 0);
signal clk 		  : std_logic;
signal reset 	       : std_logic;
signal PCF 		  : std_logic_vector(31 downto 0);
signal ALUOutM 	  : std_logic_vector(31 downto 0);
signal WriteDataM     : std_logic_vector(31 downto 0);
signal MemWriteM      : std_logic;

signal erro : boolean := false;         -- para terminar a simulacao

Begin
	MIPS_TB : mips port map (Instruction, Data, clk, reset, PCF, ALUOutM, WriteDataM, MemWriteM);

	-- Gera sinal de clock com periodo de 10ns
	process begin

		clk <= '1';
		wait for 5 ns;
		clk <= '0';
		wait for 5 ns;

	end process;
	
	-- Gera reset para os primeiros 2 ciclos de clock
	process begin

		reset <= '1';
		wait for 22 ns;
		reset <= '0';
		wait;

	end process;
	
	
	-- Simula a Instruction Memory
	process (PCF) begin
	
		Case PCF is
		
			When X"00000004" => Instruction <= "10001100000010000000000000100000"; -- lw $t0, 32($0)
			When X"00000008" => Instruction <= "10001100000010010000000001000000"; -- lw $t1, 64($0)
				
			When X"00000014" => Instruction <= "10101100000010000000000000000010"; -- sw $t0, 2($0)
			When X"00000018" => Instruction <= "10101100000010010000000000000100"; -- sw $t1, 4($0)

			When X"00000024" => Instruction <= "10001100000010010000000000000010"; -- lw $t1, 2($0) 
			When X"00000028" => Instruction <= "10001100000010000000000000000100"; -- lw $t0, 4($0)
			
			When X"00000038" => Instruction <= "00000001000010010101000000100100"; -- and $t2, $t0, $t1
			When X"0000003C" => Instruction <= "00000001000010010101100000100101"; -- or  $t3, $t0, $t1
			When X"00000040" => Instruction <= "00000001000010010110000000100110"; -- xor $t4, $t0, $t1
			When X"00000044" => Instruction <= "00000001000010010110100000100111"; -- nor $t5, $t0, $t1
			
			When X"00000048" => Instruction <= "10101100000010100000000000000010"; -- sw $t2, 2($0)
			When X"0000004C" => Instruction <= "10101100000010110000000000000100"; -- sw $t3, 4($0)
			When X"00000050" => Instruction <= "10101100000011000000000000001000"; -- sw $t4, 8($0)
			When X"00000054" => Instruction <= "10101100000011010000000000010000"; -- sw $t5, 16($0)

			When X"00000058" => Instruction <= "00000001000010010101000000100000"; -- add  $t2, $t0, $t1
			When X"0000005C" => Instruction <= "00000001000010010101100000100001"; -- addu $t3, $t0, $t1
			When X"00000060" => Instruction <= "00000001000010010110000000100010"; -- sub  $t4, $t0, $t1
			When X"00000064" => Instruction <= "00000001000010010110100000100011"; -- subu $t5, $t0, $t1
			
			When X"00000068" => Instruction <= "10101100000010100000000000000010"; -- sw $t2, 2($0)
			When X"0000006C" => Instruction <= "10101100000010110000000000000100"; -- sw $t3, 4($0)
			When X"00000070" => Instruction <= "10101100000011000000000000001000"; -- sw $t4, 8($0)
			When X"00000074" => Instruction <= "10101100000011010000000000010000"; -- sw $t5, 16($0)

			When X"00000078" => Instruction <= "00000001000010010101000000101010"; -- slt  $t2, $t0, $t1
			When X"0000007C" => Instruction <= "00000001001010000101100000101010"; -- slt  $t3, $t1, $t0
			When X"00000080" => Instruction <= "00000001000010010110000000101011"; -- sltu $t4, $t0, $t1
			When X"00000084" => Instruction <= "00000001001010000110100000101011"; -- sltu $t5, $t1, $t0

			When X"00000088" => Instruction <= "10101100000010100000000000000010"; -- sw $t2, 2($0)
			When X"0000008C" => Instruction <= "10101100000010110000000000000100"; -- sw $t3, 4($0)
			When X"00000090" => Instruction <= "10101100000011000000000000001000"; -- sw $t4, 8($0)
			When X"00000094" => Instruction <= "10101100000011010000000000010000"; -- sw $t5, 16($0)

			When X"00000098" => Instruction <= "00100001010010000000000011111111"; -- addi $t0, $t2, 255
			When X"0000009C" => Instruction <= "00100101010010010000000100000000"; -- subi $t1, $t2, 256

			When X"000000A8" => Instruction <= "10101100000010000000000000000010"; -- sw $t0, 2($0)
			When X"000000AC" => Instruction <= "10101100000010010000000000000100"; -- sw $t1, 4($0)

			When X"000000B0" => Instruction <= "00010001000010010000000000001011"; -- beq $t0, $t1, 11
			When X"000000BC" => Instruction <= "00010001000010000000000000001011"; -- beq $t0, $t0, 11

			When X"000000D8" => Instruction <= "10101100000111110000000000001000"; -- sw $ra, 8($0)

			When X"000000DC" => Instruction <= "00001000000000000000000000111111"; -- j 000000FC

			When X"000000EC" => Instruction <= "00001100000000000000000000110110"; -- jal 000000D8
			
			When X"000000FC" => Instruction <= "10101100000111110000000000010000"; -- sw $ra, 16($0)

			When others =>      Instruction <= "00000000000000000000000000100000"; -- nop (add $0, $0, $0)
				
		End Case;

	end process;

	
	-- Simula a Data Memory
	process (AluOutM)
	variable Data1 :  std_logic_vector(31 downto 0);
	variable Data2 :  std_logic_vector(31 downto 0);
	variable Data3 :  std_logic_vector(31 downto 0);
	variable Data4 :  std_logic_vector(31 downto 0);

	begin
	
		Case AluOutM is
		
			When X"00000020" => Data <= "11110000111100001111111100000000";
			When X"00000040" => Data <= "11111111000000001111000011110000";

			When X"00000002" => 
				if MemWriteM = '1' 
					then Data1 := WriteDataM;
					else Data  <= Data1;
				end if;
			
			When X"00000004" => 
				if MemWriteM = '1'
					then Data2 := WriteDataM;
					else Data <= Data2;
				end if;
			
			When X"00000008" => 
				if MemWriteM = '1' 
					then Data3 := WriteDataM;
					else Data  <= Data3;
				end if;
			
			When X"00000010" => 
				if MemWriteM = '1'
					then Data4 := WriteDataM;
					else Data <= Data4;
				end if;
			
		End Case;
		
	end process;
	
		

	process begin

    		wait for 610 ns;      -- Define o tempo de simulacao
    		erro <= true;

  	end process;
  
  	Assert not erro report "End of Simulation" severity failure;

End  behav;
