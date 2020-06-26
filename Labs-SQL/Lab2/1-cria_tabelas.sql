REM ----------------------------------------------------------------------------
REM MC536 - EXERCICIO PRATICO 2
REM ALUNO: HARALDO S. A. PEREIRA FILHO       RA: 003059
REM ----------------------------------------------------------------------------

REM 'Tabela GENEROS define os generos possiveis para os espetaculos
REM evitando duplicacoes de um mesmo genero, por exemplo, com grafias erradas.'
CREATE TABLE GENEROS (
	Genero CHAR(20) PRIMARY KEY );

REM 'Tabela ESPETACULOS armazena as informacoes referentes aos espetaculos,
REM sejam filmes ou pecas de teatro. Informacoes especificas de filmes ou
REM pecas de teatro sao armazenadas nas tabelas FILMES e PECAS_DE_TEATRO.
REM Apesar de existir campos que poderiam constar na tabela ESPETACULO, mas
REM constam na tebela FILMES ou PECAS_DE_TEATRO, essa escolha foi feita
REM considerando apenas o que era mais importante para cada tipo de espetaculo'
CREATE TABLE ESPETACULOS (
	ID_Esp CHAR(12) PRIMARY KEY,
	Genero CHAR(20) NOT NULL REFERENCES Generos,
	Titulo CHAR(50) NOT NULL,
	Diretor CHAR(20),
	Elenco CHAR(100),
	Duracao CHAR(7) NOT NULL,	
	Classif_Etaria CHAR(7) NOT NULL CHECK (Classif_Etaria IN ('Livre','10 anos','12 anos','14 anos','16 anos','18 anos')),	
	Sinopse CHAR(1000) NOT NULL );

REM 'Tabela FILMES armazena as informacoes especificas dos filmes'
CREATE TABLE FILMES (
	ID_Esp CHAR(12) PRIMARY KEY REFERENCES Espetaculos ON DELETE CASCADE,
	Titulo_Original CHAR(50),	
	Ano NUMBER(4) NOT NULL,		
	Pais CHAR(20) NOT NULL,	
	Dub_ou_Leg CHAR(9) NULL CHECK (Dub_ou_Leg IN ('Dublado','Legendado',NULL)) );

REM 'Tabela PECAS_DE_TEATRO armazena as informacoes especificas das pecas de teatro'	
CREATE TABLE PECAS_DE_TEATRO (
	ID_Esp CHAR(12) PRIMARY KEY REFERENCES Espetaculos ON DELETE CASCADE,
	Produtor CHAR(20),
	Autor CHAR(20),
	Faixa_Etaria CHAR(8) NOT NULL CHECK (Faixa_Etaria IN ('Infantil','Adulto')) );

REM 'Tabela LOCAIS cadastra os locais disponiveis para os espetaculos, evitando entradas
REM com grafias erradas e facilitando a entrada dos dados atraves do ID_Loc.'
CREATE TABLE LOCAIS (
	ID_Loc CHAR(12) PRIMARY KEY,
	Cidade CHAR(20) NOT NULL,
	Estabelecimento CHAR(30) NOT NULL,
	Sala NUMBER(2) NOT NULL );

REM 'Tabela EVENTOS armazena as informacoes de local e horario dos espetaculos'
CREATE TABLE EVENTOS (
	Tipo CHAR(6) NOT NULL CHECK (Tipo IN ('Filme','Teatro')),
	ID_Esp CHAR(12) REFERENCES Espetaculos,
	ID_Loc CHAR(12) REFERENCES Locais,
	Horario TIMESTAMP NOT NULL,
	PRIMARY KEY (ID_Loc,Horario) );

COMMIT;

