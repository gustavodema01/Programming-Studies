use master
go
drop database [Locadora]
go

Create database [Locadora]
go
USE [Locadora]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 03/07/2013 20:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genero](
	[Codgenero] [smallint] NOT NULL,
	[descricao] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codgenero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (1, N'Terror')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (2, N'Drama')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (3, N'Comedia')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (4, N'Desenho')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (5, N'Ficção')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (6, N'Guerra')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (7, N'Romance')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (8, N'Infantil')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (13, N'Show')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (14, N'Comédia Romantica')
INSERT [dbo].[Genero] ([Codgenero], [descricao]) VALUES (15, N'Terror Pastelão')
/****** Object:  Table [dbo].[Cliente]    Script Date: 03/07/2013 20:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[CodCli] [smallint] NOT NULL,
	[Cliente] [varchar](50) NOT NULL,
	[EnderecoCli] [varchar](100) NOT NULL,
	[TelCli] [varchar](9) NOT NULL,
 CONSTRAINT [PK_CodCli] PRIMARY KEY CLUSTERED 
(
	[CodCli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (1, N'Antonio dos Santos', N'Rua dos Javalis, 123', N'4909-1198')
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (2, N'Penelope Cruz', N'Rua das Rosas, 254', N'4909-1198')
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (3, N'Joao cleber', N'Rua 123, 098', N'254-8825')
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (4, N'Ana maria braga', N'Rua dos morangos, 23', N'9987-8571')
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (5, N'Silvio Santos', N'Rua tatui, 23', N'3254-9825')
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (6, N'Eduardo Maleta', N'Rua juba S/N', N'1457-8825')
INSERT [dbo].[Cliente] ([CodCli], [Cliente], [EnderecoCli], [TelCli]) VALUES (7, N'Marcotti', N'Rua da TM, 123', N'4997-5874')
/****** Object:  UserDefinedFunction [dbo].[AplicaAumento]    Script Date: 03/07/2013 20:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[AplicaAumento]
(
	@p_valor decimal(10,2),
	@porcentagem_aumento decimal(10,2)
)
Returns decimal(10,2)
As
Begin
	return @p_valor + ( @p_valor * @porcentagem_aumento/100)
end
GO
/****** Object:  Table [dbo].[resumo]    Script Date: 03/07/2013 20:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resumo](
	[codCli] [int] NOT NULL,
	[valorTotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[codCli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[resumo] ([codCli], [valorTotal]) VALUES (1, CAST(20.00 AS Decimal(10, 2)))
/****** Object:  Table [dbo].[Midias]    Script Date: 03/07/2013 20:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Midias](
	[CodMidia] [smallint] NOT NULL,
	[DescMidia] [varchar](70) NOT NULL,
	[ValorUnit] [decimal](7, 2) NOT NULL,
	[codGenero] [smallint] NULL,
	[quantidade] [int] NULL,
 CONSTRAINT [PK_Midias] PRIMARY KEY CLUSTERED 
(
	[CodMidia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (1, N'Piratas do Caribe 3', CAST(6.03 AS Decimal(7, 2)), 1, 0)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (2, N'Piratas do Caribe 2', CAST(6.33 AS Decimal(7, 2)), 3, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (3, N'BrokeBack Mountain', CAST(10.00 AS Decimal(7, 2)), 1, 1)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (4, N'Gaiola das Loucas', CAST(10.00 AS Decimal(7, 2)), 3, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (5, N'Homem de Ferro', CAST(5.48 AS Decimal(7, 2)), 1, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (6, N'Homem de Ferro 2', CAST(6.84 AS Decimal(7, 2)), 4, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (8, N'X-Men 2', CAST(4.38 AS Decimal(7, 2)), 4, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (10, N'X-Men', CAST(3.28 AS Decimal(7, 2)), 4, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (11, N'Peter Pan', CAST(2.33 AS Decimal(7, 2)), 4, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (12, N'Velozes e Furiosos 1', CAST(3.87 AS Decimal(7, 2)), 5, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (13, N'O Santuario', CAST(5.21 AS Decimal(7, 2)), 5, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (14, N'Esta chovendo Hamburguer', CAST(2.12 AS Decimal(7, 2)), 4, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (15, N'O Mentiroso', CAST(1.98 AS Decimal(7, 2)), 3, 0)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (16, N'Lagrimas de Sol', CAST(4.98 AS Decimal(7, 2)), 2, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (17, N'Velozes e Furiosos 6', CAST(10.50 AS Decimal(7, 2)), 1, 5)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (18, N'Premonição 2', CAST(3.75 AS Decimal(7, 2)), 1, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (19, N'O Brinquedo Assassino', CAST(2.65 AS Decimal(7, 2)), 5, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (20, N'Platon', CAST(1.54 AS Decimal(7, 2)), 6, 2)
INSERT [dbo].[Midias] ([CodMidia], [DescMidia], [ValorUnit], [codGenero], [quantidade]) VALUES (21, N'As Cronicas de Narnia', CAST(4.87 AS Decimal(7, 2)), 5, 2)
/****** Object:  Table [dbo].[Locacao]    Script Date: 03/07/2013 20:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locacao](
	[CodLocacao] [smallint] NOT NULL,
	[CodCli] [smallint] NOT NULL,
	[DataLoc] [smalldatetime] NULL,
	[ValorTotalLoc] [decimal](6, 2) NOT NULL,
 CONSTRAINT [PK_CodLocacao] PRIMARY KEY CLUSTERED 
(
	[CodLocacao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (1, 1, CAST(0x9E670000 AS SmallDateTime), CAST(15.33 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (2, 2, CAST(0x9F6D0000 AS SmallDateTime), CAST(6.90 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (3, 4, CAST(0x9DB90000 AS SmallDateTime), CAST(14.65 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (4, 2, CAST(0x9EA20000 AS SmallDateTime), CAST(6.03 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (5, 7, CAST(0x9EB00000 AS SmallDateTime), CAST(18.71 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (6, 3, CAST(0x9E6A0000 AS SmallDateTime), CAST(3.98 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (7, 4, CAST(0x9F2E0000 AS SmallDateTime), CAST(7.98 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (8, 2, CAST(0x9F980000 AS SmallDateTime), CAST(8.65 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (9, 3, CAST(0x9E7D0000 AS SmallDateTime), CAST(5.98 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (10, 5, CAST(0x9E860000 AS SmallDateTime), CAST(10.76 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (11, 4, CAST(0x9E4D0000 AS SmallDateTime), CAST(23.09 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (12, 1, CAST(0x9EEB0000 AS SmallDateTime), CAST(33.23 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (13, 7, CAST(0x9D210000 AS SmallDateTime), CAST(15.86 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (14, 2, CAST(0x9F260000 AS SmallDateTime), CAST(18.43 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (15, 1, CAST(0xA0000000 AS SmallDateTime), CAST(6.98 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (16, 3, CAST(0xA0000000 AS SmallDateTime), CAST(12.93 AS Decimal(6, 2)))
INSERT [dbo].[Locacao] ([CodLocacao], [CodCli], [DataLoc], [ValorTotalLoc]) VALUES (110, 1, CAST(0xA0AF0520 AS SmallDateTime), CAST(16.03 AS Decimal(6, 2)))
/****** Object:  Table [dbo].[ItensLocacao]    Script Date: 03/07/2013 20:30:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItensLocacao](
	[CodLocacao] [smallint] NOT NULL,
	[CodMidia] [smallint] NOT NULL,
	[DataDev] [smalldatetime] NULL,
 CONSTRAINT [PK_CodLocacao_CodMidia] PRIMARY KEY CLUSTERED 
(
	[CodLocacao] ASC,
	[CodMidia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (1, 1, CAST(0x9E5E0000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (1, 3, CAST(0x9F6F0000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (1, 4, CAST(0x9EF70000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (2, 3, CAST(0x9F820000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (3, 2, CAST(0x9F080000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (4, 1, CAST(0x9D730000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (5, 2, CAST(0x9F510000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (5, 3, CAST(0x9F1D0000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (5, 5, CAST(0x9F0A0000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (7, 4, CAST(0x9F250000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (7, 6, CAST(0x9EF30000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (8, 1, CAST(0x9F280000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (9, 1, CAST(0x9FB50000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (9, 11, NULL)
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (9, 12, CAST(0x9F990000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (9, 15, CAST(0x9F990000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (10, 19, CAST(0x9FC20000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (10, 20, NULL)
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (11, 10, CAST(0x9F850000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (11, 18, CAST(0x9FC10000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (11, 19, CAST(0x9F820000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (12, 19, CAST(0x9FAC0000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (13, 13, CAST(0x9F730000 AS SmallDateTime))
INSERT [dbo].[ItensLocacao] ([CodLocacao], [CodMidia], [DataDev]) VALUES (14, 12, CAST(0x9F960000 AS SmallDateTime))
/****** Object:  View [dbo].[vw_ruim]    Script Date: 03/07/2013 20:30:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_ruim] as
	select m.DescMidia
	from Midias m
	left join ItensLocacao itl on (itl.CodMidia = m.CodMidia)
	where itl.CodMidia is null
GO
/****** Object:  Default [DF__Locacao__ValorTo__08EA5793]    Script Date: 03/07/2013 20:30:45 ******/
ALTER TABLE [dbo].[Locacao] ADD  DEFAULT ((0)) FOR [ValorTotalLoc]
GO
/****** Object:  Default [DF__Midias__ValorUni__09DE7BCC]    Script Date: 03/07/2013 20:30:45 ******/
ALTER TABLE [dbo].[Midias] ADD  DEFAULT ((0)) FOR [ValorUnit]
GO
/****** Object:  ForeignKey [FK_ItensLocacao_Locacao]    Script Date: 03/07/2013 20:30:45 ******/
ALTER TABLE [dbo].[ItensLocacao]  WITH CHECK ADD  CONSTRAINT [FK_ItensLocacao_Locacao] FOREIGN KEY([CodLocacao])
REFERENCES [dbo].[Locacao] ([CodLocacao])
GO
ALTER TABLE [dbo].[ItensLocacao] CHECK CONSTRAINT [FK_ItensLocacao_Locacao]
GO
/****** Object:  ForeignKey [FK_ItensLocacao_Midias]    Script Date: 03/07/2013 20:30:45 ******/
ALTER TABLE [dbo].[ItensLocacao]  WITH CHECK ADD  CONSTRAINT [FK_ItensLocacao_Midias] FOREIGN KEY([CodMidia])
REFERENCES [dbo].[Midias] ([CodMidia])
GO
ALTER TABLE [dbo].[ItensLocacao] CHECK CONSTRAINT [FK_ItensLocacao_Midias]
GO
/****** Object:  ForeignKey [FK_Locacao_Cliente]    Script Date: 03/07/2013 20:30:45 ******/
ALTER TABLE [dbo].[Locacao]  WITH CHECK ADD  CONSTRAINT [FK_Locacao_Cliente] FOREIGN KEY([CodCli])
REFERENCES [dbo].[Cliente] ([CodCli])
GO
ALTER TABLE [dbo].[Locacao] CHECK CONSTRAINT [FK_Locacao_Cliente]
GO
