--uso do case when
select func_id, ano, total_horas,
	case mes
		when 1 then 'Janeiro'
		when 2 then 'Fevereiro'
		when 3 then 'Março'
		when 4 then 'Abril'
		when 5 then 'Maio'
		when 6 then 'Junho'
		when 7 then 'Julho'
		when 8 then 'Agosto'
		when 9 then 'Setembro'
		when 10 then 'Outubro'
		when 11 then 'Novembro'
		when 12 then 'Dezembro'
		else 'Sem definição'
	end as Mês
from apontamentos
-----------------------------------------------
--Uso do searched case
select func_id, func_nome, func_salario,
		case 
			when func_salario<1500
				then 'Ganha pouco'
			when func_salario>=1500 and func_salario<4000
				then 'Ganha bem'
			when func_salario >=4000
				then 'Ganha muito'
		end resultado
from Funcionarios f
