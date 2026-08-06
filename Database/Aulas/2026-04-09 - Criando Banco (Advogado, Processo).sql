create database Exercicio

use Exercicio

create table Advogado
(
	codAdvogado		int		primary	key,
	nome	varchar,
	data_nasc	datetime
)

create table Processo
(
	numProce	int		primary	key,
	autor	varchar,
	"data"	datetime
)

alter table Processo
	add codAdvogado int,
	constraint FK_Codigo_Advogado
		foreign key (codAdvogado)
			references Advogado

create table Cidade
(
	codCidade int primary key,
	descricao varchar
)

create table Forum
(
	codForum int primary key,
	nome varchar,
	endereço varchar,
	codCidade int,
	foreign key (codCidade) references Cidade
)

drop table Cidade