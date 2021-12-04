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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_TIPO_TAREA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TIPO_TAREA
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_MATERIAL') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_MATERIAL
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

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_TIEMPO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_TIEMPO
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].BI_RANGO_EDAD') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].BI_RANGO_EDAD
GO

/**
 * ---------------------------------------------------------------------------------------------
 * DIMENSION Tiempo
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
 * DIMENSION Rango Edad
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
 * DIMENSION Chofer
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
 * DIMENSION Tipo Tarea
 * ---------------------------------------------------------------------------------------------
 */


CREATE TABLE [SIN_NOMBRE].BI_TIPO_TAREA
(
	Codigo INT NOT NULL PRIMARY KEY,
	Tipo NVARCHAR(255) NOT NULL,
	Tiempo_Estimado INT NOT NULL,
	Costo DECIMAL(18,2)
)

CREATE TABLE [SIN_NOMBRE].BI_TAREA
(
	Tarea INT NOT NULL,
	Material NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_BI_TAREA PRIMARY KEY (Tarea, Material)
)

CREATE TABLE [SIN_NOMBRE].BI_MATERIAL
(
	Material NVARCHAR(100) NOT NULL PRIMARY KEY
)

/**
 * ---------------------------------------------------------------------------------------------
 * DIMENSION MODELO CAMION
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
 * Tablas de Hechos
 * ---------------------------------------------------------------------------------------------
 */

 CREATE TABLE [SIN_NOMBRE].BI_HECHO_VIAJE(
   Tiempo INT NOT NULL,
   Patente NVARCHAR(15),
   Recorrido INT NOT NULL,
   Total_Facturado DECIMAL(18,2),
   Costo_Total DECIMAL(18,2)
   CONSTRAINT PK_h_viaje PRIMARY KEY (Tiempo, Patente, Recorrido)
 )

  CREATE TABLE [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO(
   Tiempo INT NOT NULL,
   Id_taller INT,
   Patente NVARCHAR(15),
   Modelo SMALLINT NOT NULL,
   Marca SMALLINT NOT NULL,
   Tarea INT NOT NULL,
   Costo DECIMAL(18,2),
   Desvio_Tarea INT,
   Horas_Sin_Servicio INT,
   CONSTRAINT PK_h_ot PRIMARY KEY (Tiempo, Id_taller, Patente, Modelo, Marca, Tarea)
 )

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

ALTER TABLE [SIN_NOMBRE].BI_TAREA WITH CHECK ADD
	CONSTRAINT		[FK_bi_tarea_tipo]		FOREIGN KEY(Tarea) REFERENCES [SIN_NOMBRE].BI_Tipo_Tarea
	,CONSTRAINT		[FK_bi_tarea_material]	FOREIGN KEY(Material) REFERENCES [SIN_NOMBRE].BI_Material
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
	,CONSTRAINT [FK_bi_h_ot_tarea]		FOREIGN KEY(Tarea) REFERENCES [SIN_NOMBRE].[BI_TIPO_TAREA]
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

-- Dimension Tipo Tarea

 INSERT INTO [SIN_NOMBRE].[BI_TIPO_TAREA]
 SELECT T.[Codigo]
      ,TT.[Descripcion] AS [Tipo]
      ,T.[Tiempo_Estimado]
	  ,(
		SELECT 
		SUM(M.Precio)
		FROM [SIN_NOMBRE].MATERIAL_POR_TAREA MxT
		JOIN [SIN_NOMBRE].MATERIAL M ON M.Codigo = MxT.Cod_Material
		WHERE MxT.Cod_Tarea = T.Codigo
	  ) AS [Costo]
  FROM [GD2C2021].[SIN_NOMBRE].[TAREA] T
  INNER JOIN [SIN_NOMBRE].[TIPO_TAREA] TT ON  TT.Codigo = T.Tipo
  GO

 INSERT INTO [SIN_NOMBRE].[BI_MATERIAL]
 SELECT Codigo
 FROM [SIN_NOMBRE].MATERIAL
 GO

INSERT INTO [SIN_NOMBRE].[BI_TAREA]
SELECT
	Cod_Tarea,
	Cod_Material
FROM [SIN_NOMBRE].MATERIAL_POR_TAREA
GO

-- Dimension Modelo Camion

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

CREATE OR ALTER FUNCTION
[SIN_NOMBRE].FN_VALOR_VIAJE(@viaje INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
 RETURN  (
			SELECT SUM(PxV.Cantidad * TP.Precio) AS 'VALOR_TOTAL_PAQUETES'
			FROM [SIN_NOMBRE].PAQUETE_POR_VIAJE PxV
			JOIN [SIN_NOMBRE].PAQUETE P ON PxV.Id_Paquete = P.Id
			JOIN [SIN_NOMBRE].TIPO_PAQUETE TP ON P.Tipo = TP.Codigo
			WHERE PxV.Id_Viaje = @viaje
		  )
END
GO

INSERT INTO [SIN_NOMBRE].[BI_HECHO_VIAJE]
SELECT
	T.Id AS [Tiempo]
	,CAST(V.Patente_Camion as NVARCHAR(15)) AS [Patente]
	,V.Cod_Recorrido AS [Recorrido]
	,SUM(V.Precio_Final + [SIN_NOMBRE].FN_VALOR_VIAJE(V.Id)) AS [Total_Facturado]
	 -- 1 LT Combustible = $100 + Asumimos que trabaja todos los dias 8 horas.
	,SUM(V.Consumo_Combustible * 100 + C.Costo_Hora * DATEDIFF(DAY, V.Fecha_Inicio, V.Fecha_Fin) * 8) AS [Costo_Total]
FROM [SIN_NOMBRE].VIAJE V
JOIN [SIN_NOMBRE].BI_TIEMPO T ON  T.Anio = YEAR(V.Fecha_Fin)
	 AND DATEPART(QUARTER,V.Fecha_Fin) = T.Cuatrimestre
JOIN [SIN_NOMBRE].CHOFER C ON C.Legajo = V.Legajo_Chofer
GROUP BY T.Id, V.Patente_Camion, V.Cod_Recorrido
ORDER BY V.Patente_Camion, T.Id, Recorrido
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
		,TxO.Cod_Tarea
		,CAST(OT.Patente_Camion as NVARCHAR(15)) AS [Patente]
		,C.Modelo_Id
		,C.Marca_Id
		,TL.Id
		,SUM(TT.Costo) AS [Costo]
		,SUM(ABS(DATEDIFF(DAY, TxO.Fecha_Inicio_Real, TxO.Fecha_Fin_Real) - TT.Tiempo_Estimado)) AS [Desvio]
		,SUM(DATEDIFF(DAY, OT.Fecha_Creacion, TxO.Fecha_Fin_Real))								AS [Dias_Sin_Servicio]
	FROM [SIN_NOMBRE].ORDEN_TRABAJO OT
	JOIN [SIN_NOMBRE].CAMION C				ON C.Patente = OT.Patente_Camion
	JOIN [SIN_NOMBRE].BI_TIEMPO T			ON  T.Anio = YEAR(OT.Fecha_Creacion)
	 AND DATEPART(QUARTER,OT.Fecha_Creacion) = T.Cuatrimestre
	JOIN [SIN_NOMBRE].TAREA_POR_ORDEN TxO	ON TxO.Nro_OT = OT.Nro_OT
	JOIN [SIN_NOMBRE].BI_TIPO_TAREA TT		ON TT.Codigo = TxO.Cod_Tarea
	LEFT JOIN [SIN_NOMBRE].MECANICO	M			ON M.Legajo = TxO.Mecanico
	LEFT JOIN [SIN_NOMBRE].TALLER	TL			ON TL.Id	= M.Id_taller
	WHERE TxO.Cod_Tarea IN (1,2,3,4,5,6)
	GROUP BY  T.Id, TxO.Cod_Tarea, Tl.Id, OT.Patente_Camion, C.Modelo_Id, C.Marca_Id
	 ORDER BY 1, 3

	 DECLARE @tiempo		INT
	 DECLARE @tarea			INT
	 DECLARE @patente		NVARCHAR(15)
	 DECLARE @modelo		SMALLINT
	 DECLARE @marca			SMALLINT
	 DECLARE @taller		INT
	 DECLARE @costo			DECIMAL(18,2)
	 DECLARE @desvio		INT
	 DECLARE @sin_servicio	INT

	 OPEN @c_h_ot
	 FETCH NEXT FROM @c_h_ot
	 INTO @tiempo, @tarea, @patente, @modelo, @marca, @taller, @costo, @desvio, @sin_servicio

	 BEGIN TRANSACTION
	 WHILE @@FETCH_STATUS = 0
	 BEGIN
		 INSERT INTO [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO
		 VALUES (@tiempo, @taller, @patente, @modelo, @marca, @tarea, @costo, @desvio, @sin_servicio)

	 	FETCH NEXT FROM @c_h_ot
		INTO @tiempo, @tarea, @patente, @modelo, @marca, @taller, @costo, @desvio, @sin_servicio

	 END
	 COMMIT TRANSACTION

	 CLOSE @c_h_ot
	 DEALLOCATE @c_h_ot
END
GO

EXEC [SIN_NOMBRE].PR_INSERT_HECHO_OT
GO

/*
 * =============================================================================================
 * VIEWS
 * =============================================================================================
 */

-- Maximo Tiempo Fuera de Servicio
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Camion_Maximo_Tiempo_FueraDeServicio] AS
SELECT
	T.Anio
	,T.Cuatrimestre
	,OT.Patente		AS [Camion]
	,MAX(OT.Horas_Sin_Servicio) AS [Sin_Servicio]
FROM [SIN_NOMBRE].[BI_HECHO_ORDEN_TRABAJO] OT
JOIN [SIN_NOMBRE].[BI_TIEMPO] T ON T.Id = OT.Tiempo
GROUP BY T.Anio, T.Cuatrimestre, OT.Patente
GO

-- Costo Mantenimiento Por Cuatrimestre
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Camion_Costo_Mant] 
AS
SELECT
	T.Anio
	,T.Cuatrimestre
	,OT.Patente
	,SUM(OT.Costo) AS [Costo Total Cuatrimestral]
FROM [SIN_NOMBRE].[BI_HECHO_ORDEN_TRABAJO] OT
JOIN [SIN_NOMBRE].[BI_TIEMPO] T ON T.Id = OT.Tiempo
GROUP BY T.Anio, T.Cuatrimestre, OT.Patente
GO


-- DESVIO PROMEDIO POR TALLER
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Desvio_Tareas]
AS
SELECT DISTINCT
      OT.[Id_taller]				AS [Taller]
	  ,OT.[Tarea]		AS [Tarea]
      ,AVG(Desvio_Tarea)			AS [Promedio Desvio]
  FROM [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO OT
  GROUP BY OT.Id_taller, OT.Tarea
GO

-- TOP 5 Tareas Mas Utilizadas Por Camion
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_TOP_5_Tareas_Por_Camion]
AS
SELECT DISTINCT 
	OT.Marca
	,OT.Modelo
	,OT.Tarea
FROM [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO OT
WHERE OT.Tarea IN (
									SELECT TOP 5
									OT2.Tarea
									FROM [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO OT2
									WHERE OT2.Marca = OT.Marca AND OT2.Modelo = OT.Modelo
									GROUP BY OT2.Tarea
									ORDER BY COUNT(OT2.Tarea) DESC
								)
GO

-- TOP 10 Materiales mas utilizados por Taller
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Top_10_Materiales_Taller]
AS
SELECT DISTINCT
	OT.Id_taller AS [Taller]
	,OT.Material_Mas_Utilizado AS [Material]
FROM [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO OT
WHERE OT.Material_Mas_Utilizado IN (
									SELECT TOP 10
									 OT2.Material_Mas_Utilizado
									FROM [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO OT2
									WHERE OT2.Id_taller = OT.Id_taller
									GROUP BY OT2.Material_Mas_Utilizado
									ORDER BY COUNT(OT2.Material_Mas_Utilizado) DESC
									)
GO

--- Facturacion Total Por Recorrido
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Facturacion_Recorrido_Cuatrimestre] AS
SELECT 
	T.Anio
	,T.Cuatrimestre
	,V.Recorrido
	,R.Origen	AS [Ciudad_Origen]
	,R.Destino	AS [Ciudad_Destino]
	,SUM(V.Total_Facturado) AS [Facturacion_Cuatrimestral]
FROM [SIN_NOMBRE].BI_HECHO_VIAJE V
JOIN SIN_NOMBRE.BI_RECORRIDO R on V.Recorrido = R.Codigo
JOIN [SIN_NOMBRE].[BI_TIEMPO] T ON T.Id = V.Tiempo
GROUP BY T.Anio, T.Cuatrimestre, V.Recorrido, R.Origen, R.Destino
GO


--- Costo Promedio x Rango Etario
CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Promedio_Costo_Chofer]
AS 
SELECT 
	 E.Descripcion
	,AVG(Costo_Hora) AS [Promedio]
FROM [SIN_NOMBRE].[BI_CHOFER] C
JOIN [SIN_NOMBRE].BI_RANGO_EDAD E ON C.Rango_Edad = E.Id
GROUP BY E.Descripcion
GO

--- GANANCIAS DE CAMION
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[SIN_NOMBRE].FN_COSTO_MANT') AND xtype IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [SIN_NOMBRE].FN_COSTO_MANT
GO

CREATE OR ALTER FUNCTION 
[SIN_NOMBRE].FN_COSTO_MANT(@patente NVARCHAR(15))
RETURNS INT
AS
BEGIN
 RETURN		(	SELECT
					SUM(OT.Costo) AS [Costo_Mantenimiento]
				FROM [SIN_NOMBRE].BI_HECHO_ORDEN_TRABAJO OT
				WHERE OT.Patente = @patente
			)
END
GO

CREATE OR ALTER VIEW [SIN_NOMBRE].[V_Camion_Ganancias] 
AS
SELECT 
	V.Patente
	,SUM(V.Total_Facturado - V.Costo_Total - [SIN_NOMBRE].FN_COSTO_MANT(V.Patente)) AS	[Ganancia]
FROM [SIN_NOMBRE].BI_HECHO_VIAJE V
GROUP BY V.Patente
GO
