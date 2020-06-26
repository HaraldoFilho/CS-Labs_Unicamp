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
Use ieee.std_logic_arith.all;
Use work.pkg_mips.all;

Entity mips is
generic(nbits : positive := 32);
port(Instruction : in  std_logic_vector(nbits -1 downto 0);
     Data        : in  std_logic_vector(nbits -1 downto 0);
     clk         : in  std_logic;
     reset       : in  std_logic;
     PCF         : out std_logic_vector(nbits -1 downto 0);
     ALUOutM     : out std_logic_vector(nbits -1 downto 0);
     WriteDataM  : out std_logic_vector(nbits -1 downto 0);
     MemWriteM   : out std_logic);
End mips;

Architecture Struct of mips is

-- Sinais do DATAPATH

-- FETCH
Signal PC           : std_logic_vector(nbits -1 downto 0);
Signal PC_net       : std_logic_vector(nbits -1 downto 0);
Signal PCF_net      : std_logic_vector(nbits -1 downto 0);
Signal PCPlus4F     : std_logic_vector(nbits -1 downto 0);
Signal PCJumpF      : std_logic_vector(nbits -1 downto 0);

-- DECODE
Signal InstrD       : std_logic_vector(nbits -1 downto 0);
Signal SignImmD	    : std_logic_vector(nbits -1 downto 0);
Signal SignImmx4D   : std_logic_vector(nbits -1 downto 0);
Signal RegData1D    : std_logic_vector(nbits -1 downto 0);
Signal RegData2D    : std_logic_vector(nbits -1 downto 0);
Signal PCPlus4D     : std_logic_vector(nbits -1 downto 0);
Signal PCBranchD    : std_logic_vector(nbits -1 downto 0);
Signal PCJumpD      : std_logic_vector(27 downto 0);
Signal WriteRegWD   : std_logic_vector(4 downto 0);
Signal ResultWD     : std_logic_vector(nbits -1 downto 0);

-- EXECUTE
Signal SignImmE	    : std_logic_vector(nbits -1 downto 0);
Signal SrcAE        : std_logic_vector(nbits -1 downto 0);
Signal SrcBE        : std_logic_vector(nbits -1 downto 0);
Signal ALUOutE      : std_logic_vector(nbits -1 downto 0);
Signal WriteDataE   : std_logic_vector(nbits -1 downto 0);
Signal WriteRegE    : std_logic_vector(4 downto 0);
SIgnal Rte          : std_logic_vector(4 downto 0);
Signal Rde          : std_logic_vector(4 downto 0);

-- MEMORY
Signal WriteRegM    : std_logic_vector(4 downto 0);
Signal ALUOutM_net  : std_logic_vector(nbits -1 downto 0);

-- WRITEBACK
Signal ALUOutW      : std_logic_vector(nbits -1 downto 0);
Signal WriteRegW    : std_logic_vector(4 downto 0);
Signal ReadDataW    : std_logic_vector(nbits -1 downto 0);
Signal ResultW      : std_logic_vector(nbits -1 downto 0);

-- Sinais de CONTROLE

-- DECODE
Signal MemtoRegD    : std_logic;
Signal MemWriteD    : std_logic;
Signal ALUCntrD	    : std_logic_vector(3 downto 0);
Signal ALUSrcD      : std_logic;
Signal EqualD       : std_logic;
Signal PCSrcD       : std_logic;
Signal BranchD      : std_logic;
Signal JumpD        : std_logic;
Signal RegDstD      : std_logic;
Signal RegWriteD    : std_logic;
Signal RegWriteWD   : std_logic;

-- EXECUTE
Signal MemtoRegE    : std_logic;
Signal MemWriteE    : std_logic;
Signal ALUCntrE	    : std_logic_vector(3 downto 0);
Signal ALUSrcE      : std_logic;
Signal RegDstE      : std_logic;
Signal RegWriteE    : std_logic;

-- MEMORY
Signal MemtoRegM    : std_logic;
Signal RegWriteM    : std_logic;

-- WRITEBACK
Signal MemtoRegW    : std_logic;
Signal RegWriteW    : std_logic;


-- Sinais nao conectados
Signal ZeroE, Overflow, nc1, nc2, nc3, nc4, nc5 : std_logic;
Signal nc6 : std_logic_vector(nbits -1 downto 0);

Begin 

	RegWriteWD <= RegWriteD when JumpD = '1' else RegWriteW;
	EqualD <= '1' when RegData1D = RegData2D else '0';
	PCSrcD <= BranchD and EqualD;	
	PCJumpF <= PCPlus4D(31 downto 28) & InstrD(25 downto 0) & "00";
	SignImmx4D <= SignImmD(29 downto 0) & "00";

	PCF <= PCF_net;
	ALUOutM <= ALUOutM_net;
	
	IControl: control
	Port Map(InstrD(31 downto 26), InstrD(5 downto 0), MemtoRegD, 
	MemWriteD, ALUCntrD, ALUSrcD, BranchD, JumpD, RegDstD, RegWriteD);
	
	IAlu: ALU
	Port Map(SrcAE, SrcBE, AluCntrE, ALUOutE, ZeroE, Overflow);
	
	IRF: RF
	Port Map(InstrD(25 downto 21), InstrD(20 downto 16), WriteRegWD, 
	ResultWD, clk, RegWriteWD, RegData1D, RegData2D);

	IImmSigExt: signext
	Port Map(InstrD(15 downto 0), SignImmD);
	
	IPCPlus4: ALU
	Port Map(PCF_net, CONV_STD_LOGIC_VECTOR(4, nbits), "0000", 
	PCPlus4F, nc1, nc2);
	
	IPCBranch: ALU
	Port Map(SignImmx4D, PCPlus4D, "0000", PCBranchD, nc3, nc4);
	
	IPC_net: mux2
	Port Map(PCPlus4F, PCBranchD, PCSrcD, PC_net);
	
	IPC: mux2
	Port Map(PC_net, PCJumpF, JumpD, PC);
	
	ISrcBE: mux2
	Port Map(WriteDataE, SignImmE, AluSrcE, SrcBE);
	
	IWriteRegE: mux2 generic map(5)
	Port Map(RtE, RdE, RegDstE, WriteRegE);
	
	IWriteRegWD: mux2 generic map(5)
	Port Map(WriteRegW, "11111", JumpD, WriteRegWD);
	
	IResultW: mux2
	Port Map(AluOutW, ReadDataW, MemtoRegW, ResultW);
	
	IResultWE: mux2
	Port Map(ResultW, PCPlus4D, JumpD, ResultWD);
	
	IPCReg: reg
	Port Map(clk, reset, PC, PCF_net);
	
	IFDReg: reg generic map(64)
	Port Map(clk => clk, reset => reset, 
	d(63 downto 32) => Instruction, d(31 downto 0) => PCPlus4F, 
	q(63 downto 32) => InstrD,      q(31 downto 0) => PCPlus4D);
	
	IDEReg: reg generic map(115)
	Port Map(clk => clk, reset => reset, 
	d(114) => RegWriteD, d(113) => MemtoRegD, d(112) => MemWriteD, d(111 downto 108) => ALUCntrD, d(107) => ALUSrcD, 
	d(106) => RegDstD, 	d(105 downto 74) => RegData1D, d(73 downto 42) => RegData2D, 
	d(41 downto 37) => InstrD(20 downto 16), d(36 downto 32) => InstrD(15 downto 11), d(31 downto 0) => SignImmD, 
	q(114) => RegWriteE, q(113) => MemtoRegE, q(112) => MemWriteE, q(111 downto 108) => ALUCntrE, q(107) => ALUSrcE, 
	q(106) => RegDstE,  q(105 downto 74) => SrcAE,     q(73 downto 42) => WriteDataE, 
	q(41 downto 37) => RtE, 	                q(36 downto 32) => RdE,                  q(31 downto 0) => SignImmE);
	
	IEMReg: reg generic map(72)
	Port Map(clk => clk, reset => reset, 
	d(71) => RegWriteE, d(70) => MemtoRegE, d(69) => MemWriteE, d(68 downto 37) => ALUOutE, 
	d(36 downto 5) => WriteDataE, d(4 downto 0) => WriteRegE, 
	q(71) => RegWriteM, q(70) => MemtoRegM, q(69) => MemWriteM, q(68 downto 37) => ALUOutM_net, 
	q(36 downto 5) => WriteDataM, q(4 downto 0) => WriteRegM);
	
	IMWReg: reg generic map(71)
	Port Map(clk => clk, reset => reset, 
	d(70) => RegWriteM, d(69) => MemtoRegM, d(68 downto 37) => ALUOutM_net,
	d(36 downto 5) => Data,      d(4 downto 0) => WriteRegM,
	q(70) => RegWriteW, q(69) => MemtoRegW, q(68 downto 37) => ALUOutW,
	q(36 downto 5) => ReadDataW, q(4 downto 0) => WriteRegW);
	
End Architecture Struct;

