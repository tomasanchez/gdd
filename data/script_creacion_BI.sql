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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_CAMION_MANTENIMIENTO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_CAMION_VIAJE') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].[BI_CAMION_VIAJE]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_TAREA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TAREA
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_CAMION
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MODELO_CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_MODELO_CAMION
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MARCA_CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_MARCA_CAMION
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_CHOFER') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_CHOFER
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MECANICO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_MECANICO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_TALLER') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TALLER
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_RECORRIDO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_RECORRIDO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MATERIAL') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_MATERIAL
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
	CONSTRAINT PK_bi_chofer PRIMARY KEY (Legajo)
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
	Tiempo_Estimado INT
)
GO

/**
 * ---------------------------------------------------------------------------------------------
 * MODELO CAMION
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_MODELO_CAMION (
	Marca_Id SMALLINT,
    Modelo_Id SMALLINT, 
	Descripcion NVARCHAR(255),
	Velocidad_Max INT,
    Capacidad_Tanque INT,
    Capacidad_Carga INT, 
	CONSTRAINT PK_bi_modelo_camion PRIMARY KEY(Marca_Id, Modelo_Id)
)

/**
 * ---------------------------------------------------------------------------------------------
 * MARCA
 * ---------------------------------------------------------------------------------------------
 */
 
 CREATE TABLE [SIN_NOMBRE].BI_MARCA_CAMION
(
	Id SMALLINT,
	Descripcion NVARCHAR(255),
	CONSTRAINT PK_bi_marca_camion PRIMARY KEY (Id ASC)
)


/**
 * ---------------------------------------------------------------------------------------------
 * TALLER
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_TALLER
(
	Id INT,
	Direccion NVARCHAR(255) NOT NULL,
	Telefono DECIMAL(18, 0),
	Mail NVARCHAR(255),
	Nombre NVARCHAR(255) NOT NULL,
	Ciudad NVARCHAR(255),
	CONSTRAINT PK_bi_taller PRIMARY KEY (ID ASC)
)

/**
 * ---------------------------------------------------------------------------------------------
 * MECANICO
 * ---------------------------------------------------------------------------------------------
 */


CREATE TABLE [SIN_NOMBRE].BI_MECANICO (
	Legajo INT,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR(255) NOT NULL,
	DNI DECIMAL(18, 2) CONSTRAINT uq_bi_mecanico_dni UNIQUE NOT NULL,
	Direccion NVARCHAR(255),
	Telefono INT,
	Mail NVARCHAR(255),
	Fecha_Nac DATETIME2(3),
	Costo_Hora DECIMAL(18, 0) NOT NULL,
	Edad INT
	CONSTRAINT PK_bi_mecanico PRIMARY KEY(LEGAJO)
)

/**
 * ---------------------------------------------------------------------------------------------
 * Camion
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_CAMION (
	Patente NVARCHAR(15),
	NroChasis NVARCHAR(255) NOT NULL,
	NroMotor NVARCHAR(255) NOT NULL,
	Fecha_alta DATETIME2(3),
	Modelo SMALLINT,
	Marca SMALLINT,
	CONSTRAINT PK_bi_camion PRIMARY KEY (Patente)
)

/**
 * ---------------------------------------------------------------------------------------------
 * Recorrido
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_RECORRIDO (
	Codigo INT,
	Origen NVARCHAR(255) NOT NULL,
	Destino NVARCHAR(255) NOT NULL,
	KM INT,
	Precio_base_recorrido DECIMAL(18, 0),
	CONSTRAINT PK_bi_recorrido PRIMARY KEY (Codigo)
)

/**
 * ---------------------------------------------------------------------------------------------
 * Material
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_MATERIAL (
	Codigo NVARCHAR(100),
	Descripcion NVARCHAR(255),
	Precio DECIMAL(18,2),
	CONSTRAINT PK_bi_material PRIMARY KEY (Codigo)
)



/**
 * ---------------------------------------------------------------------------------------------
 * CAMION VIAJE
 * ---------------------------------------------------------------------------------------------
 */


 CREATE TABLE [SIN_NOMBRE].[BI_CAMION_VIAJE] (
	Id_Camion_Viaje INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Patente   NVARCHAR(15) NOT NULL,
	Recorrido INT,
	Legajo_Chofer INT,
	Fecha_Inicio DATETIME2(3),
	Fecha_Fin DATETIME2(3),
	Consumo_Combustible DECIMAL(18, 0),
	Precio_Final DECIMAL(18, 0)
)

/* ---------------------------------------------------------------------------------------------
 * MANTENIMIENTO CAMION
 * ---------------------------------------------------------------------------------------------
 */

CREATE TABLE [SIN_NOMBRE].BI_CAMION_MANTENIMIENTO(
    Id_Camion_Mantenimiento INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Nro_OT INT, 
	Patente_Camion NVARCHAR(15),
	Modelo_Id SMALLINT,
	Marca_Id SMALLINT,
	Legajo INT,
	Id_taller INT,
	Fecha_Creacion DATETIME2(3), -- De la OT
	Cod_Tarea INT,
	Fecha_Inicio_Planificado DATETIME2(3), -- De la tarea
	Fecha_Inicio_Real DATETIME2(3),      ---/
	Fecha_Fin_Real DATETIME2(3),         --/
	Cantidad_Horas_Trabajadas INT,
	Material NVARCHAR(100),
	Material_Cantidad INT,
)
GO


/**
 * =============================================================================================
 * ALTERS
 * =============================================================================================
 */


 ALTER TABLE [SIN_NOMBRE].[BI_CAMION] WITH CHECK ADD
	CONSTRAINT [FK__bi_camion_modelo] FOREIGN KEY(Marca, Modelo) REFERENCES [SIN_NOMBRE].BI_MODELO_CAMION (Marca_Id, Modelo_Id)
 GO

ALTER TABLE [SIN_NOMBRE].BI_MODELO_CAMION WITH CHECK ADD
 CONSTRAINT [FK_bi_modelo_marca] FOREIGN KEY(Marca_Id) REFERENCES [SIN_NOMBRE].BI_MARCA_CAMION
GO

ALTER TABLE [SIN_NOMBRE].[BI_CAMION_VIAJE] WITH CHECK ADD
	CONSTRAINT [FK_bi_camion_viaje_recorrido] FOREIGN KEY(Recorrido) REFERENCES [SIN_NOMBRE].[BI_RECORRIDO],
	CONSTRAINT [FK_bi_camion_viaje_chofer]	FOREIGN KEY(Legajo_Chofer) REFERENCES [SIN_NOMBRE].[BI_CHOFER],
	CONSTRAINT [FK_bi_camion_viaje]			FOREIGN KEY(Patente) REFERENCES [SIN_NOMBRE].[BI_CAMION]
GO

 ALTER TABLE [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO] WITH CHECK ADD
	CONSTRAINT [FK_bi_mantenimiento_material] FOREIGN KEY(Material) REFERENCES [SIN_NOMBRE].[BI_MATERIAL]
	,CONSTRAINT [FK_bi_mantenimiento_mecanico] FOREIGN KEY(Legajo) REFERENCES [SIN_NOMBRE].[BI_MECANICO]
	,CONSTRAINT [FK_bi_mantenimiento_modelo] FOREIGN KEY(Marca_Id, Modelo_Id) REFERENCES [SIN_NOMBRE].[BI_MODELO_CAMION] (Marca_Id, Modelo_Id)
	,CONSTRAINT [FK_bi_mantenimiento_talller] FOREIGN KEY(Id_Taller) REFERENCES [SIN_NOMBRE].[BI_TALLER]
	,CONSTRAINT [FK_bi_mantenimiento_tarea] FOREIGN KEY(Cod_Tarea) REFERENCES [SIN_NOMBRE].[BI_TAREA]
	,CONSTRAINT [FK_bi_mantenimiento_camion] FOREIGN KEY(Patente_Camion) REFERENCES [SIN_NOMBRE].[BI_CAMION]
 GO

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

 INSERT INTO [SIN_NOMBRE].[BI_MARCA_CAMION]
 SELECT [Id]
      ,[Descripcion]
 FROM [GD2C2021].[SIN_NOMBRE].[MARCA_CAMION]

 INSERT INTO [SIN_NOMBRE].[BI_MODELO_CAMION]
 SELECT [Marca_Id]
      ,[Modelo_Id]
      ,[Descripcion]
      ,[Velocidad_Max]
      ,[Capacidad_Tanque]
      ,[Capacidad_Carga]
  FROM [GD2C2021].[SIN_NOMBRE].[MODELO_CAMION]

 INSERT INTO [SIN_NOMBRE].[BI_CAMION]
 SELECT CAST([Patente] as NVARCHAR(15))
		,[Nro_Chasis]
		,[Nro_Motor]
		,[Fecha_Alta]
		,[Modelo_Id]
		,[Marca_Id]
FROM [GD2C2021].[SIN_NOMBRE].[CAMION]


INSERT INTO [SIN_NOMBRE].BI_TALLER
SELECT T.Id
	, T.Direccion
	, T.Telefono
	, T.Mail
	, T.Nombre
	, C.Nombre
FROM [SIN_NOMBRE].TALLER T
JOIN [SIN_NOMBRE].CIUDAD C ON T.Ciudad = C.Id_Ciudad

 INSERT INTO [SIN_NOMBRE].[BI_MECANICO]
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
  FROM [GD2C2021].[SIN_NOMBRE].[MECANICO]

 INSERT INTO [SIN_NOMBRE].[BI_MATERIAL]
 SELECT Codigo
	, Descripcion
	, Precio
 FROM [SIN_NOMBRE].MATERIAL

 INSERT INTO [SIN_NOMBRE].[BI_RECORRIDO]
 SELECT [Codigo]
		,C.Nombre
		,C2.Nombre
		,[KM]
		,[Precio]
FROM [GD2C2021].[SIN_NOMBRE].[RECORRIDO] R
JOIN [SIN_NOMBRE].CIUDAD C  ON R.Ciudad_Origen = C.Id_Ciudad
JOIN [SIN_NOMBRE].CIUDAD C2 ON R.Ciudad_Destino = C2.Id_Ciudad

INSERT INTO [SIN_NOMBRE].[BI_CAMION_VIAJE]
SELECT CAST(V.Patente_Camion as NVARCHAR(15))
	, V.Cod_Recorrido
	, V.Legajo_Chofer
	, V.Fecha_Inicio
	, V.Fecha_Fin
	, V.Consumo_Combustible
	, V.Precio_Final + (SELECT SUM(PxV.Cantidad * TP.Precio) AS 'VALOR_TOTAL_PAQUETES'
	FROM [SIN_NOMBRE].VIAJE V2
	JOIN [SIN_NOMBRE].PAQUETE_POR_VIAJE PxV ON PxV.Id_Viaje = V2.Id
	JOIN [SIN_NOMBRE].PAQUETE P ON PxV.Id_Paquete = P.Id
	JOIN [SIN_NOMBRE].TIPO_PAQUETE TP ON P.Tipo = TP.Codigo
	WHERE V2.Id = V.Id) AS 'PRECIO_TOTAL_VIAJE'
FROM [SIN_NOMBRE].VIAJE V

INSERT INTO [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO]
SELECT 
	OT.Nro_OT
	,CAST(OT.Patente_Camion as NVARCHAR(15))
	,C.Modelo_Id
	,C.Marca_Id
	,TxO.Mecanico
	,M.Id_taller
	,OT.Fecha_Creacion
	,TxO.Cod_Tarea
	,TxO.Fecha_Inicio_Planificado
	,TxO.Fecha_Inicio_Real
	,TxO.Fecha_Fin_Real
	,(DATEDIFF (DAY, TxO.Fecha_Inicio_Real , TxO.Fecha_Fin_Real) * 8) AS [Cantidad_Horas_Trabajadas]
	,MxT.Cod_Material
	,ISNULL(MxT.Cantidad, 1) AS [Cantidad]
FROM [SIN_NOMBRE].ORDEN_TRABAJO OT
JOIN [SIN_NOMBRE].CAMION C				ON C.Patente = OT.Patente_Camion
JOIN [SIN_NOMBRE].TAREA_POR_ORDEN TxO	ON TxO.Nro_OT = OT.Nro_OT
JOIN [SIN_NOMBRE].MECANICO M			ON M.Legajo = TxO.Mecanico
JOIN [SIN_NOMBRE].MATERIAL_POR_TAREA MxT ON MxT.Cod_Tarea = TxO.Cod_Tarea



-- Select cm.patente_camion, cm.id_taller, cm.quarter(fecha_fin) as 'cuatrimestre', sum( (m.precio * cm.cantidad) + (cm.cantidad_horas_trabajadas * me.costo_hora)) as costo_total
-- from camion_mantenimiento cm 
-- inner join mecanico me on cm.legajo_mecanico = me.legajo
-- inner join material m on cm.material = m.codigo
-- group by cm.patente_camion, cm.id_taller, cm.quarter(fecha_fin)