--usando subconsultas com join
use Funcionarios
select f.func_id, f.func_nome, f.func_salario,
		c.cargo_nome
from Funcionarios f
inner join cargos c on c.cargo_id = f.cargo_id
 
--usando agora o subselect
select f.func_nome,
		(select a.ano from apontamentos a
		where a.func_id = f.func_id and
			a.ano = 2025 and a.mes = 7) ano,
		(select a.total_horas from apontamentos a
		where a.func_id = f.func_id and
			a.ano = 2025 and a.mes = 7) horas
			from Funcionarios f
 
--Mostrar a quantidade de funcionarios que cada cargo possui
 
--com join(preste atenção ao uso do LEFT
select c.cargo_nome, count(f.func_id) qtd
from cargos c
left join funcionarios f on c.cargo_id = f.cargo_id
group by c.cargo_nome
order by qtd
 
--com subselect
select c.cargo_nome,
		(select count(*) from Funcionarios f
		where f.cargo_id = c.cargo_id) qtd
from cargos c
order by qtd
 
--------------------------------------------------------
--mostra todos os funcionarios que possuir em seu cargo a palavra 'Jr'
select * 
from Funcionarios f
where f.cargo_id in (select c.cargo_id from cargos c
					 where c.cargo_nome like '%jr')
 
--com join
select * 
from Funcionarios f
left join cargos c on f.cargo_id = c.cargo_id
where c.cargo_nome like '%jr'
 
------------------------------------
--usando o subselect dentro de clausula FROM
select*
from (select * from Funcionarios f
	  where f.func_salario > 6000) temp
inner join cargos c on c.cargo_id = temp.cargo_id
 
--sem subselect
select f.func_nome, c.cargo_nome
from Funcionarios f
inner join cargos c on c.cargo_id = f.cargo_id
where f.func_salario > 6000
  
--Para cada exercício resolva-o com JOIN e dps com SubSelect
--1)Liste todos os dados dos filmes e o nome do genero
--com join
select m.CodMidia, m.DescMidia, m.ValorUnit, m.codGenero, m.quantidade, g.descricao as nomeGenero
from Midias m
inner join Genero g on m.CodGenero = g.CodGenero

--com SubSelect
select *, (select descricao from Genero g
			where m.Codgenero = g.Codgenero ) as nomeGenero 
			from Midias m

--2)Liste o nome do cliente e a quantidade de locações feitas por ele(join e group)
--com join
select c.cliente, count(l.CodLocacao) as qtdLocacao
from Cliente c
left join Locacao l on c.CodCli = l.CodCli
group by c.cliente

--com subselect
select c.cliente,(select count(l.CodLocacao)
				 from Locacao l
				 where c.CodCli = l.CodCli) as qtdLocacao
from Cliente c
order by c.cliente

--3)Resolva o exercício anterior mostrando somente os clientes que possuem mais que 2 locações(join,group e having)
--com join
select c.cliente, count(l.CodLocacao) as qtdLocacao
from Cliente c
left join Locacao l on c.CodCli = l.CodCli
group by c.cliente
having count(l.CodLocacao)>2

--com subselect

--4)Liste para cada locação a data da locação, o nome do filme e o nome do cliente(join)
--5)Faça a soma de todos os valores unitários de todos os filmes locados para cada locação. Mostrando o numero da locação e sua somatório só JOINS
