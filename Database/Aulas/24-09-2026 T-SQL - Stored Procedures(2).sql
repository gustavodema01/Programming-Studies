--SP que não permite a inclsão de funcionarios em setores com 16 ou mais funcioanrios
 
create or alter procedure sp_insere_func_prof
	(@func_id int, @func_nome varchar(30), @gerente_id int, 
	@setor_id int, @func_salario decimal(10,2),
	@func_datasc smalldatetime, @cargo_id int, 
	@func_valorHora decimal(10,2)) as
begin
 
	--quantos func estão no setor_id
	declare @qtd int
 
	set @qtd = (select count(*) from funcionarios
				where setor_id = @setor_id)
 
 
	--verifica se tem mais de 16
	if @qtd >= 16
	begin 
		raiserror('Setor Lotado', 1, 16)
		return -1
	end
 
	--Faz a inserção 
	insert into funcionarios values (@func_id, @func_nome, @gerente_id, 
	@setor_id, @func_salario, @func_datasc, @cargo_id,
	@func_valorHora)
 
	if @@error > 0
	begin
		raiserror('Erro na Inclusão', 1, 16)
		return -1
	end