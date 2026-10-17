-- uso de tabelas temporárias
create or alter procedure  sp_atualiza_Salario 
as 
begin 
	select * into #TabTemp from funcionarios 
	/* cria um tablea temporária com a mesma estrutura da  tabela funcionarios 
	atualiza o salario da seguinte forma: cada ano de vida equivale a 1% a mais no  
	salário do funcionario */
	update #TabTemp set func_salario = func_salario *  cast
	( '1.' + cast( DATEDIFF ( year , func_dataNasc , getdate()) as varchar) 
    as decimal(8,2) ) 
-- remove a coluna gerente_id da tabela temporária 
	alter table #TabTemp drop column  gerente_id 
-- retorna os dados da tabela temporárioa 
	select * from #TabTemp
end
execute  sp_atualiza_Salario
 
create procedure sp_funcionario_idade_1 as 
begin  
create table #func_temp ( 
codigo int, 
nome varchar(30), 
data_nascimento datetime, 
idade int) -- insere os dados na tabela temporária 
insert  into  #func_temp (codigo, nome, data_nascimento, idade)         
select  func_id, func_nome, func_datanasc, datediff( year, func_datanasc, 
getdate())as "Idade" 
from funcionarios -- seleciona os dados da tabela temporária 
select * from #func_temp 
end
 
execute sp_funcionario_idade_1
 
--cria uma tabela temporária LOCAL
create table #tab_temp_local (
	id int primary key,
	descricao varchar(40)
	)
 