--Exercícios de revisão
--Usando o banco de dados de Funcionarios selecione:

/*
1)Liste a quantidade de funcionarios que existe em cada setor, mostre
o codigo do setor, nome do setor e quantidade
*/
use Funcionarios
select COUNT(func_id) as qtdSetor, f.setor_id, setor_nome
from Funcionarios f
INNER JOIN setores s on f.setor_id = s.setor_id
group by f.setor_id, setor_nome
order by setor_id

/*
2)Mostre todos os cargos que não possuem funcionarios para ele
*/
select cargo_nome
from cargos c
left join funcionarios f on f.cargo_id = c.cargo_id
where func_id is null

/*
3)mostre para cada funcionario seu nome e o total de horas trabalhadas
por ano
*/
select func_nome, a.total_horas
from funcionarios f
inner join apontamentos a on f.func_id = a.func_id

/*
4)Liste o nome do funcionario, nome do setor e nome do cargo que trabalha,
somente para os funcionarios que ganham por hora entre 40 e 60 reais
*/
select func_nome, setor_nome, cargo_nome
from funcionarios f
inner join setores s on s.setor_id = f.setor_id
inner join cargos c on c.cargo_id = f.cargo_id
where func_valorHora between 40 and 60