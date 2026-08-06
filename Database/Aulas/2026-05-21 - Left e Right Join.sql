--Usando LEFT e RIGHT join
--juntar funcionario e setor com left ou right
use Funcionarios
select*
from funcionarios f 
right join setores s on s.setor_id = f.setor_id

--listar todos os setores que NÃO possuem func
select*
from funcionarios f
right join setores s on s.setor_id = f.setor_id
where f.func_id is null

--este não funciona
select*
from funcionarios f
right join setores s on s.setor_id = f.setor_id
where f.gerente_id is null -- existem funcionarios
						   --que não possuem

--usando left
--listar todoso os setores que NÃO possuem
select s.*
from setores s 
left join funcionarios f on s.setor_id = f.setor_id
where f.func_id is null