--Resolucao da 1ª Lista
create database exercicioDB
go 

use exercicioDB

--criar tabela
create table Aluno (
	RM int primary key, 
	NOME varchar(60),
	ESTADO varchar(2),
	NASCIMENTO smalldatetime
)

--inserindo dados
set dateformat mdy

insert into Aluno values
(5001,	'Asdronio da Silva',	'SP',	'12/24/1961'),
(5002,	'Severino Severá SeVou',	'MG',	'07/08/1967'),
(5003,	'Juvenal Juvênio',	'MG',	'05/21/1975'),
(5004,	'Ambrósio Adelino Xavier',	'PA',	'02/17/1949'),
(5005,	'Adelino da Silva Sauro',	'RJ',	'06/30/1985'),
(5006,	'Adamastor Augusto',	'SP',	'09/21/1974'),
(5007,	'Chapecó Iramir  da Silva',	'RJ',	'07/07/1947'),
(5008,	'Carlitos Tevez', 	'BU',	'11/06/1985'),
(5009,	'Silvio Santos',	'SP',	'12/11/1935')

select * from Aluno
--1-) Selecione RM e NOME de todos os alunos que começam 
--com a letra ‘A’.
select a.RM,a.NOME
from aluno a
where nome like 'a%'

--2-) Selecione todos os campos de todos os alunos que 
--nasceram no ano de 1985, para isso, utilize a função
-- year(data). 
select *
from aluno as a
where year(a.NASCIMENTO) = 1985


--3-) Selecione o Nome e o Nascimento dos alunos cuja data de 
--nascimento seja menor que 1950.
select a.NOME, a.NASCIMENTO
from aluno a
where year(NASCIMENTO) < 1950

--4-) Selecione todos os campos dos alunos que nasceram no 
--mês 7. Para isso utilize a função Month(data). Por ordem 
--alfabética.
select *
from aluno a
where MONTH(NASCIMENTO) = 7
order by nome

--5-) Selecione o Nome e a data de nascimento de todos os 
--alunos que nasceram antes do dia 20 (utilize a função 
--day(data) ) e o ano de nascimento seja inferior a 1985.
select a.NOME, a.NASCIMENTO
from aluno a
where day(NASCIMENTO) < 20 and year(NASCIMENTO) < 1985

--6-) Selecione todas as informações de alunos por ordem 
--decrescente de data de nascimento.
select *
from aluno a
order by NASCIMENTO desc

--7-) Selecione apenas o Nome e o ano de nascimento dos 
--alunos. Para isso utilize a função year(data) no comando 
--select: select nome, year(nascimento) from alunosXXXX 
--Você pode dar um nome para o resultado da função year. 
--Ex: select nome, year(nascimento) “ANO” from alunosXXXX. 
-- Selecione por ordem decrescente de ano. Utilize o nome 
--dado para ordenar. Ex: order by ANO.
select a.NOME, year(a.NASCIMENTO) ano
from aluno a
order by ano desc
--order by year(a.NASCIMENTO) desc

--8-) Selecione o Nome, o dia, o mês  e o ano de nascimento 
--dos alunos em colunas separadas. Para isso utilize as funções
-- day(data), month(data), year(data)  como no exemplo anterior. 
select a.NOME, day(NASCIMENTO) dia, month(NASCIMENTO) mes,
	   year(NASCIMENTO) as ano
from aluno a

--9-) Modifique o nome do aluno de RM 5001 para 
--“Adrônio da Silva Silveira”
update aluno set nome = 'Adrônio da Silva Silveira'
where rm = 5001

select * from Aluno where rm = 5001
--10-) Modifique em um único update as seguintes 
--informações do aluno 5002: O nome para “Severino Seviu 
--Denovo” e a data de nascimentto para ‘08/08/1967’
update aluno set nome='Severino Seviu Denovo',
				 nascimento = '08/08/1967'
where rm = 5002
select * from Aluno where rm = 5002
--11-) Altere o estado daqueles que nasceram no ‘RJ’ 
--para ‘PE’
update aluno set estado = 'PE'
where estado = 'RJ'

--12-) Adicione, em um único comando update, o sobrenome 
--‘SANTOS’ a todos os alunos cujo nome contém a palavra 
--‘SILVA’
update aluno set nome += ' SANTOS'
where nome like '%SILVA%'

--solucao para quem criou o campo nome com CHAR(60)
update aluno set nome = RTRIM(nome) +  ' SANTOS'
where nome like '%SILVA%'

 
 --D)
--13-)  Apague o aluno de RM  5006.
delete from aluno where rm = 5006

--14-) Apague todos os alunos cujo ano de nascimento seja inferior 
--a 1970.
delete from aluno where YEAR(nascimento) < 1970

--15-) Apague todos os alunos  cujo RM seja diferente de 5008.
delete from aluno where rm != 5008

--16-) Apague o “Carlitos”
delete from aluno where nome like 'Carlitos%'



