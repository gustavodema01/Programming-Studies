--incluindo dados na tabela
use ExercicioPedro

------------------------------------------------------------------
--inserindo cidades
insert into Cidade (codCidade, descricao) values (1, 'São Bernardo do Campo')

insert into Cidade (codCidade, descricao) values (2, 'Mauá')

select * from Cidade

-------------------------------------------------------------------
--inserindo um Forum
insert into Forum
values (1, 1, 'Forum do Centro', 'Rua do centro'),
	   (2, 1, 'Forum da Cidade', 'Rua da Prefeitura, 234')


select * from Forum

--------------------------------------------------------------------
--inserindo Advogados
insert into Advogado (data_nasc, codAdvogado, nome, numOAB)
values ('12/30/1998', 1, 'Felisberto Alves', '1234-567')

insert into Advogado (data_nasc, codAdvogado, nome, numOAB)
values ('05/15/2000', 2, 'Antonio Paez', '9876-543')

--acertar o formato da data
set dateformat mdy

select * from Advogado

---------------------------------------------------------------------
--fazendo atualizações na tabela
update Forum set nome = 'Forum Maria Clara'
	   where codForum = 2	

--troca para TODOS os foruns a  cidade = 2
update Forum set codCidade = 2

--troca a data de nasc e numOAB de todos os Felisberto
update Advogado set data_nasc = '07/25/1963 10:10:10',
					numOAB = '987-111'
where nome = 'Felisberto Alves'

update Advogado set nome = 'Lucas Pereira'
		where codAdvogado = 2

update Advogado set data_nasc = '03/31/2001 10:10:10',
					numOAB = '123-456'
where nome = 'Lucas Pereira'

select * from Forum

alter table Advogado
		add numOAB varchar(10)