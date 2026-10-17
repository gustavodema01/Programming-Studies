-- TRIGGER DE INCLUSAO: VALIDAR NOME COMPOSTO
-- Versao 1: utiliza uma variavel para armazenar o nome
-- Atencao: adequada apenas para uma linha inserida por vez

CREATE OR ALTER TRIGGER trg_verificaNome
ON funcionarios
FOR INSERT
AS
BEGIN
    DECLARE @func_nome VARCHAR(50)

    -- Busca o nome do funcionario inserido
    SET @func_nome = (SELECT func_nome FROM inserted)

    -- Verifica se o nome possui sobrenome
    IF CHARINDEX(' ', @func_nome, 1) = 0
    BEGIN
        RAISERROR('Nome deve ser composto', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END
GO


-- TRIGGER DE INCLUSAO: VALIDAR NOMES COMPOSTOS
-- Versao 2: permite validar multiplos registros

CREATE OR ALTER TRIGGER trg_verificaNome
ON funcionarios
FOR INSERT
AS
BEGIN
    DECLARE @qtdNomes INT

    -- Conta os nomes sem sobrenome
    SET @qtdNomes = (
        SELECT COUNT(*)
        FROM inserted
        WHERE CHARINDEX(' ', func_nome, 1) = 0
    )

    -- Se houver nome invalido, cancela a inclusao
    IF @qtdNomes > 0
    BEGIN
        RAISERROR('Nome deve ser composto', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END
GO


-- TRIGGER DE INCLUSAO: PROIBIR MULTIPLOS REGISTROS
-- Versao 3: permite apenas um registro por comando
-- Tambem valida se o nome e composto

CREATE OR ALTER TRIGGER trg_verificaNome
ON funcionarios
FOR INSERT
AS
BEGIN
    -- Verifica se mais de um registro foi inserido
    IF (SELECT COUNT(*) FROM inserted) > 1
    BEGIN
        RAISERROR(
            'Nao e permitido inserir 2 ou mais registros',
            16, 1
        )
        ROLLBACK TRANSACTION
        RETURN
    END

    DECLARE @qtdNomes INT

    -- Verifica se o nome possui sobrenome
    SET @qtdNomes = (
        SELECT COUNT(*)
        FROM inserted
        WHERE CHARINDEX(' ', func_nome, 1) = 0
    )

    IF @qtdNomes > 0
    BEGIN
        RAISERROR('Nome deve ser composto', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END
GO


-- TESTES DE INCLUSAO
-- Execute os testes conforme a versao da trigger estudada

-- Inclusao de um funcionario com nome simples
INSERT INTO funcionarios
VALUES (500, 'Beatriz', 476, 1, 3593.88,
        '1996/12/03', 20, 12.87)
GO

-- Inclusao de um funcionario com nome composto
INSERT INTO funcionarios
VALUES (501, 'Bruna Santos', 476, 1, 3593.88,
        '1996/12/03', 20, 12.87)
GO

-- Tentativa de inclusao de multiplos registros
INSERT INTO funcionarios
VALUES
(502, 'Clara Nunes', 470, 2, 4593.88,
 '1986/12/03', 20, 12.87),
(503, 'Beatriz Cardoso', 365, 4, 6799.88,
 '1976/12/03', 20, 12.87)
GO


-- ADICIONANDO CAMPOS NA TABELA SETORES

ALTER TABLE setores
ADD
    qtdMaximo INT NULL,
    qtdAtual INT DEFAULT 0
GO


-- ATUALIZANDO A QUANTIDADE ATUAL DE FUNCIONARIOS

UPDATE setores
SET qtdAtual = (
    SELECT COUNT(*)
    FROM funcionarios f
    WHERE f.setor_id = setores.setor_id
)
GO


-- DEFININDO O LIMITE DE FUNCIONARIOS POR SETOR
-- Exemplo: limite atual + 1

UPDATE setores
SET qtdMaximo = qtdAtual + 1
GO


-- TRIGGER PARA VALIDAR O LIMITE DO SETOR

CREATE OR ALTER TRIGGER trg_validaSetor
ON funcionarios
FOR INSERT
AS
BEGIN
    -- Identifica o setor do funcionario inserido
    DECLARE @setor_id INT =
        (SELECT setor_id FROM inserted)

    -- Verifica se o setor atingiu o limite
    IF (
        SELECT qtdMaximo - qtdAtual
        FROM setores
        WHERE setor_id = @setor_id
    ) <= 0
    BEGIN
        RAISERROR('Numero maximo atingido...', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END

    -- Atualiza a quantidade de funcionarios do setor
    UPDATE setores
    SET qtdAtual = qtdAtual + 1
    WHERE setor_id = @setor_id
END
GO


-- TESTANDO A TRIGGER DE LIMITE POR SETOR

INSERT INTO funcionarios
VALUES (504, 'Roberto Justus', 3, 1, 9500,
        '1990/10/20', 17, 43.99)
GO

-- Consultando funcionarios
SELECT * FROM funcionarios

-- Consultando setores
SELECT * FROM setores
GO


-- CONSULTAS E MANUTENCAO

-- Consultar funcionarios
SELECT * FROM funcionarios

-- Consultar setores
SELECT * FROM setores

-- Exemplo de exclusao: informe um ID valido
-- DELETE FROM funcionarios WHERE func_id = 500
GO


-- ATIVIDADE: CRIAR TRIGGER DE EXCLUSAO
-- Objetivo: ao excluir um funcionario, atualizar qtdAtual
-- do setor correspondente.
