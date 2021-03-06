REM ----------------------------------------------------------------------------
REM MC536 - EXERCICIO PRATICO 2
REM ALUNO: HARALDO S. A. PEREIRA FILHO       RA: 003059
REM ----------------------------------------------------------------------------

INSERT INTO Generos VALUES ('Ação');
INSERT INTO Generos VALUES ('Aventura');
INSERT INTO Generos VALUES ('Comédia');
INSERT INTO Generos VALUES ('Documentário');
INSERT INTO Generos VALUES ('Drama');
INSERT INTO Generos VALUES ('Ficção Científica');
INSERT INTO Generos VALUES ('Musical');
INSERT INTO Generos VALUES ('Policial');
INSERT INTO Generos VALUES ('Romance');
INSERT INTO Generos VALUES ('Suspense');
INSERT INTO Generos VALUES ('Terror');

INSERT INTO Locais VALUES ('GUAICURUS_05','Fortaleza','Shopping Guaicurus','5');
INSERT INTO Locais VALUES ('GUAICURUS_06','Fortaleza','Shopping Guaicurus','6');
INSERT INTO Locais VALUES ('DOMJOAOVI_01','Campinas','Shopping Dom João VI','1');
INSERT INTO Locais VALUES ('DOMJOAOVI_12','Campinas','Shopping Dom João VI','12');

INSERT INTO Espetaculos VALUES ('FILME001','Aventura','As Crônicas de Spiderwick','Mark Waters','Freddie Highmore, Sarah Bolger, Seth Rogen','96 min','10 anos','Após a separação dos pais dois irmãos gêmeos e uma irmã encontram um livro mágico que o transportam para um mundo de fantásticas criaturas.');
INSERT INTO Filmes VALUES ('FILME001','The Spiderwick Chronicles','2008','Estados Unidos','Dublado');

INSERT INTO Espetaculos VALUES ('FILME002','Comédia','Polaróides Urbanas','Miguel Falabella','Marília Pera, Arlete Salles, Neuza Borges','82 min','14 anos','Um grupo de mulheres enfrentam diversos problemas na cidade do Rio de Janeiro.');
INSERT INTO Filmes VALUES ('FILME002',NULL,'2008','Brasil','Legendado');

INSERT INTO Espetaculos VALUES ('FILME003','Drama','Atos que Desafiam a Morte','Gilliam Armstrong','Catherine Zeta-Jones, Guy Pearce, Timothy Spall','97 min','10 anos','Em 1926, durante uma turnê, o mágico Hoidini se apaixona por uma médica escosesa, mas ela e a filha tentam desmascará-lo durante uma de suas apresentações.');
INSERT INTO Filmes VALUES ('FILME003','Death Defying Acts','2008','Reino Unido','Legendado');

INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('04/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('04/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('04/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('04/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('05/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('05/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('05/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('05/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('06/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('06/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('06/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('06/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('07/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('07/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('07/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('07/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('08/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('08/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('08/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('08/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('09/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('09/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('09/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('09/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('10/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('10/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('10/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','GUAICURUS_05',TO_TIMESTAMP('10/04/2008 19:30','DD/MM/YYYY HH24:MI'));

INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('04/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('04/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('04/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('05/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('05/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('05/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('06/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('06/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('06/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('07/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('07/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('07/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('08/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('08/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('08/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('09/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('09/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('09/04/2008 17:20','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('10/04/2008 13:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('10/04/2008 15:10','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME001','DOMJOAOVI_01',TO_TIMESTAMP('10/04/2008 17:20','DD/MM/YYYY HH24:MI'));

INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('08/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('09/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('10/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('11/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('12/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('13/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('14/04/2008 23:45','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 12:05','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 14:00','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 15:55','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 17:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 21:50','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME002','GUAICURUS_06',TO_TIMESTAMP('15/04/2008 23:45','DD/MM/YYYY HH24:MI'));

INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('06/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('06/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('06/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('07/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('07/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('07/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('08/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('08/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('08/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('09/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('09/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('09/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('10/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('10/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('10/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('11/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('11/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('11/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('12/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('12/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('12/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('13/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('13/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('13/04/2008 22:40','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('14/04/2008 19:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('14/04/2008 20:30','DD/MM/YYYY HH24:MI'));
INSERT INTO Eventos VALUES ('Filme','FILME003','DOMJOAOVI_12',TO_TIMESTAMP('14/04/2008 22:40','DD/MM/YYYY HH24:MI'));

COMMIT;

