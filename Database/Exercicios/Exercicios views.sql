--Usando ao banco de dados de locadora faça:
--1) Crie uma view chamada vw_nuncaLocados, que exiba
--o nome, codigo dos filmes e genero que nunca foram alugados
CREATE VIEW vw_nuncaLocados AS
SELECT m.DescMidia, m.CodMidia, m.codGenero
FROM Midias m
LEFT JOIN ItensLocacao itl ON m.CodMidia = itl.CodMidia
WHERE itl.CodLocacao IS NULL

--2) Crie uma view chamada vw_ClienteSemLocacao, que exiba
--o nome e codigo dos clientes que nunca fizeram uma locação
CREATE VIEW vw_ClienteSemLocacao AS
SELECT C.Cliente, C.CodCli
FROM Cliente c
LEFT JOIN Locacao l on c.CodCli = l.CodCli
WHERE l.CodLocacao IS NULL

--3) Crie uma view chamada vw_Top5, que exiba
--o nome e codigo dos 5 filmes mais alugados
CREATE VIEW vw_Top5 AS
SELECT TOP 5 m.DescMidia, m.CodMidia, COUNT(itl.CodLocacao) qtdLocacao
FROM Midias m
INNER JOIN ItensLocacao itl on m.CodMidia = itl.CodMidia
GROUP BY m.DescMidia, m.CodMidia 
ORDER BY COUNT(itl.CodLocacao) DESC

--4) Crie uma view chamada vw_LocacaoTOP, que exiba o 
--nome dos clientes de maneira distinta que fizeram locações
--de algum dos filmes Top5 (use a view do ex_3)
CREATE VIEW vw_LocacaoTOP AS
SELECT DISTINCT(c.Cliente) 
from Cliente c
INNER JOIN Locacao l ON c.CodCli = l.CodCli
INNER JOIN ItensLocacao itl ON l.CodLocacao = itl.CodLocacao
INNER JOIN vw_Top5 top5 ON itl.CodMidia = top5.CodMidia


--5) Crie uma view chamada vw_genero, que exiba o 
--codigo e descrição do genero de todos os filmes que nunca
--foram locados (use view do ex_1)
CREATE VIEW vw_genero AS
SELECT m.codGenero, m.DescMidia
FROM Midias m
INNER JOIN vw_nuncaLocados nunc ON m.CodMidia = nunc.CodMidia

--6) Cria uma view chamada vw_ClienteTOP, que exiba
--os 5 nomes de clientes com codigo, que fizeram o maior
--numero de locações
CREATE VIEW vw_ClienteTOP AS
SELECT TOP 5 c.Cliente, C.CodCli ,COUNT(l.CodLocacao) AS nmrLocacao
from Cliente c
INNER JOIN Locacao l on c.CodCli = l.CodCli
GROUP BY c.Cliente, c.CodCli
ORDER BY COUNT(l.CodLocacao) DESC
