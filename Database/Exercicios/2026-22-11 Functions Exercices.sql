--Crie uma função chamada fn_ValorEstoque que:
--1. Receba o id_produto como parâmetro.
--2. Consulte o preço e o estoque desse produto.
--3. Retorne o valor total em estoque, calculado por:

--FUNÇÃO DE TABELA
CREATE FUNCTION fn_ValorEstoque
(
 @id_produto int
)
RETURNS TABLE
AS
RETURN
(
	SELECT preco, estoque, preco*estoque as ValorTotal
	FROM Produto
	WHERE id_produto = @id_produto
)    

SELECT * FROM fn_ValorEstoque(2) 

--FUNÇÃO ESCALAR
CREATE FUNCTION fn_ValorEstoquee
(
 @id_produto int
)
RETURNS DECIMAL
AS
BEGIN
	DECLARE @resultado decimal
	SELECT @resultado = preco* estoque from Produto
	RETURN @resultado
END

SELECT fn_ValorEstoquee(1,80,1) as ValorEstoque

--Considere a tabela Produto
--Crie uma função chamada fn_ProdutosEstoqueBaixo que:
--1. Receba como parâmetro uma quantidade mínima de estoque (@estoque_minimo).
--2. Retorne todos os produtos cujo estoque seja menor que esse valor.
--3. Retorne as colunas id_produto, preco e estoque.
--4. Considere somente produtos ativos (ativo = 'S').

CREATE FUNCTION fn_ProdutosEstoqueBaixo
(
	@estoque_minimo int
)
RETURNS TABLE
AS
RETURN
(

	SELECT p.id_produto, p.preco, p.estoque
	FROM Produto p
	WHERE estoque < @estoque_minimo
	AND ativo = 'S'
)

SELECT * FROM fn_ProdutosEstoqueBaixo(1)


--Uma loja deseja consultar o valor total investido em estoque para cada produto. Para isso, desenvolva uma função 
--chamada fn_CalcularValorEstoque que receba como parâmetro o código de um produto e retorne o valor total correspondente.

--O valor total deve ser calculado multiplicando o preço unitário pela quantidade disponível em estoque.
--1. A função deve receber o código do produto como parâmetro.
--2. Deve consultar os dados na tabela Produto.
--3. Deve retornar o resultado como DECIMAL(10,2).
--4. Caso o produto não exista, deve retornar 0.

CREATE FUNCTION fn_CalcularValorEstoque
(
	@id_produto int
)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @valorestoque decimal
	IF EXISTS(SELECT 1
	FROM Produto
	WHERE id_produto = @id_produto)
	BEGIN 
		SELECT @valorestoque = preco*estoque from Produto
							   WHERE id_produto = @id_produto
		RETURN @valorestoque
	END

	ELSE
		RETURN 0
END

SELECT fn_CalcularValorEstoque(1)

--Uma loja deseja classificar seus produtos de acordo com o preço de venda.
--Crie uma função chamada fn_ClassificarProduto que receba o id_produto como parâmetro e retorne uma classificação textual conforme as regras:

--Receber o código do produto.
--Consultar o preço na tabela Produto.
--Utilizar CASE para realizar a classificação.
--Retornar o resultado como VARCHAR(20).
--Se o produto não existir, retornar 'Não encontrado'.

CREATE FUNCTION fn_ClassificarProduto
(
	@id_produto int
)
RETURNS VARCHAR(20) AS
BEGIN
	DECLARE @preco DECIMAL(10,2)
	SELECT @preco = preco FROM Produto 
					WHERE id_produto = @id_produto	
    
	IF @preco IS NULL
	BEGIN
		RETURN 'Não encontrado'
	END

	ELSE
	RETURN
	CASE 
		when @preco < 50 then 'Economico'
		when @preco <= 200 then 'Intermediário'
		when @preco > 200 then 'Premium'
	END
END