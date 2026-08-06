--apagando o banco existente
drop database PrimeiroBanco

--criando um banco de dados
create database PrimeiroBanco

--habilitando o banco para uso
use PrimeiroBanco

--criando tabelas
--1ª forma
create table Categoria
(
	codCategoria	int		primary key,
	descricao		varchar(50)
)

--2ª forma
create table Categoria
(
	codCategoria	int			not null, --PK não pode ser nulo
	descricao		varchar(50),
	primary key	(codCategoria)
)

--Criar outra tabela
--1ª forma
create table Produto
(
	codProduto		int			primary key,
	descricao		varchar(50) not null,
	quantidade		smallint,
	dtCriacao		smalldatetime,
	codCategoria	int
		references Categoria,  --cria a FK
	valor			decimal(10, 2)
)

--2ª forma
create table Produto
(
	codProduto		int			not null,
	descricao		varchar(50) not null,
	quantidade		smallint,
	dtCriacao		smalldatetime,
	codCategoria	int,
	valor			decimal(10, 2),
	primary key (codProduto),
	foreign key (codCategoria) references Categoria
)

--apaga a tabela
drop table produto

--Adicionando campos em tabelas JÁ EXISTENTES

--adicionar campo TIPO na tabela Categoria
alter table Categoria
	add	tipo	int		not null

--para remover o campo TIPO
alter table Categoria
	drop column tipo

-------------------------------------------------------------------------------

--adicionando a FK pelo comando ADD
drop table Produto

create table Produto
(
	codProduto		int			not null,
	descricao		varchar(50) not null,
	quantidade		smallint,
	dtCriacao		smalldatetime,
	valor			decimal(10, 2),
	primary key (codProduto),
)

alter table Produto
	add codCategoria int,
	constraint FK_Produto_Catgoria
		foreign key (codCategoria)
			references Categoria