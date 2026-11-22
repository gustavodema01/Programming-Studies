--Crie uma trigger do tipo `FOR INSERT` na tabela `ItemVenda` chamada `trg_ItemVenda_ValidaEstoque` que[7]:

--1. Ao inserir um item de venda, verifique se a quantidade em `estoque` do produto é menor do que a `quantidade` informada no item[7].
--2. Se o estoque for **insuficiente** (menor que a quantidade solicitada), a operação deve ser cancelada com a mensagem `'Estoque insuficiente para esta venda.'` utilizando `RAISERROR`, `ROLLBACK TRANSACTION` e `RETURN`[7][17].
--3. Caso contrário, a trigger deve **diminuir o estoque** do produto na tabela `Produto`, subtraindo a quantidade informada no item inserido[7].

CREATE OR ALTER TRIGGER trg_ItemVenda_ValidaEstoque ON ItemVenda
FOR INSERT AS
BEGIN

declare @id_produto int
set @id_produto = (select id_produto from inserted)

declare @quantidade int
set @quantidade = (select quantidade from inserted)

declare @estoque int
set @estoque = (select estoque from Produto p
				where p.id_produto = @id_produto)

IF(@quantidade > @estoque)
BEGIN
	RAISERROR('Estoque insuficiente para esta venda',16,1)
	ROLLBACK TRANSACTION 
	RETURN
END

	UPDATE Produto
	SET estoque = estoque - @quantidade
	WHERE id_produto = @id_produto
END
GO



