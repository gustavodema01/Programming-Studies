DECLARE @idade INT
DECLARE @nome VARCHAR(100)

-- Atribuindo dados às variáveis
-- SET é uma forma de atribuir um valor à variável
SET @nome = 'Joana Ribeiro'
SET @idade = 23

-- Exibindo os dados
PRINT CONCAT(@nome, ' tem ', @idade, ' anos')

-- Outra forma
SELECT @nome, @idade


--------------------------------------------------
-- Obtendo dados da tabela e colocando em variável

DECLARE @salario DECIMAL(10,2)

SET @salario = (
    SELECT SUM(func_salario)
    FROM funcionarios
)

-- OU

SELECT @salario = SUM(func_salario)
FROM funcionarios

PRINT 'Total pago em salários: ' + CAST(@salario AS VARCHAR(20))

-- OU, usando CONCAT, sem precisar de CAST
PRINT CONCAT('Total pago em salários: ', @salario)

-- Pode dar erro por tentar concatenar tipos diferentes:
PRINT 'Total pago em salários: ' + @salario


--------------------------------------------------
-- Uso do comando IF

DECLARE @qtd INT

-- Descobre a quantidade de funcionários
SET @qtd = (
    SELECT COUNT(*)
    FROM funcionarios
)

-- Verificação
IF @qtd > 400
BEGIN
    PRINT CONCAT('Sua empresa tem ', @qtd, ' funcionarios')
    PRINT 'Ela é muito grande...'
END
ELSE
BEGIN
    PRINT CONCAT('Sua empresa tem ', @qtd, ' funcionarios')
    PRINT 'Ela precisa crescer muito...'
END


--------------------------------------------------
-- Fazendo um laço de repetição

DECLARE @counter SMALLINT

SET @counter = 1

WHILE @counter < 5
BEGIN
    SELECT RAND() AS RandomNumber
    PRINT RAND()

    -- Incrementa o contador
    SET @counter = @counter + 1
END

GO