--SP para listar todos os funcionarios do setor 3
create or alter procedure sp_lista_func_3 as
begin
	select * 
	from funcionarios
	where setor_id = 3
end
--chamando da sp
exec sp_lista_func_3
-----------------------------------------
--procedure com parametros de entrada
create or alter procedure sp_lista_func (@setor_id int) as
begin
	select *
	from funcionarios
	where setor_id = @setor_id
end
--chamada (lista só o setor 7)
exec sp_lista_func 8
-----------------------------------------
create or alter procedure sp_primo(@numero int) as
begin
      declare @cont int = 2
      while @cont < @numero
      begin 
          if @numero % @cont = 0
              return 0
         set @cont += 1
      end
--se chegou até aqui o número é primo
return 1
end
-- chamada 
declare @ret int
exec @ret = sp_primo 7
if @ret = 0
print ' este número não é primo'
else
print 'Este número é primo'
--------------------------------------------------------------------------
--procedure que recebe parametros e devolve dois dados de retorno, uso do termo 'out' 'output'
create or alter procedure sp_cargo_maior_menor(
					@cargo_id int,
					@menor decimal(10,2) out,
					@maior decimal(10,2) output) as
begin
	set @menor = (select min(func_salario) from funcionarios
					where cargo_id = @cargo_id)
	set @maior = (select max(func_salario) from funcionarios
					where cargo_id = @cargo_id)
--ou os dois juntos
select @menor = min(func_salario), @maior = max(func_salario)
from funcionarios 
where cargo_id = @cargo_id
end
 
--chamada
--cria as variaveis de output
--não precisa ser o mesmo nome da variavel da SP
declare @maior decimal(10,2)
declare @menor decimal(10,2)
exec sp_cargo_maior_menor 10, @menor out, @maior out
print concat ('Menor =', @menor)
print concat( 'Maior =', @maior)

