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
  GO

 INSERT INTO [SIN_NOMBRE].[BI_TAREA]
 SELECT T.[Codigo]
      ,TT.[Descripcion] AS [Tipo]
      ,T.[Descripcion]
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
  GO

 INSERT INTO [SIN_NOMBRE].[BI_MATERIAL]
 SELECT Codigo
	, Descripcion
	, Precio
 FROM [SIN_NOMBRE].MATERIAL
 GO

 INSERT INTO [SIN_NOMBRE].[BI_RECORRIDO]
 SELECT [Codigo]
		,C.Nombre
		,C2.Nombre
		,[KM]
		,[Precio]
FROM [GD2C2021].[SIN_NOMBRE].[RECORRIDO] R
JOIN [SIN_NOMBRE].CIUDAD C  ON R.Ciudad_Origen = C.Id_Ciudad
JOIN [SIN_NOMBRE].CIUDAD C2 ON R.Ciudad_Destino = C2.Id_Ciudad
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
