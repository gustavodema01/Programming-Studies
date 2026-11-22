--Criando uma funçã escalar de calculo
CREATE OR ALTER FUNCTION fnc_AplicaAumento --estamos criando uma função chamada fnc_AplicaAumento.
(
--Aqui estamos dizendo quais informações a função precisa receber para funcionar.
	@p_valor decimal(10,2),
	@porc_aumento decimal(10,2) 
) returns decimal (10,2) as --quantidade máxima de dígitos.  quantidade de casas decimais.
 
begin
	return @p_valor + (@p_valor * @porc_aumento/100)
end
 
 
--chamada
--usando uma tabela com filtro
SELECT f.func_nome, f.func_salario Atual,
	db.fnc_AplicaAumento(f.func_salario,15) Novo
from Funcionarios f
where func_id in(1,10,20)
 
--somente o calculo
SELECT dbo.fnc_AplicaAumento(1000,15)
 
--lista todos os funcionarios que após aplicado o aumento de 15% ganham mais que 10000
SELECT * 
FROM Funcionarios f
WHERE dbo.fnc_AplicaAumento(f.func_salario, 15) > 10000
 
create or alter function fnc_Aumento
		(@salario decimal (10,2)) returns decimal(10,2)
	as
	begin
		declare @calculado decimal(10,2)
		if @salario < 5000
			set @calculado = @salario *1.15
		else if @salario < 10000
			set @calculado = @salario *1.10
		else
			set @calculado = @salario * 1.05
 
			return @calculado
 
--chamada 
select f.func_nome, f.func_salario. dbo.fnc_Aumento
	(f.func_salario) novo
from funcionarios f
 
 
--funcoes que retornam tabelas
create function fnc_RetornaTabelaFuncionarios
(
	@p_salario_inicial decimal(10,2),
	@p_salario_final decimal(10,2)
)
Returns table 
as 
Return
(
	select * from funcionarios
	where func_salario between @p_salario_inicial and
	@p_salario_final
)
 
--chamada
select * 
from dbo.fnc_RetornaTabelaFuncionarios(5000,7000) tab
where tab.setor_id = 10
 
--com join
select * 
from dbo.fnc_RetornaTabelaFuncionarios(5000,7000)tab
inner join setores s on s.setor_id = tab.setor_id
where tab.setor_id = 10