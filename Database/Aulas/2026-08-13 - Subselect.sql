--Usando subconsultas
--com join
select f.func_id, f.func_nome, f.func_salario, c.cargo_nome
from Funcionarios f
inner join cargos c on c.cargo_id = f.cargo_id

--usando o subselect
select f.func_id, f.func_nome, f.func_salario,
	(select c.cargo_nome from cargos c 
	where c.cargo_id = f.cargo_id) as nomeCargo
from funcionarios f

--listar o nome do funcionário, mes e total de horas que existem em seus apontamentos com join
select f.func_nome, a.mes, a.total_horas
from Funcionarios f 
left join apontamentos a on a.func_id = a.func_id

--com subselect
select f.func_nome,
	(select a.ano from apontamentos a 
		where a.func_id = f.func_id and
		a.ano = 2025 and a.mes = 7) ano,
	(select a.total_horas from apontamentos a 
		where a.func_id = f.func_id and
		a.ano = 2025 and a.mes = 7) horas
from funcionarios f

 