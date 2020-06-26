// MC536 - EXERCICIO PRATICO 5
// Gabriel Silva Patriarca (032969)
// Jonatas Botelho da Silva (033546)
// Haraldo S. A . Pereira Filho (003059)
// Márcio de Carli (962833)
// Marius Schnittert (086169)

// 1

select Ev.eHorario, count (B.idBilhete) , Esp.titulo, B.idBilhete 
	from Eventos Ev, Espetaculo Esp, Bilhete B, Usuario U, Compra C
	where U.nome = 'X' 
	and C.USUARIO_idUsuario = U.idUsuario 
	and B.COMPRA_idCompra = C.idCompra
	and B.EVENTO_idevento = Ev.idevento
	and Ev.ESPETACULO_idEspetaculo = Esp.idEspetaculo
;

// 2

select Esp.titulo
	from Espetaculo Esp, Evento Ev, Bilhete B
	where 
	(SELECT sum(B.PRECO) from Espetaculo Esp, Evento Ev, Bilhete B 
		where B.EVENTO_idevento = Ev.idevento 
		and Ev.ESPETACULO_idEspetaculo = Esp.idEspetaculo) > 20000
	and Ev.ESPETACULO_idEspetaculo = Esp.idEspetaculo
	and B.EVENTO_idevento = Ev.idevento
	and Ev.etipo = 'Filme'
	group by Esp.titulo
;
 
// 3

select Esp.titulo, L.estabelecimento, Ev.ehorario 
	from evento Ev, espetaculo Esp, local L 
	where Ev.local_idlocal = L.idlocal
	and Ev.etipo = 'TEATRO'
	and Ev.espetaculo_idEspetaculo = Esp.idEspetaculo 
	and (L.vagasA - Ev.dispA)/L.vagasA > 0.7
;

// 4

select titulo 
	from espetaculo, bilhete, evento 
	where espectador = 'JOAQUIM' 
	and Evento_idEvento = idEvento 
	and espetaculo_idespetaculo = idespetaculo 
	and elenco like '%Sarah%'
;

// 5

create view top10 as select Esp.idEspetaculo as espetaculo, avg((L.vagasA - Ev.dispA)/L.vagasA) as lotacao_media
		from Espetaculo Esp, Evento Ev, local L
		where Ev.local_idlocal = L.idlocal
		and Ev.etipo = 'TEATRO'
		and Ev.espetaculo_idEspetaculo = Esp.idEspetaculo
		group by Esp.idEspetaculo
		order by lotacao_media
		limit 10
;

create view max_lot as select Ev.espetaculo_idEspetaculo as espetaculo, max((L.vagasA - Ev.dispA)/L.vagasA) as lotacao_maxima
		from Evento Ev, local L
		group by EV.espetaculo_idEspetaculo
;
		
create view hor_max as select distinct Ev.espetaculo_idEspetaculo as espetaculo, Ev.ehorario as horario
	from Evento Ev, local L , max_lot m 
	where Ev.espetaculo_idespetaculo = m.espetaculo
	and ((L.vagasA - Ev.dispA)/L.vagasA) = m.lotacao_maxima
;

select distinct Esp.titulo, Esp.diretor, h.horario
	from max_lot m, hor_max h, Espetaculo Esp, Evento Ev, local L
	where Ev.local_idlocal = L.idlocal
	and Ev.etipo = 'TEATRO'
	and Esp.idEspetaculo = Ev.espetaculo_idespetaculo
	and Esp.idespetaculo in (select espetaculo from top10)
	and Esp.idespetaculo in (select espetaculo from max_lot)
	and Esp.idespetaculo = h.espetaculo
;

// 6

create view bilhetes_por_usuario_em_2008 as select U.idUsuario, U.Nome, count(*) as "num_bilhetes"
	from usuario U, bilhete B, compra C 
	where U.idUsuario = C.USUARIO_idUsuario
	and C.idCompra = B.COMPRA_idCompra
	and C.dataHora between '2008-01-01' and '2008-12-31'
	group by USUARIO_idUsuario
;

select Nome from bilhetes_por_usuario_em_2008
	where Nome like 'C%'
	and num_bilhetes > 2
	and idUsuario not in (select distinct U.idUsuario
							from Usuario U, Bilhete B, Compra C, Evento E
							where U.idUsuario = C.USUARIO_idUsuario
							and C.idCompra = B.COMPRA_idCompra
							and E.idevento = B.EVENTO_idevento
							and E.etipo = 'TEATRO'
							and E.eHorario between '2008-04-01 00:00:00' and '2008-04-30 23:59:59')
;

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione todos os Clientes cujo nome começa com a letra 'C', compraram mais de
// dois ingressos em 2008 para espectadores que não assistiram a peças de teatro 
// no mês de Abril de 2008.

// 7

select U.Nome, sum(total)
	from usuario U, compra C 
	where U.idUsuario = C.USUARIO_idUsuario
	group by USUARIO_idUsuario
	having sum(total) > 500
;

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione o nome e o valor total em compras de todos 
// os clientes cujo valor total em compras é maior que 500.

// 8

select U.Nome, C.idCompra
	from Usuario U
	left outer join Compra C
	on U.idUsuario = C.USUARIO_idUsuario
;	

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione todos os usuarios e suas respectivas compras mesmo que
// um usuario nao tenha compra.

select Esp.titulo, Ev.etipo, Ev.eHorario 
	from Espetaculo Esp
	left outer join Evento Ev
	on Ev.ESPETACULO_idEspetaculo = Esp.idEspetaculo
;

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione titulo, tipo e horario de todos os espetaculos
// mesmo que o espetaculo ainda não esteja associado a um evento.

// 9

select C.idCompra, B.cat
	from Compra C, Bilhete B
	where C.idCompra = B.COMPRA_idCompra
	and B.cat = 'A'
union select C.idCompra, B.cat
	from Compra C, Bilhete B
	where C.idCompra = B.COMPRA_idCompra
	and B.cat = 'B'
;	

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione as compras em que foram comprados bilhetes da categoria A OU da categoria B

select C.idCompra, B.cat
	from Compra C, Bilhete B
	where C.idCompra = B.COMPRA_idCompra
	and B.cat = 'A'
intersect select C.idCompra, B.cat
	from Compra C, Bilhete B
	where C.idCompra = B.COMPRA_idCompra
	and B.cat = 'B'
;	

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione as compras em que foram comprados bilhetes da categoria A E da categoria B

// Obs2:
// Essa consulta não funciona em MySQL, pois INTERSECT não é suportado.

select C.idCompra, B.cat
	from Compra C, Bilhete B
	where C.idCompra = B.COMPRA_idCompra
	and B.cat = 'A'
except select C.idCompra, B.cat
	from Compra C, Bilhete B
	where C.idCompra = B.COMPRA_idCompra
	and B.cat = 'B'
;	

// Obs:
// Essa consulta atende ao seguinte requisito:
// Selecione as compras em que foram comprados bilhetes da categoria A mas não da categoria B

// Obs2:
// Essa consulta não funciona em MySQL, pois EXCEPT não é suportado.

// 10

select C.idCompra
	from Compra C
	where exists (select * 
					from bilhete B 
					where C.idCompra = B.COMPRA_idCompra
					and B.cat = 'A')
;

select C.idCompra
	from Compra C
	where C.idCompra in (select B.COMPRA_idCompra 
					from bilhete B 
					where B.cat = 'A')
;

select C.idCompra
	from Compra C
	where C.idCompra = any (select B.COMPRA_idCompra 
					from bilhete B 
					where B.cat = 'A')
;

// Obs:
// Essas consultas atendem ao seguinte requisito:
// Selecione as compras em que foram comprados bilhetes da categoria A.




	