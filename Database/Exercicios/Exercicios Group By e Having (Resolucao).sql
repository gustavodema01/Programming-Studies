/*
Lista de exercicios sobre Group By e Having
Utilizando o banco de dados de Locadora faça:
1) Exiba a quantidade de filmes que cada genero possui
2) Exiba os genero que possuem mais do que 4 filmes cadastrados
para ele
3) Exiba a somatoria dos valores unitarios das midias 
seperados por genero
4) Mostre quantas locacoes cada cliente fez
5) Mostre quantas locacoes foram feitas em cada mes
6) Qual o valor total gasto com locacoes que cada cliente
possui
7) Mostre somente as locacoes que possuem mais do que 3 filmes
cada uma
8) Qual a quantidade de filmes foram alugados por mes e
quantas locacoes cada mes possui
*/

use Locadora
go

select * from Locacao

--1) Exiba a quantidade de filmes que cada genero possui
select codGenero, count(*) qntFilmes 
from midias
group by codGenero

--2) Exiba os genero que possuem mais do que 4 filmes cadastrados para ele
select codGenero, count(*) qntFilmes 
from midias
group by codGenero
having count(*) > 4

--3) Exiba a somatoria dos valores unitarios das midias 
--separados por genero
select codGenero, sum(ValorUnit) totalVendidoMidias
from midias
group by codGenero

--4) Mostre quantas locacoes cada cliente fez
select CodCli, count(CodCli) locPorCli
from Locacao
group by CodCli

--5) Mostre quantas locacoes foram feitas em cada mes
select MONTH(DataLoc) mes, count(DataLoc) locPorMes
from Locacao
group by MONTH(DataLoc)

--6) Qual o valor total gasto com locacoes que cada cliente possui
select CodCli, sum(ValorTotalLoc) gastoTotal
from Locacao
group by CodCli

--7) Mostre somente as locacoes que possuem mais do que 3 filmes cada uma
select CodLocacao, COUNT(CodMidia)
from ItensLocacao
group by CodLocacao
having COUNT(CodLocacao) > 3

--8) Qual a quantidade de filmes foram alugados por mes e
--quantas locacoes cada mes possui
select MONTH(DataDev) mes, count(CodMidia) qntMidias, count(CodLocacao) qntLocacoes
from ItensLocacao
where MONTH(DataDev) is not null
group by MONTH(DataDev)

select *
from itensLocacao

