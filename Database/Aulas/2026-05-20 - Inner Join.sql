-- Usando o INNER Join
--listar o codigo do func, nome do func, nome do setor onde trabalha
use Funcionarios

--funcionarios tab esquerda
--setores	tab direita
select f.func_id, f.func_nome, f.setor_id, s.setor_nome
from funcionarios as f
inner join setores as s on f.setor_id = s.setor_id

--seleciona todos os campos das duas tabelas
select *
from funcionarios as f
inner join setores as s on f.setor_id = s.setor_id

--fazendo a ligação entre 3 tabelas
select*
from funcionarios f
inner join setores s on s.setor_id = f.setor_id
inner join cargos c on c.cargo_id = f.cargo_id

--mesmo conceito do comando acima, porém não funciona
select*
from cargos c
inner join setores s on s.setor_id = f.setor_id
inner join funcionarios f on c.cargo_id = f.cargo_id

--quantos funcionarios trabalham em cada setor?

select count(func_id) as qtdfunc, setor_id
from funcionarios
group by setor_id 

--inserir unm novo setor 
insert into setores values(21, 'Cozinha')

--mostrar somemnte os setores q possuem mais q 30 func
select count(*) qtd, f.setor_id, s.setor_nome
from funcionarios f
inner join setores s on s.setor_id = f.setor_id
group by f.setor_id, setor_nome
having count(*) > 30