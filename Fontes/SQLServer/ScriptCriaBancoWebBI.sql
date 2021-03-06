/****** Object:  StoredProcedure [dbo].[spCriaTempo]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spCriaTempo] 
@DtInicio as datetime,
@DtFim    as datetime
AS
BEGIN
	SET NOCOUNT ON;

    delete from tempo
    where data >= cast(@DtInicio as date)
      and data <= cast(@DtFim as date)
      
	declare @data      as date
	declare @trimestre as int
	declare @semestre  as int
	declare @seculo    as int
	declare @decada    as int
	declare @ano       as int
	declare @dia       as int
	declare @mes       as int
	declare @ano_lit   as int

	select @data = @DtInicio
	
	while @data <= @DtFim
	begin
		select @ano     = cast(datepart(yy,@data) as int)
		select @mes     = cast(datepart(mm,@data) as int)
		select @dia     = cast(datepart(dd,@data) as int)
		select @seculo  = cast(@ano / 100 as int) + 1
		select @ano_lit = cast(@ano - ((@seculo - 1) * 100) as int)

		if @ano_lit < 10  begin select @decada = 1  end else
		if @ano_lit < 20  begin select @decada = 2  end else
		if @ano_lit < 30  begin select @decada = 3  end else
		if @ano_lit < 40  begin select @decada = 4  end else
		if @ano_lit < 50  begin select @decada = 5  end else
		if @ano_lit < 60  begin select @decada = 6  end else
		if @ano_lit < 70  begin select @decada = 7  end else
		if @ano_lit < 80  begin select @decada = 8  end else
		if @ano_lit < 90  begin select @decada = 9  end else
		if @ano_lit < 100 begin select @decada = 10 end

		select @trimestre = case datepart(mm,@data) 
							when 1 then 1 
							when 2 then 1 
							when 3 then 1 
							when 4 then 2 
							when 5 then 2
							when 6 then 2 
							when 7 then 3 
							when 8 then 3
							when 9 then 3 
							when 10 then 4 
							when 11 then 4 
							when 12 then 4 
							end

		select @semestre = case datepart(mm,@data) 
							when 1 then 1 
							when 2 then 1 
							when 3 then 1 
							when 4 then 1 
							when 5 then 1
							when 6 then 1 
							when 7 then 2 
							when 8 then 2
							when 9 then 2 
							when 10 then 2 
							when 11 then 2 
							when 12 then 2 
							end

		insert into tempo (data, mes, dia, ano, trimestre, semestre, mes_ano, dia_semana, num_dia_semana, num_dia_ano, num_semana, seculo, decada, decada_seculo)
		values 
		(
		   @data,
		   @mes,
		   @dia,
		   @ano,
		   @trimestre,
		   @semestre,
		   replace(str(@mes,2,0),' ','0') + '/' + replace(str(@ano,4,0),' ','0'),
		   dbo.fcDiaSemana(@data),
		   datepart(dw,@data),
		   datepart(dy,@data),
		   datepart(wk,@data),
		   @seculo,
		   @decada,
		   replace(str(@decada,2,0),' ','0') + '/' + replace(str(@seculo,2,0),' ','0')
		)
		
		select @data = dateadd(day, 1, @data)
	end

END


GO
/****** Object:  UserDefinedFunction [dbo].[fcDiaSemana]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fcDiaSemana] (@Data DATETIME) RETURNS VARCHAR (20)  AS
BEGIN
  DECLARE @DIA INT,
   @DIA_EXT VARCHAR(20)
  
  SELECT @DIA = (DATEPART(DW,@DATA ))
 
  IF @DIA=1 
     SET @DIA_EXT = 'Domingo'
  IF @DIA=2  
     SET @DIA_EXT = 'Segunda-Feira'
  IF @DIA=3  
     SET @DIA_EXT = 'Terça-Feira'
  IF @DIA=4  
     SET @DIA_EXT = 'Quarta-Feira'
  IF @DIA=5  
     SET @DIA_EXT = 'Quinta-Feira'
  IF @DIA=6  
     SET @DIA_EXT = 'Sexta-Feira'
  IF @DIA=7  
     SET @DIA_EXT = 'Sábado';
 
  RETURN @DIA_EXT
END


GO
/****** Object:  Table [dbo].[EXCEL]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EXCEL](
	[COD_EXCEL] [int] NOT NULL,
	[NOME] [varchar](100) NOT NULL,
	[COD_GRUPO] [varchar](10) NOT NULL,
	[ARQUIVO] [varbinary](max) NOT NULL,
	[ATIVO] [bit] NOT NULL,
	[DT_ATUALIZA] [datetime] NULL,
	[HR_ATUALIZA] [varchar](5) NULL,
 CONSTRAINT [PK_EXCEL] PRIMARY KEY CLUSTERED 
(
	[COD_EXCEL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EXCEL_TITULO_ANEXOS]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EXCEL_TITULO_ANEXOS](
	[COD_ANEXO] [int] NOT NULL,
	[NOME] [varchar](50) NOT NULL,
	[COD_TITULO] [int] NOT NULL,
	[ARQUIVO] [varbinary](max) NOT NULL,
	[TIPO] [varchar](20) NOT NULL,
	[DT_GERACAO] [datetime] NOT NULL,
	[HR_GERACAO] [varchar](5) NOT NULL,
 CONSTRAINT [PK_EXCEL_TITULO_ANEXOS] PRIMARY KEY CLUSTERED 
(
	[COD_ANEXO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EXCEL_TITULO_ASSINATURAS]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EXCEL_TITULO_ASSINATURAS](
	[COD_USUARIO] [int] NOT NULL,
	[COD_TITULO] [int] NOT NULL,
	[ATIVO] [bit] NOT NULL,
	[TIPO_ENVIO] [varchar](1) NOT NULL,
	[DIAS_ENVIO] [varchar](100) NOT NULL,
	[EMAIL_ALTERNATIVO] [varchar](100) NULL,
 CONSTRAINT [PK_EXCEL_TITULO_ASSINATURAS] PRIMARY KEY CLUSTERED 
(
	[COD_USUARIO] ASC,
	[COD_TITULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EXCEL_TITULOS]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EXCEL_TITULOS](
	[COD_TITULO] [int] NOT NULL,
	[NOME] [varchar](50) NOT NULL,
	[COD_EXCEL] [int] NOT NULL,
	[NUM_PLAN_PDF] [int] NOT NULL,
	[TIPO_ARMAZENAGEM] [varchar](20) NOT NULL,
	[ATIVO] [bit] NOT NULL,
	[DT_GERACAO] [datetime] NULL,
	[HR_GERACAO] [varchar](5) NULL,
 CONSTRAINT [PK_EXCEL_TITULOS] PRIMARY KEY CLUSTERED 
(
	[COD_TITULO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GRUPOS]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GRUPOS](
	[COD_GRUPO] [varchar](10) NOT NULL,
	[NOME] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GRUPOS] PRIMARY KEY CLUSTERED 
(
	[COD_GRUPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TEMPO]    Script Date: 10/08/2012 11:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMPO](
	[DATA] [date] NOT NULL,
	[MES] [int] NOT NULL,
	[DIA] [int] NOT NULL,
	[ANO] [int] NOT NULL,
	[TRIMESTRE] [int] NOT NULL,
	[SEMESTRE] [int] NOT NULL,
	[MES_ANO] [varchar](7) NOT NULL,
	[DIA_SEMANA] [varchar](15) NOT NULL,
	[NUM_DIA_SEMANA] [int] NOT NULL,
	[NUM_DIA_ANO] [int] NOT NULL,
	[NUM_SEMANA] [int] NOT NULL,
	[SECULO] [int] NOT NULL,
	[DECADA] [int] NOT NULL,
	[DECADA_SECULO] [varchar](5) NOT NULL,
 CONSTRAINT [PK_TEMPO] PRIMARY KEY CLUSTERED 
(
	[DATA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[EXCEL] ADD  DEFAULT ((1)) FOR [ATIVO]
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ANEXOS] ADD  DEFAULT ('PDF') FOR [TIPO]
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ASSINATURAS] ADD  DEFAULT ((1)) FOR [ATIVO]
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ASSINATURAS] ADD  DEFAULT ('S') FOR [TIPO_ENVIO]
GO
ALTER TABLE [dbo].[EXCEL_TITULOS] ADD  DEFAULT ((1)) FOR [NUM_PLAN_PDF]
GO
ALTER TABLE [dbo].[EXCEL_TITULOS] ADD  DEFAULT ('Diário') FOR [TIPO_ARMAZENAGEM]
GO
ALTER TABLE [dbo].[EXCEL_TITULOS] ADD  DEFAULT ((1)) FOR [ATIVO]
GO
ALTER TABLE [dbo].[EXCEL]  WITH CHECK ADD  CONSTRAINT [FK_EXCEL_REFERENCE_GRUPOS] FOREIGN KEY([COD_GRUPO])
REFERENCES [dbo].[GRUPOS] ([COD_GRUPO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EXCEL] CHECK CONSTRAINT [FK_EXCEL_REFERENCE_GRUPOS]
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ANEXOS]  WITH CHECK ADD  CONSTRAINT [FK_EXCEL_TI_REFERENCE_EXCEL_TI] FOREIGN KEY([COD_TITULO])
REFERENCES [dbo].[EXCEL_TITULOS] ([COD_TITULO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ANEXOS] CHECK CONSTRAINT [FK_EXCEL_TI_REFERENCE_EXCEL_TI]
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ASSINATURAS]  WITH CHECK ADD  CONSTRAINT [FK_EXCEL_TI_REF_EXCEL_TI] FOREIGN KEY([COD_TITULO])
REFERENCES [dbo].[EXCEL_TITULOS] ([COD_TITULO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ASSINATURAS] CHECK CONSTRAINT [FK_EXCEL_TI_REF_EXCEL_TI]
GO
ALTER TABLE [dbo].[EXCEL_TITULOS]  WITH CHECK ADD  CONSTRAINT [FK_EXCEL_TI_REFERENCE_EXCEL] FOREIGN KEY([COD_EXCEL])
REFERENCES [dbo].[EXCEL] ([COD_EXCEL])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EXCEL_TITULOS] CHECK CONSTRAINT [FK_EXCEL_TI_REFERENCE_EXCEL]
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ASSINATURAS]  WITH CHECK ADD  CONSTRAINT [CKC_TIPO_ENVIO_EXCEL_TI] CHECK  (([TIPO_ENVIO]='M' OR [TIPO_ENVIO]='S'))
GO
ALTER TABLE [dbo].[EXCEL_TITULO_ASSINATURAS] CHECK CONSTRAINT [CKC_TIPO_ENVIO_EXCEL_TI]
GO
ALTER TABLE [dbo].[EXCEL_TITULOS]  WITH CHECK ADD  CONSTRAINT [CKC_NUM_PLAN_PDF_EXCEL_TI] CHECK  (([NUM_PLAN_PDF]>=(1) AND [NUM_PLAN_PDF]<=(999)))
GO
ALTER TABLE [dbo].[EXCEL_TITULOS] CHECK CONSTRAINT [CKC_NUM_PLAN_PDF_EXCEL_TI]
GO
ALTER TABLE [dbo].[EXCEL_TITULOS]  WITH CHECK ADD  CONSTRAINT [CKC_TIPO_ARMAZENAGEM_EXCEL_TI] CHECK  (([TIPO_ARMAZENAGEM]='Único' OR [TIPO_ARMAZENAGEM]='Anual' OR [TIPO_ARMAZENAGEM]='Semestral' OR [TIPO_ARMAZENAGEM]='Trimestral' OR [TIPO_ARMAZENAGEM]='Mensal' OR [TIPO_ARMAZENAGEM]='Semanal' OR [TIPO_ARMAZENAGEM]='Diário'))
GO
ALTER TABLE [dbo].[EXCEL_TITULOS] CHECK CONSTRAINT [CKC_TIPO_ARMAZENAGEM_EXCEL_TI]
GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[spCriaTempo]
		@DtInicio = N'1900-01-01',
		@DtFim = N'2099-31-12'

SELECT	'Return Value' = @return_value