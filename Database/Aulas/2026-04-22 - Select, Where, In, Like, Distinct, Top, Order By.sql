-- ============ FUNÇÕES DE SELECT ============
use Funcionarios

-- ESCOLHER CAMPOS ESPECÍFICOS
select func_nome, func_salario, cargo_id from funcionarios

-- USANDO UM APELIDO (TODAS AS CONDIÇÕES ABAIXO FUNCIONAM IGUAL)
select func_nome as 'Nome',
func_salario 'Salário',
setor_id Numero_Setor,
func_dataNasc [Data Nascimento]
from funcionarios

-- USANDO O WHERE (RESTRIÇÃO)
select func_nome, func_salario, setor_id, cargo_id
from funcionarios
where setor_id = 12 or cargo_id = 15

-- LISTAR TODO MUNDO QUE NASCEU ANTES DE 1980 
select * from funcionarios
where year (func_dataNasc) < 1980

-- LISTAR TODO FUNCIONARIO QUE NÃO TEM GERENTE
select * from funcionarios where gerente_id is null

-- LISTAR TODOS OS FUNCIONÁRIOS QUE GANHAM ENTRE 6000 E 8000 REAIS
select * from funcionarios where func_salario between 6000 and 8000
-- EQUIVALE A:
-- ============ FUNÇÕES DE SELECT ============
use Funcionarios

-- ESCOLHER CAMPOS ESPECÍFICOS
select func_nome, func_salario, cargo_id from funcionarios

-- USANDO UM APELIDO (TODAS AS CONDIÇÕES ABAIXO FUNCIONAM IGUAL)
select func_nome as 'Nome',
func_salario 'Salário',
setor_id Numero_Setor,
func_dataNasc [Data Nascimento]
from funcionarios

-- USANDO O WHERE (RESTRIÇÃO)
select func_nome, func_salario, setor_id, cargo_id
from funcionarios
where setor_id = 12 or cargo_id = 15

-- LISTAR TODO MUNDO QUE NASCEU ANTES DE 1980 
select * from funcionarios
where year (func_dataNasc) < 1980

-- LISTAR TODO FUNCIONARIO QUE NÃO TEM GERENTE
select * from funcionarios where gerente_id is null

-- LISTAR TODOS OS FUNCIONÁRIOS QUE GANHAM ENTRE 6000 E 8000 REAIS
select * from funcionarios where func_salario between 6000 and 8000
-- EQUIVALE A:
select * from funcionarios where func_salario >= 6000 and func_salario <= 8000

-- ENTRE DATAS:
set dateformat ymd
select * from funcionarios where func_dataNasc between '1990/04/30' and '1996/06/01'

-- USO DO IN LISTA
-- LISTAR OS FUNCIONÁRIOS QUE TRABALHAM NO SETOR 3 OU 12 OU 20
select * from funcionarios where setor_id in (3, 12, 20)


select * from funcionarios
where func_dataNasc in ('1997/08/17', '1979/03/22')
--equivale a:
select * from funcionarios
where func_dataNasc = '1997/08/17' or func_dataNasc = '1979/03/22'

--------------------------------------------------------------
--Uso do LIKE
--todos os funcionarios que começam com as letras OT
select * from funcionarios where func_nome like 'OT%'
 
--todos os funcionarios que TERMINAM com rocha
select * from funcionarios where func_nome like '%cardoso'
 
--todos os funcionarios que tenham ri em qualquer parte do nome
select * from funcionarios where func_nome like '%ri%'

--todos os funcionarios que a 2ª letra do nome é 'a'
select * from funcionarios where func_nome like '_a%'

--todos os funcionarios que a penultima letra é 'r'
select * from funcionarios where func_nome like '%r_'

------------------------------------------------------------------
--Uso do distinct

select distinct func_nome from funcionarios

--mostrar todos os setor_id distintos
select distinct setor_id from funcionarios

select distinct setor_id, func_nome from funcionarios

---------------------------------------------------
--uso do TOP
--listar somente os 10 primeiros registros
select top 10 * from funcionarios

--listar os 10 maiores salarios
select top 10 * from funcionarios order by func_salario desc

----------------------------------------------------
--Clausula Order By
--listar o nome do func e sua data de nascimento
--ordenando do mais velho para o mais novo
select func_nome, func_dataNasc from funcionarios order by func_dataNasc asc
--ou
--order by func_dataNasc

--listar os funcionarios ordenados por setor_od asc
--e o salario desc
select * from funcionarios order by setor_id, func_salario desc

select * from funcionarios order by setor_id, cargo_id, func_salario desc

select * from funcionarios