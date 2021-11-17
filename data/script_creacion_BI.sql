USE [GD2C2021]
GO

SET ANSI_NULLS ON
GO

SET NOCOUNT OFF
GO

/**
 * =============================================================================================
 * Borrado de Tablas
 * =============================================================================================
 */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_CHOFER') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_CHOFER
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_TAREA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TAREA
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MODELO_CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_CHOFER
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MARCA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TAREA
GO

/**
 * ---------------------------------------------------------------------------------------------
 * Chofer
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_CHOFER (
	Legajo INT,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR(255) NOT NULL,
	DNI DECIMAL(18, 0) CONSTRAINT uq_bi_chofer_dni UNIQUE NOT NULL,
	Direccion NVARCHAR(255),
	Telefono INT,
	Mail NVARCHAR(255),
	Fecha_Nac DATETIME2(3),
	Costo_Hora INT NOT NULL,
	Edad INT,
)

/**
 * ---------------------------------------------------------------------------------------------
 * Tarea
 * ---------------------------------------------------------------------------------------------
 */


CREATE TABLE [SIN_NOMBRE].BI_TAREA
(
	Codigo INT NOT NULL PRIMARY KEY,
	Tipo NVARCHAR(255),
	Descripcion NVARCHAR(255),
	Tiempo_Estimado INT,
)
GO

/**
 * ---------------------------------------------------------------------------------------------
 * MODELO CAMION
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_MODELO_CAMION (
	Marca_Id SMALLINT,
    Modelo_Id SMALLINT IDENTITY(1,1), 
	Descripcion NVARCHAR(255),
	Velocidad_Max INT,
    Capacidad_Tanque INT,
    Capacidad_Carga INT, 
	CONSTRAINT PK_modelo_camion PRIMARY KEY(Marca_Id, Modelo_Id)
)

/**
 * ---------------------------------------------------------------------------------------------
 * MARCA
 * ---------------------------------------------------------------------------------------------
 */
 
 CREATE TABLE [SIN_NOMBRE].BI_MARCA_CAMION
(
	Id SMALLINT IDENTITY(1, 1),
	Descripcion NVARCHAR(255),
	CONSTRAINT PK_marca_camion PRIMARY KEY (Id ASC)
)


/**
 * =============================================================================================
 * INSERTS
 * =============================================================================================
 */

 INSERT INTO [SIN_NOMBRE].[BI_CHOFER]
 SELECT [Legajo]
      ,[Nombre]
      ,[Apellido]
      ,[DNI]
      ,[Direccion]
      ,[Telefono]
      ,[Mail]
      ,[Fecha_Nac]
      ,[Costo_Hora]
	  ,DATEDIFF (YEAR, [Fecha_Nac] , GETDATE()) AS [Edad]
  FROM [GD2C2021].[SIN_NOMBRE].[CHOFER]

 INSERT INTO [SIN_NOMBRE].[BI_TAREA]
 SELECT T.[Codigo]
      ,TT.[Descripcion] AS [Tipo]
      ,T.[Descripcion]
      ,T.[Tiempo_Estimado]
  FROM [GD2C2021].[SIN_NOMBRE].[TAREA] T
  INNER JOIN [SIN_NOMBRE].[TIPO_TAREA] TT ON  TT.Codigo = T.Tipo

 INSERT INTO [SIN_NOMBRE].[BI_MODELO_CAMION]
 SELECT [Marca_Id]
      ,[Modelo_Id]
      ,[Descripcion]
      ,[Velocidad_Max]
      ,[Capacidad_Tanque]
      ,[Capacidad_Carga]
  FROM [GD2C2021].[SIN_NOMBRE].[MODELO_CAMION]

  
 INSERT INTO [SIN_NOMBRE].[BI_MARCA_CAMION]
 SELECT [Id]
      ,[Descripcion]
 FROM [GD2C2021].[SIN_NOMBRE].[MARCA_CAMION]