-- Uso do Having

-- EXEMPLO:
-- mostra o total de funcionários que trabalham em cada setor
select setor_id, count(*) qnt
from funcionarios
group by setor_id

----*********************************************************
-- WHERE
-- where filtra ou restringe os dados antes de serem processados pelo select
-- o engine funciona da seguinte forma:
-- 1° olha para o from, reconhecendo a tabela que vamos usar
-- 2° olha para o where, filtrando os dados/registros
-- 3° group by, separa por grupinhos
-- 4° processa os dados no select, criando uma visualização dos dados

-- nesse caso o where não vai funcionar, pq no momento que utilizar ele com 'qnt',
-- mas o campo 'qnt' ainda não existe no where
select setor_id, count(*) qnt
from funcionarios
where qnt < 20
group by setor_id

----*********************************************************
-- HAVING
-- having filtra ou restringe os dados depois de serem processados pelo select
-- o engine funciona da seguinte forma:
-- 1° olha para o from, reconhecendo a tabela que vamos usar
-- 2° olha para o where, filtrando os dados/registros
-- 3° group by, separa por grupinhos
-- 4° processa os dados no select, criando uma visualização dos dados
-- 5° agora olha para o having, com os resultados dessas funções, ele vai filtrar

-- o having vai precisar trabalhar depois do group by e com uma função de agrupamento
-- ele não reconhece o alias
select setor_id, count(*) qnt
from funcionarios
group by setor_id
having count(*) < 20