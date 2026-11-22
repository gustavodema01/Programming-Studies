--triggers de Update
create or alter trigger trg_upd_setor on setores
for update as
begin
	--lista os dados antigos
	select * from deleted
 
	--lista os dados novos
	select * from inserted
end
 
--chamada
update setores set setor_nome = 'ADM'
	where setor_id = 2
---------------------------------------------------------------------
--a soma do total de horas de tds o funcionarios de todos os meses não dá 400 horas
create or alter trigger trg_upd_apontamentos on funcionarios
for update as
begin
	declare @func_id int
	--quem é o funcionario?
	select @func_id = func_id from deleted
 
	declare @total decimal(10,2)
	--qual a somatoria original?
	set @total = (select sum(total_horas) from apontamentos
				  where func_id = @func_id)
	--pelo fato da trg ser (FOR) os dados já constam na tabela
	if @total > 400
	begin
		raiserror ('Somatoria > 400h', 16, 1)
		rollback tran
		return
	end
end
 
--chamada
update apontamentos set total_horas = 250
	where func_id = 10 and mes = 7
 
	--crie uma trigger que quando uma alteração de salario do funcionario ocorrer não permite
	-- que o salario seja aumentado em mais de 10% e tbm não permita que o salario seja reduzido
	--em qualquer valor
 
create or alter trigger trg_upd_Funcionario on funcionarios
for update as 
begin
	if(select count(*) from inserted) > 1
	begin
		raiserror ('Impossivel alterar varios funcionarios', 16,1)
		rollback tran
		return
	end
 
--captura os dados anteriores e atuais
	declare @sal_antigo decima(10,2) = (select d.func_salario
		from deleted d)
	declare @sal_atual decimal(10,2) = (select i.func_salario
		from inserted i)
 
	if @sal_atual < @sal_antigo
	begin
		raiserror('O salario não pode ser diminuido...', 16,1)
		rollback tran
	end
 
	if @sal_atual < @sal_antigo
	begin 
		raiserror('O salario aumenta mais que 10%',16,1)
		rollback tran
		return
	end
 
	--se chegou até aqui, deve fazer update
	update funcionarios set func_nome = i.func_nome,
							gerente_id = i.gerente_id,
							setor_id = i.setor_id,
							func_salario = i.func_salario,
							func_dataNasc = i.func_dataNasc,
							cargo_id = i.cargo_id,
							func_valorHora = i.func_valorHora
	from inserted
	inner join funcionarios f on i.func_id = f.func_id
end