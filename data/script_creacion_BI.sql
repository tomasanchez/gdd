USE [GD2C2021]
GO

SET ANSI_NULLS ON
GO

SET NOCOUNT OFF
GO

/**
 * =============================================================================================
 * Borrado de Vistas
 * =============================================================================================
 */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].V_Facturacion_Recorrido_Cuatrimestre') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Facturacion_Recorrido_Cuatrimestre
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Camion_Ganancias]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Camion_Ganancias
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Camion_Maximo_Tiempo_FueraDeServicio]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Camion_Maximo_Tiempo_FueraDeServicio
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Promedio_Costo_Chofer]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Promedio_Costo_Chofer
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Camion_Costo_Mant]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Camion_Costo_Mant
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Desvio_Tareas]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Desvio_Tareas
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_TOP_5_Tareas_Por_Camion]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_TOP_5_Tareas_Por_Camion
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Tareas_Por_Camion]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Tareas_Por_Camion
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Tareas_Realizadas]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].V_Tareas_Realizadas
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Materiales_Taller]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].[V_Materiales_Taller]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].[V_Top_10_Materiales_Taller]') AND type in (N'V'))
	DROP VIEW [SIN_NOMBRE].[V_Top_10_Materiales_Taller]
GO

/**
 * =============================================================================================
 * Borrado de Tablas
 * =============================================================================================
 */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_HECHO_VIAJE') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].[BI_HECHO_VIAJE]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].[BI_HECHO_ORDEN_TRABAJO]
GO


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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_TIEMPO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TIEMPO
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_RANGO_EDAD') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_RANGO_EDAD
GO

/**
 * ---------------------------------------------------------------------------------------------
 * Tiempo
 * ---------------------------------------------------------------------------------------------
 */
CREATE TABLE [SIN_NOMBRE].BI_TIEMPO
(
	Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Anio INT,
	Cuatrimestre TINYINT,
)
GO

 /**
 * ---------------------------------------------------------------------------------------------
 * Rango Edad
 * ---------------------------------------------------------------------------------------------
 */
CREATE TABLE [SIN_NOMBRE].BI_RANGO_EDAD
(
	Id TINYINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Descripcion NVARCHAR(5) NOT NULL
)
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
	Rango_Edad TINYINT,
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
	Tipo NVARCHAR(255) NOT NULL,
	Tiempo_Estimado INT NOT NULL
)

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
	Rango_Edad TINYINT,
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

CREATE TABLE [SIN_NOMBRE].BI_MATERIAL
(
	Material NVARCHAR(100) NOT NULL PRIMARY KEY
)

/**
 * ---------------------------------------------------------------------------------------------
 * Tablas de Hechos
 * ---------------------------------------------------------------------------------------------
 */

 CREATE TABLE [SIN_NOMBRE].BI_HECHO_VIAJE(
   Tiempo INT NOT NULL,
   Patente NVARCHAR(15),
   Recorrido INT NOT NULL,
   Total_Facturado DECIMAL(18,2),
   Costo_Total DECIMAL(18,2)
 )

  CREATE TABLE [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO(
   Tiempo INT NOT NULL,
   Id_taller INT,
   Patente NVARCHAR(15),
   Modelo SMALLINT NOT NULL,
   Marca SMALLINT NOT NULL,
   Tarea_Mas_Utilizada INT NOT NULL,
   Material_Mas_Utilizado NVARCHAR(100) NOT NULL,
   Costo_Total DECIMAL(18,2),
   Desvio_Tarea INT,
   Horas_Sin_Servicio INT,
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
	Fecha_Creacion_OT DATETIME2(3), -- De la OT
	Fecha_Fin_OT DATETIME2(3), -- Calculado
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

ALTER TABLE [SIN_NOMBRE].BI_CHOFER WITH CHECK ADD
 CONSTRAINT [FK_bi_chofer_edad]		FOREIGN KEY(Rango_Edad) REFERENCES [SIN_NOMBRE].BI_RANGO_EDAD
GO

ALTER TABLE [SIN_NOMBRE].BI_MECANICO WITH CHECK ADD
 CONSTRAINT [FK_bi_mecanico_edad]	FOREIGN KEY(Rango_Edad) REFERENCES [SIN_NOMBRE].BI_RANGO_EDAD
GO

 ALTER TABLE [SIN_NOMBRE].[BI_CAMION] WITH CHECK ADD
	CONSTRAINT [FK__bi_camion_modelo] FOREIGN KEY(Marca, Modelo) REFERENCES [SIN_NOMBRE].BI_MODELO_CAMION (Marca_Id, Modelo_Id)
 GO

ALTER TABLE [SIN_NOMBRE].BI_MODELO_CAMION WITH CHECK ADD
 CONSTRAINT [FK_bi_modelo_marca] FOREIGN KEY(Marca_Id) REFERENCES [SIN_NOMBRE].BI_MARCA_CAMION
GO

ALTER TABLE [SIN_NOMBRE].[BI_HECHO_VIAJE] WITH CHECK ADD
	CONSTRAINT [FK_bi_h_viaje_tiempo]	FOREIGN KEY(Tiempo) REFERENCES [SIN_NOMBRE].[BI_TIEMPO],
	CONSTRAINT [FK_bi_h_viaje_recorr]	FOREIGN KEY(Recorrido) REFERENCES [SIN_NOMBRE].[BI_RECORRIDO],
	CONSTRAINT [FK_bi_h_viaje_patnte]	FOREIGN KEY(Patente) REFERENCES [SIN_NOMBRE].[BI_CAMION]
GO

ALTER TABLE [SIN_NOMBRE].[BI_HECHO_ORDEN_TRABAJO] WITH CHECK ADD
	CONSTRAINT  [FK_bi_h_ot_tiempo]		FOREIGN KEY(Tiempo) REFERENCES [SIN_NOMBRE].[BI_Tiempo]
	,CONSTRAINT [FK_bi_h_ot_camion]		FOREIGN KEY(Patente) REFERENCES [SIN_NOMBRE].[BI_CAMION]
	,CONSTRAINT [FK_bi_h_ot_modelo]		FOREIGN KEY(Marca, Modelo) REFERENCES [SIN_NOMBRE].[BI_MODELO_CAMION] (Marca_Id, Modelo_Id)
	,CONSTRAINT [FK_bi_h_ot_taller]		FOREIGN KEY(Id_Taller) REFERENCES [SIN_NOMBRE].[BI_TALLER]
	,CONSTRAINT [FK_bi_h_ot_tarea]		FOREIGN KEY(Tarea_Mas_Utilizada) REFERENCES [SIN_NOMBRE].[BI_TAREA]
	,CONSTRAINT [FK_bi_h_ot_material]	FOREIGN KEY(Material_Mas_Utilizado) REFERENCES [SIN_NOMBRE].[BI_MATERIAL]
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

 INSERT INTO [SIN_NOMBRE].[BI_RANGO_EDAD]
 VALUES ('18-30'),('31-50'),('>50')
 GO

IF(object_id(N'[SIN_NOMBRE].PR_CARGAR_TIEMPOS') IS NOT NULL)
    DROP PROCEDURE [SIN_NOMBRE].PR_CARGAR_TIEMPOS
GO

CREATE OR ALTER PROCEDURE [SIN_NOMBRE].PR_CARGAR_TIEMPOS
AS
BEGIN
		DECLARE @max_year INT
		DECLARE @min_year INT

		SELECT @min_year = MIN(Anio)
		FROM
		(SELECT MIN(YEAR([Fecha_Creacion])) AS [Anio] FROM [GD2C2021].[SIN_NOMBRE].[ORDEN_TRABAJO] OT
		 UNION 
		 SELECT MIN(YEAR([Fecha_Inicio]))   AS [Anio] FROM [GD2C2021].[SIN_NOMBRE].[VIAJE] V
		 ) AS Y

		SELECT @max_year = MAX(Anio)
		FROM
		(SELECT MAX(YEAR([Fecha_Creacion])) AS [Anio] FROM [GD2C2021].[SIN_NOMBRE].[ORDEN_TRABAJO] OT
		 UNION 
		 SELECT MAX(YEAR([Fecha_Inicio]))   AS [Anio] FROM [GD2C2021].[SIN_NOMBRE].[VIAJE] V
		 ) AS Y


		 BEGIN TRANSACTION
		 WHILE @min_year <= @max_year
		 BEGIN
		  INSERT INTO [SIN_NOMBRE].[BI_TIEMPO]
		  VALUES (@min_year, '1'),
				 (@min_year, '2'),
				 (@min_year, '3'),
				 (@min_year, '4')
		  SET @min_year = @min_year + 1
		 END
		 COMMIT TRANSACTION
END
GO

EXEC [SIN_NOMBRE].PR_CARGAR_TIEMPOS
GO

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
	  ,CASE WHEN DATEDIFF (YEAR, [Fecha_Nac] , GETDATE()) BETWEEN 18 AND 30 THEN '1'
			WHEN DATEDIFF (YEAR, [Fecha_Nac] , GETDATE()) BETWEEN 31 AND 50 THEN '2'
			ELSE '3' END AS [Rango_Edad]
  FROM [GD2C2021].[SIN_NOMBRE].[CHOFER]
  GO

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
	  ,CASE WHEN DATEDIFF (YEAR, [Fecha_Nac] , GETDATE()) BETWEEN 18 AND 30 THEN '1'
			WHEN DATEDIFF (YEAR, [Fecha_Nac] , GETDATE()) BETWEEN 31 AND 50 THEN '2'
			ELSE '3' END AS [Rango_Edad]
  FROM [GD2C2021].[SIN_NOMBRE].[MECANICO]
  GO


 INSERT INTO [SIN_NOMBRE].[BI_TAREA]
 SELECT T.[Codigo]
      ,TT.[Descripcion] AS [Tipo]
      ,T.[Tiempo_Estimado]
  FROM [GD2C2021].[SIN_NOMBRE].[TAREA] T
  INNER JOIN [SIN_NOMBRE].[TIPO_TAREA] TT ON  TT.Codigo = T.Tipo
  GO

 INSERT INTO [SIN_NOMBRE].[BI_MARCA_CAMION]
 SELECT [Id]
      ,[Descripcion]
 FROM [GD2C2021].[SIN_NOMBRE].[MARCA_CAMION]
 GO

 INSERT INTO [SIN_NOMBRE].[BI_MODELO_CAMION]
 SELECT [Marca_Id]
      ,[Modelo_Id]
      ,[Descripcion]
      ,[Velocidad_Max]
      ,[Capacidad_Tanque]
      ,[Capacidad_Carga]
  FROM [GD2C2021].[SIN_NOMBRE].[MODELO_CAMION]
  GO

 INSERT INTO [SIN_NOMBRE].[BI_CAMION]
 SELECT CAST([Patente] as NVARCHAR(15))
		,[Nro_Chasis]
		,[Nro_Motor]
		,[Fecha_Alta]
		,[Modelo_Id]
		,[Marca_Id]
FROM [GD2C2021].[SIN_NOMBRE].[CAMION]
GO

INSERT INTO [SIN_NOMBRE].BI_TALLER
SELECT T.Id
	, T.Direccion
	, T.Telefono
	, T.Mail
	, T.Nombre
	, C.Nombre
FROM [SIN_NOMBRE].TALLER T
JOIN [SIN_NOMBRE].CIUDAD C ON T.Ciudad = C.Id_Ciudad
GO

 INSERT INTO [SIN_NOMBRE].[BI_MATERIAL]
 SELECT Codigo
 FROM [SIN_NOMBRE].MATERIAL
 GO

 INSERT INTO [SIN_NOMBRE].[BI_RECORRIDO]
 SELECT [Codigo]
		,C.Nombre
		,C2.Nombre
		,R.[KM]
		,R.[Precio]
FROM [GD2C2021].[SIN_NOMBRE].[RECORRIDO] R
JOIN [SIN_NOMBRE].CIUDAD C  ON R.Ciudad_Origen = C.Id_Ciudad
JOIN [SIN_NOMBRE].CIUDAD C2 ON R.Ciudad_Destino = C2.Id_Ciudad
GO

/**
 -- Inserts de Hechos
**/
INSERT INTO [SIN_NOMBRE].[BI_HECHO_VIAJE]
SELECT
	T.Id AS [Tiempo]
	,CAST(V.Patente_Camion as NVARCHAR(15)) AS [Patente]
	,V.Cod_Recorrido AS [Recorrido]
	,V.Precio_Final + 
		(
		 SELECT SUM(PxV.Cantidad * TP.Precio) AS 'VALOR_TOTAL_PAQUETES'
			FROM [SIN_NOMBRE].PAQUETE_POR_VIAJE PxV
			JOIN [SIN_NOMBRE].PAQUETE P ON PxV.Id_Paquete = P.Id
			JOIN [SIN_NOMBRE].TIPO_PAQUETE TP ON P.Tipo = TP.Codigo
			WHERE PxV.Id_Viaje = V.Id
		) AS [Total_Facturado]
	 -- 1 LT Combustible = $100 + Asumimos que trabaja todos los dias 8 horas.
	,V.Consumo_Combustible * 100 + C.Costo_Hora * DATEDIFF(DAY, V.Fecha_Inicio, V.Fecha_Fin) * 8 AS [Costo_Total]
FROM [SIN_NOMBRE].VIAJE V
JOIN [SIN_NOMBRE].BI_TIEMPO T ON  T.Anio = YEAR(V.Fecha_Fin)
	 AND DATEPART(QUARTER,V.Fecha_Fin) = T.Cuatrimestre
JOIN [SIN_NOMBRE].CHOFER C ON C.Legajo = V.Legajo_Chofer
ORDER BY T.Id
GO

----------------- FUNCIONES NECESARIAS

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[SIN_NOMBRE].FN_COSTO_OT') AND xtype IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [SIN_NOMBRE].FN_COSTO_OT
GO

CREATE OR ALTER FUNCTION
[SIN_NOMBRE].FN_COSTO_OT(@ot INT)
RETURNS DECIMAL (18,2)
AS
BEGIN
	DECLARE @costo_mecanico INT
	DECLARE @costo_material DECIMAL(18,2)

	SELECT
		@costo_material = SUM(X.Precio)
		,@costo_mecanico = SUM(M.Costo_Hora * DATEDIFF(DAY, TxO.Fecha_Inicio_Real, TxO.Fecha_Fin_Real) * 8)
	FROM [SIN_NOMBRE].TAREA_POR_ORDEN TxO
	JOIN [SIN_NOMBRE].MECANICO M ON M.Legajo = TxO.Mecanico
	JOIN [SIN_NOMBRE].TAREA T ON TxO.Cod_Tarea = T.Codigo
	JOIN [SIN_NOMBRE].MATERIAL_POR_TAREA MxT ON MxT.Cod_Tarea = T.Codigo
	JOIN [SIN_NOMBRE].MATERIAL X ON  X.Codigo = MxT.Cod_Material
	WHERE TxO.Nro_OT = @ot
	GROUP BY TxO.Nro_OT

 RETURN @costo_material + @costo_mecanico 
END
GO

-- INSERT INTO [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO
IF (OBJECT_ID(N'[SIN_NOMBRE].PR_INSERT_HECHO_OT') IS NOT NULL )
	DROP PROCEDURE [SIN_NOMBRE].PR_INSERT_HECHO_OT
GO

CREATE OR ALTER PROCEDURE
[SIN_NOMBRE].PR_INSERT_HECHO_OT
AS
BEGIN

	DECLARE @c_h_ot CURSOR
	SET @c_h_ot = CURSOR FOR
	SELECT
		T.Id
		,OT.Nro_OT
		,CAST(OT.Patente_Camion as NVARCHAR(15)) AS [Patente]
		,C.Modelo_Id
		,C.Marca_Id
		,(
			SELECT TOP 1 Id_Taller
			FROM [SIN_NOMBRE].TAREA_POR_ORDEN  TxO
			JOIN [SIN_NOMBRE].MECANICO M ON M.Legajo = TxO.Mecanico
			WHERE TxO.Nro_OT = OT.Nro_OT
		)	AS [Id_Taller]
		,[SIN_NOMBRE].FN_COSTO_OT(OT.Nro_OT) AS [Costo_OT]
		,DATEDIFF(DAY,OT.Fecha_Creacion, 
				(
					SELECT MAX(TxO.Fecha_Fin_Real)
					FROM [SIN_NOMBRE].TAREA_POR_ORDEN TxO
					WHERE TxO.Nro_OT = OT.Nro_OT
				)
			  ) AS [Dias_Sin_Servicio]
	FROM [SIN_NOMBRE].ORDEN_TRABAJO OT
	JOIN [SIN_NOMBRE].CAMION C				ON C.Patente = OT.Patente_Camion
	JOIN [SIN_NOMBRE].BI_TIEMPO T			ON  T.Anio = YEAR(OT.Fecha_Creacion)
	 AND DATEPART(QUARTER,OT.Fecha_Creacion) = T.Cuatrimestre
	 ORDER BY 1, 3

	 DECLARE @tiempo	INT
	 DECLARE @ot		INT
	 DECLARE @patente	NVARCHAR(15)
	 DECLARE @modelo	SMALLINT
	 DECLARE @marca		SMALLINT
	 DECLARE @taller	INT
	 DECLARE @costo		DECIMAL(18,2)
	 DECLARE @sin_servicio INT

	 OPEN @c_h_ot
	 FETCH NEXT FROM @c_h_ot
	 INTO @tiempo, @ot, @patente, @modelo, @marca, @taller, @costo, @sin_servicio

	 BEGIN TRANSACTION
	 WHILE @@FETCH_STATUS = 0
	 BEGIN

		DECLARE @tarea INT
		DECLARE @material NVARCHAR(100)
		DECLARE @desvio INT

		SELECT TOP 1 
		 @tarea = TxO.Cod_Tarea
		 ,@desvio = ABS(DATEDIFF(DAY, TxO.Fecha_Inicio_Real, TxO.Fecha_Fin_Real) - T.Tiempo_Estimado)
		FROM [SIN_NOMBRE].TAREA_POR_ORDEN TxO
		JOIN [SIN_NOMBRE].TAREA T ON T.Codigo = TxO.Cod_Tarea
		WHERE TxO.Nro_OT = @ot
		ORDER BY NEWID()

		SELECT TOP 1
		 @material = MxT.Cod_Material 
		 FROM [SIN_NOMBRE].MATERIAL_POR_TAREA MxT
		 WHERE MxT.Cod_Tarea = @tarea
		 ORDER BY NEWID()

		 INSERT INTO [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO
		 VALUES (@tiempo, @taller, @patente, @modelo, @marca, @tarea, @material, @costo, @desvio, @sin_servicio)

	 	FETCH NEXT FROM @c_h_ot
		INTO @tiempo, @ot, @patente, @modelo, @marca, @taller, @costo, @sin_servicio
	 END
	 COMMIT TRANSACTION

	 CLOSE @c_h_ot
	 DEALLOCATE @c_h_ot
END
GO

EXEC [SIN_NOMBRE].PR_INSERT_HECHO_OT
GO
























INSERT INTO [SIN_NOMBRE].[BI_CAMION_VIAJE]
SELECT CAST(V.Patente_Camion as NVARCHAR(15))
	, V.Cod_Recorrido
	, V.Legajo_Chofer
	, V.Fecha_Inicio
	, V.Fecha_Fin
	, V.Consumo_Combustible
	, V.Precio_Final + (SELECT SUM(PxV.Cantidad * TP.Precio) AS 'VALOR_TOTAL_PAQUETES'
	FROM [SIN_NOMBRE].PAQUETE_POR_VIAJE PxV
	JOIN [SIN_NOMBRE].PAQUETE P ON PxV.Id_Paquete = P.Id
	JOIN [SIN_NOMBRE].TIPO_PAQUETE TP ON P.Tipo = TP.Codigo
	WHERE PxV.Id_Viaje = V.Id) AS 'PRECIO_TOTAL_VIAJE'
FROM [SIN_NOMBRE].VIAJE V
GO

INSERT INTO [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO]
SELECT 
	OT.Nro_OT
	,CAST(OT.Patente_Camion as NVARCHAR(15))
	,C.Modelo_Id
	,C.Marca_Id
	,TxO.Mecanico
	,M.Id_taller
	,OT.Fecha_Creacion
	, (select MAX(tpo.Fecha_Fin_Real) from [SIN_NOMBRE].TAREA_POR_ORDEN tpo where tpo.Nro_OT = OT.Nro_OT) -- Fecha fin OT
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
GO

/**
 * =============================================================================================
 * VIEWS
 * =============================================================================================
 */


--------------------5 TAREAS MÁS REALIZADAS POR MODELO CAMIÓN------------------

/*
SELECT cm.modelo_camion, t.descripcion
FROM [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO] cm
INNER JOIN [SIN_NOMBRE].[BI_TAREA] T ON T.Codigo = CM.Cod_Tarea
WHERE cm.cod_tarea in (select top 5 cod_tarea 
						from [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO] 
						group by cod_tarea
						order by count(cod_tarea))
GROUP BY cm.modelo_camion
*/


 --select cm.Modelo_Id, cm.Cod_Tarea, count(distinct cm.Cod_Tarea)
 --from SIN_NOMBRE.BI_CAMION_MANTENIMIENTO cm
 --group by cm.Modelo_Id, cm.Cod_Tarea
 --order by cm.Modelo_Id, cm.Cod_Tarea

 CREATE VIEW [SIN_NOMBRE].[V_Camion_Costo_Mant] AS
 Select cm.patente_camion, cm.id_taller
	, DATEPART(quarter, cm.Fecha_Fin_Real) as 'Cuatrimestre'
	, sum( (m.precio * cm.Material_Cantidad) + (cm.cantidad_horas_trabajadas * me.costo_hora)) as costo_total
 from SIN_NOMBRE.BI_CAMION_MANTENIMIENTO cm 
 inner join SIN_NOMBRE.BI_MECANICO me on cm.Legajo = me.legajo
 inner join SIN_NOMBRE.BI_MATERIAL m on cm.material = m.codigo
 group by cm.patente_camion, cm.id_taller, DATEPART(quarter, cm.Fecha_Fin_Real)
 GO

CREATE VIEW [SIN_NOMBRE].[V_Camion_Maximo_Tiempo_FueraDeServicio] AS
select cm.Patente_Camion
	, DATEPART(quarter, cm.Fecha_Creacion_OT) as 'Cuatrimestre'
	, max(DATEDIFF(DAY, cm.Fecha_Creacion_OT, cm.Fecha_Fin_OT)) as 'Maxima_Duracion_OT (Dias)'
from SIN_NOMBRE.BI_CAMION_MANTENIMIENTO cm
group by cm.Patente_Camion, DATEPART(quarter, cm.Fecha_Creacion_OT);
GO

CREATE VIEW [SIN_NOMBRE].[V_Facturacion_Recorrido_Cuatrimestre] AS
SELECT r.Codigo as 'Recorrido'
	, r.Origen as 'Ciudad_Origen'
	, r.Destino as 'Ciudad_Destino'
	, DATEPART(QUARTER, Fecha_Inicio) as 'Cuatrimestre'
	, SUM(Precio_Final) as 'Facturacion_Total'
FROM SIN_NOMBRE.BI_CAMION_VIAJE cv
JOIN SIN_NOMBRE.BI_RECORRIDO r on cv.Recorrido = r.Codigo
GROUP BY r.Codigo, r.Origen, r.Destino, DATEPART(QUARTER, Fecha_Inicio);
--ORDER BY r.Codigo, DATEPART(QUARTER, Fecha_Inicio);
GO

CREATE VIEW [SIN_NOMBRE].[V_Camion_Ganancias] AS
select cm.Patente_Camion
	, SUM(cv.Precio_Final) as 'Ingresos'
	, SUM(ch.Costo_Hora * (DATEDIFF(HOUR, cv.Fecha_Inicio, cv.Fecha_Fin)) + 100 * cv.Consumo_Combustible) as 'Costo_Viaje'
	, SUM(cm.Material_Cantidad * mt.Precio + cm.Cantidad_Horas_Trabajadas * mec.Costo_Hora) as 'Costo_Mantenimiento'
	, SUM(cv.Precio_Final)
		-
	SUM(ch.Costo_Hora * (DATEDIFF(HOUR, cv.Fecha_Inicio, cv.Fecha_Fin)) + 100 * cv.Consumo_Combustible)
		-
	SUM(cm.Material_Cantidad * mt.Precio + cm.Cantidad_Horas_Trabajadas * mec.Costo_Hora)
	as 'Ganancia'
from SIN_NOMBRE.BI_CAMION_VIAJE cv
join SIN_NOMBRE.BI_CAMION_MANTENIMIENTO cm on cv.Patente = cm.Patente_Camion
join SIN_NOMBRE.BI_CHOFER ch on cv.Legajo_Chofer = ch.Legajo
join SIN_NOMBRE.BI_MATERIAL mt on cm.Material = mt.Codigo
join SIN_NOMBRE.BI_MECANICO mec on cm.Legajo = mec.Legajo
group by cm.Patente_Camion;
GO

CREATE VIEW [SIN_NOMBRE].[V_Promedio_Costo_Chofer]
AS SELECT 
	CASE WHEN Edad BETWEEN 18 AND 30 THEN '18 - 30'
			  WHEN Edad BETWEEN 31 AND 50 THEN '31 - 50'
			  ELSE '> 50' END AS [Rango_Etario]
	,AVG(Costo_Hora) AS [Promedio]
FROM [SIN_NOMBRE].[BI_CHOFER]
GROUP BY CASE WHEN Edad BETWEEN 18 AND 30 THEN '18 - 30'
			  WHEN Edad BETWEEN 31 AND 50 THEN '31 - 50'
			  ELSE '> 50' END
GO


CREATE VIEW [SIN_NOMBRE].[V_Desvio_Tareas]
AS
SELECT DISTINCT
      [Id_taller]	AS [Taller]
      ,[Cod_Tarea]	AS [Tarea]
      ,AVG ( T.Tiempo_Estimado  - [Cantidad_Horas_Trabajadas]/8) AS [Desvio]
  FROM (SELECT DISTINCT
		CM2.Nro_Ot,
		CM2.Cod_Tarea,
		CM2.Id_taller,
		CM2.Cantidad_Horas_Trabajadas
		FROM [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO] CM2) CM
JOIN [SIN_NOMBRE].[BI_TAREA] T ON T.Codigo = CM.Cod_Tarea
GROUP BY CM.Id_taller, CM.Cod_Tarea
GO


-- Para el TOP 5 Tareas por Camion

-- Primero Vistamos las Tareas Realizadas
CREATE VIEW [SIN_NOMBRE].[V_Tareas_Realizadas]
AS
SELECT DISTINCT       
		[Nro_OT]
	  ,[Cod_Tarea]
	  ,[Marca_Id]
      ,[Modelo_Id]
	  ,[Id_Taller]
  FROM [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO]
GO
-- Despues Las Tareas Por Camion
CREATE VIEW [SIN_NOMBRE].[V_Tareas_Por_Camion]
AS
SELECT [Cod_Tarea]
	  ,[Marca_Id]
	  ,[Modelo_Id]
      ,ISNULL(COUNT(*), 0) AS [Ejecutadas]
FROM [SIN_NOMBRE].[V_Tareas_Realizadas]
GROUP BY [Cod_Tarea], [Marca_Id], [Modelo_Id]
GO

-- Finalmente Los Camiones con Sus respectivas Tareas
CREATE VIEW [SIN_NOMBRE].[V_TOP_5_Tareas_Por_Camion]
AS
SELECT DISTINCT
   T.[Marca_ID]
  ,T.[Modelo_ID]
  ,T.[Cod_Tarea]
  ,TE.Ejecutadas AS [Veces Realizas]
FROM [SIN_NOMBRE].[V_Tareas_Realizadas] T
JOIN [SIN_NOMBRE].[V_Tareas_Por_Camion] TE ON 
	TE.Modelo_Id = T.Modelo_Id AND TE.Cod_Tarea = T.Cod_Tarea
	AND TE.Marca_Id = T.Marca_Id
WHERE T.Cod_Tarea IN (SELECT TOP 5 Cod_Tarea
						FROM [SIN_NOMBRE].[V_Tareas_Por_Camion] TxC
						WHERE T.Marca_Id = TxC.Marca_Id
						AND T.Modelo_Id = TxC.Modelo_Id
						ORDER BY Ejecutadas DESC)
GO

CREATE VIEW [SIN_NOMBRE].[V_Materiales_Taller]
AS
SELECT
       [Id_taller]
      ,[Material]
      ,SUM([Material_Cantidad]) AS [Veces_Utilizado]
  FROM [GD2C2021].[SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO]
GROUP BY Id_taller, Material
GO

CREATE VIEW [SIN_NOMBRE].[V_Top_10_Materiales_Taller]
AS
SELECT DISTINCT
	 CM.[Id_taller] AS [Taller]
	,CM.[Material]
	,VMT.Veces_Utilizado
FROM [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO] CM
JOIN [SIN_NOMBRE].[V_Materiales_Taller]  VMT ON VMT.Id_taller = CM.Id_taller AND VMT.Material = CM.Material
WHERE CM.Material IN (SELECT TOP 10 
							Material
						FROM [SIN_NOMBRE].[V_Materiales_Taller] MT
						WHERE MT.Id_taller = CM.Id_taller
						ORDER BY MT.[Veces_Utilizado] DESC)
GO
