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

Package pkg_mips is

Component Control is
port(Opcode     : in  std_logic_vector(5 downto 0);
     Funct      : in  std_logic_vector(5 downto 0);
     MentoReg   : out std_logic;
     MemWrite   : out std_logic;
     ALUCntr    : out std_logic_vector(3 downto 0);
     ALUSrc     : out std_logic;
     Branch     : out std_logic;
     Jump       : out std_logic;
     RegDst 	: out std_logic;
     RegWrite	: out std_logic);
End Component;

Component ALU is
port(SrcA       : in  std_logic_vector(31 downto 0);
     SrcB       : in  std_logic_vector(31 downto 0);
     AluControl : in  std_logic_vector(3 downto 0);
     AluResult  : out std_logic_vector(31 downto 0);
     Zero       : out std_logic;
     Overflow   : out std_logic);
End Component;

Component RF is
port(A1  : in  std_logic_vector(4 downto 0);
     A2  : in  std_logic_vector(4 downto 0);
     A3  : in  std_logic_vector(4 downto 0);
     WD3 : in  std_logic_vector(31 downto 0);
     clk : in  std_logic;
     We3 : in  std_logic;
     RD1 : out std_logic_vector(31 downto 0);
     RD2 : out std_logic_vector(31 downto 0));
End Component;

Component signext is
port(a   : in  std_logic_vector(15 downto 0);
     y   : out std_logic_vector(31 downto 0));
End Component;

Component mux2 is
generic(nbits: integer := 32);
port(d0, d1 : in  std_logic_vector(nbits -1 downto 0);
     s      : in  std_logic;
     y      : out std_logic_vector(nbits -1 downto 0));
End Component;

Component reg is
generic(nbits: integer := 32);
port(clk   : in  std_logic;
     reset : in  std_logic;
     d     : in  std_logic_vector(nbits -1 downto 0);
     q     : out std_logic_vector(nbits -1 downto 0));
End Component;

End pkg_mips;
