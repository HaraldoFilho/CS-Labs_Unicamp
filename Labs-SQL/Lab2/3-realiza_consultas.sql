REM ----------------------------------------------------------------------------
REM MC536 - EXERCICIO PRATICO 2
REM ALUNO: HARALDO S. A. PEREIRA FILHO       RA: 003059
REM ----------------------------------------------------------------------------

REM 'View EM_CARTAZ criada para facilitar as consultas'
CREATE VIEW EM_CARTAZ (TIPO,TITULO,LOCAL,CIDADE,SALA,DUB_ou_LEG,DATA,HORA) 
	AS SELECT Tipo,Titulo,Estabelecimento,Cidade,Sala,Dub_ou_Leg,to_char(horario,'DD/MM/YYYY'),to_char(horario,'HH24:MI') 
	FROM Eventos Ev, Espetaculos Es, Filmes F, Locais L WHERE  Ev.ID_Esp=Es.ID_Esp AND Ev.ID_Loc=L.ID_Loc AND Es.ID_Esp=F.ID_Esp;
	
COMMIT;


SELECT DISTINCT TITULO AS "FILMES" FROM EM_CARTAZ WHERE DATA='06/04/2008' AND HORA='19:30';

SELECT TITULO "FILME",LOCAL,CIDADE,SALA,DATA,HORA FROM EM_CARTAZ WHERE DUB_OU_LEG='Legendado';

