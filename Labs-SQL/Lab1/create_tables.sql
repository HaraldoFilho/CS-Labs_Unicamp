REM ----------------------------------------------------------------------------
REM MC536 - EXERCICIO PRATICO 1
REM ALUNO: HARALDO S. A. PEREIRA FILHO       RA: 003059
REM ----------------------------------------------------------------------------

CREATE TABLE Generos (
	Genero CHAR(20) PRIMARY KEY );

CREATE TABLE Espetaculos (
	ID_Esp NUMBER(3) PRIMARY KEY,
	Genero CHAR(20) NOT NULL REFERENCES Generos,
	Titulo CHAR(50) NOT NULL,
	Diretor CHAR(20),
	Elenco CHAR(100),
	Duracao NUMBER(3) NOT NULL,	
	Classif_Etaria CHAR(7) CHECK (Classif_Etaria IN ('Livre','10 anos','12 anos','14 anos','16 anos','18 anos')),	
	Sinopse CHAR(1000) NOT NULL );

CREATE TABLE Filmes (
	ID_Esp NUMBER(3) PRIMARY KEY REFERENCES Espetaculos ON DELETE CASCADE,
	Titulo_Original CHAR(50),	
	Ano NUMBER(4) NOT NULL,		
	Pais CHAR(20) NOT NULL,	
	Dub_ou_Leg CHAR(9) CHECK (Dub_ou_Leg IN ('Dublado','Legendado')) );
	
CREATE TABLE Pecas_de_Teatro (
	ID_Esp NUMBER(3) PRIMARY KEY REFERENCES Espetaculos ON DELETE CASCADE,
	Produtor CHAR(20),
	Autor CHAR(20),
	Faixa_Etaria CHAR(8) CHECK (Faixa_Etaria IN ('Infantil','Adulto')) );

