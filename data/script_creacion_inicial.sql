USE [GD2C2021]
GO

SET ANSI_NULLS ON
GO

SET NOCOUNT OFF
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'SIN_NOMBRE')
    EXEC('CREATE SCHEMA SIN_NOMBRE');
GO

/* BORRADO DE TABLAS */

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].TAREA_POR_ORDEN') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].TAREA_POR_ORDEN
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].MATERIAL_POR_TAREA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].MATERIAL_POR_TAREA
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].PAQUETE_POR_VIAJE') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].PAQUETE_POR_VIAJE
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].TAREA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].TAREA
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].TIPO_TAREA') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].TIPO_TAREA
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].ORDEN_TRABAJO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].ORDEN_TRABAJO
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].ESTADO_ORDEN_TRABAJO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].ESTADO_ORDEN_TRABAJO
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].PAQUETE') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].PAQUETE
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].TIPO_PAQUETE') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].TIPO_PAQUETE
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].MATERIAL') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].MATERIAL
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].MECANICO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].MECANICO
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].TALLER') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].TALLER
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].VIAJE') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].VIAJE
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].RECORRIDO') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].RECORRIDO
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].CIUDAD') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].CIUDAD
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].CAMION
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].MODELO_CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].MODELO_CAMION
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].MARCA_CAMION') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].MARCA_CAMION
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SIN_NOMBRE].CHOFER') AND type in (N'U'))
	DROP TABLE [SIN_NOMBRE].CHOFER
GO


/* CREACION DE TABLAS */

----------------- CIUDAD

CREATE TABLE [SIN_NOMBRE].CIUDAD (
	Id_Ciudad INT IDENTITY(1,1),
	Nombre NVARCHAR(255),
	CONSTRAINT PK_ciudad PRIMARY KEY(id_ciudad)
)

----------------- PAQUETES

CREATE TABLE [SIN_NOMBRE].TIPO_PAQUETE (
	Codigo TINYINT IDENTITY (1, 1),
	Descripcion NVARCHAR(255),
	Peso_max DECIMAL(18, 2),
	Alto_max DECIMAL(18, 2),
	Ancho_max DECIMAL(18, 2),
	Largo_max DECIMAL(18, 2),
	Precio DECIMAL(18, 2),
	CONSTRAINT PK_tipo_paquete PRIMARY KEY (Codigo),
	CONSTRAINT ck_peso_max CHECK (Peso_max > 0),
	CONSTRAINT ck_alto_max CHECK (Alto_max > 0),
	CONSTRAINT ck_ancho_max CHECK (Ancho_max > 0),
	CONSTRAINT ck_largo_max CHECK (Largo_max > 0)
	--CONSTRAINT ck_desc CHECK (Descripcion IN ('Peque�o', 'Mediano', 'Grande'))
)
GO

CREATE TABLE [SIN_NOMBRE].PAQUETE(
	Id INT IDENTITY(1,1),
	Tipo TINYINT,
	Peso DECIMAL(18, 2),
	Alto DECIMAL(18, 2),
	Ancho DECIMAL(18, 2),
	Largo DECIMAL(18, 2),
	CONSTRAINT PK_paquete PRIMARY KEY (Id),
	CONSTRAINT ck_peso CHECK (Peso > 0),
	CONSTRAINT ck_alto CHECK (Alto > 0),
	CONSTRAINT ck_ancho CHECK (Ancho > 0),
	CONSTRAINT ck_largo CHECK (Largo > 0),
)
GO

-------- TALLER

CREATE TABLE [SIN_NOMBRE].TALLER
(
	Id INT IDENTITY(1, 1),
	Direccion NVARCHAR(255) NOT NULL,
	Telefono DECIMAL(18, 0),
	Mail NVARCHAR(255),
	Nombre NVARCHAR(255) NOT NULL,
	Ciudad INT,
	CONSTRAINT PK_taller PRIMARY KEY (ID ASC)
)

CREATE TABLE [SIN_NOMBRE].MECANICO (
	Legajo INT,
	Id_taller INT,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR(255) NOT NULL,
	DNI DECIMAL(18, 2) CONSTRAINT UQ_MECANICO_DNI UNIQUE NOT NULL,
	Direccion NVARCHAR(255),
	Telefono INT,
	Mail NVARCHAR(255),
	Fecha_Nac DATETIME2(3),
	Costo_Hora DECIMAL(18, 0) NOT NULL,
	CONSTRAINT PK_mecanico PRIMARY KEY(LEGAJO)
)


------------------------ CAMION

CREATE TABLE [SIN_NOMBRE].CAMION (
	Patente NVARCHAR(255) NOT NULL,
	Nro_Chasis NVARCHAR(255) NOT NULL,
	Nro_Motor NVARCHAR(255) NULL,
	Fecha_Alta  DATETIME2(3) NULL,
	Marca_Id SMALLINT,
	Modelo_Id SMALLINT,
	CONSTRAINT PK_camion PRIMARY KEY(Patente)
)
GO

CREATE TABLE [SIN_NOMBRE].MODELO_CAMION (
	Marca_Id SMALLINT,
	Modelo_Id SMALLINT IDENTITY(1,1),
	Descripcion NVARCHAR(255),
	Velocidad_Max INT,
	Capacidad_Tanque INT,
	Capacidad_Carga INT, 
	CONSTRAINT PK_modelo_camion PRIMARY KEY(Marca_Id, Modelo_Id)
)

CREATE TABLE [SIN_NOMBRE].MARCA_CAMION
(
	Id SMALLINT IDENTITY(1, 1),
	Descripcion NVARCHAR(255),
	CONSTRAINT PK_marca_camion PRIMARY KEY (Id ASC)
)

CREATE TABLE [SIN_NOMBRE].CHOFER (
	Legajo INT,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR(255) NOT NULL,
	DNI DECIMAL(18, 0) CONSTRAINT uq_chofer_dni UNIQUE NOT NULL,
	Direccion NVARCHAR(255),
	Telefono INT,
	Mail NVARCHAR(255),
	Fecha_Nac DATETIME2(3),
	Costo_Hora INT NOT NULL,
	CONSTRAINT PK_chofer PRIMARY KEY (Legajo)
)

------------------- OTs

CREATE TABLE [SIN_NOMBRE].ESTADO_ORDEN_TRABAJO
(
	Id_Estado TINYINT IDENTITY(1, 1),
	Descripcion NVARCHAR(255) NULL,
	CONSTRAINT PK_estado_ot PRIMARY KEY ( Id_Estado ASC )
)

CREATE TABLE [SIN_NOMBRE].ORDEN_TRABAJO (
	Nro_OT INT IDENTITY(1,1),
	Fecha_Creacion DATETIME2(3), /*Maestra tiene NVARCHAR como tipo de dato*/
	Patente_Camion NVARCHAR(255),
	Legajo_Mecanico INT,
	Estado TINYINT,
	CONSTRAINT PK_ot PRIMARY KEY (Nro_OT)
)
GO

---------------------- TAREAS

CREATE TABLE [SIN_NOMBRE].MATERIAL (
	Codigo NVARCHAR(100),
	Descripcion NVARCHAR(255),
	Precio DECIMAL(18, 2),
	CONSTRAINT PK_material PRIMARY KEY (Codigo),
)	

CREATE TABLE [SIN_NOMBRE].TIPO_TAREA
(
	Codigo TINYINT IDENTITY(1, 1),
	Descripcion NVARCHAR(255),
	CONSTRAINT PK_tipo_tarea PRIMARY KEY (Codigo ASC),
	--CONSTRAINT CK_descripcion CHECK (Descripcion IN ('Mantenimiento Preventivo', 'Mantenimiento Correctivo'))
)

CREATE TABLE [SIN_NOMBRE].TAREA
(
	Codigo INT NOT NULL,
	Tipo TINYINT,
	Descripcion NVARCHAR(255),
	Tiempo_Estimado INT,
	CONSTRAINT PK_tarea PRIMARY KEY (Codigo ASC),
	CONSTRAINT FK_tarea_tipo FOREIGN KEY (Tipo) REFERENCES [SIN_NOMBRE].TIPO_TAREA
)
GO

CREATE TABLE [SIN_NOMBRE].TAREA_POR_ORDEN
(
	Fecha_Inicio_Planificado DATETIME2(3),
	Fecha_Inicio_Real DATETIME2(3),
	Fecha_Fin_Real DATETIME2(3),
	Cod_Tarea INT,
	Nro_OT INT,
	CONSTRAINT PK_tarea_ot PRIMARY KEY(Cod_Tarea, Nro_OT)
)
GO

CREATE TABLE [SIN_NOMBRE].MATERIAL_POR_TAREA (
	Cod_Material NVARCHAR(100),
	Cod_Tarea INT,
	Cantidad INT
	CONSTRAINT PK_material_tarea PRIMARY KEY(Cod_Material, Cod_Tarea)
)
GO

-------- VIAJES

CREATE TABLE [SIN_NOMBRE].VIAJE (
	Id INT IDENTITY(1,1),
	Fecha_Inicio DATETIME2(7) NOT NULL,
	Fecha_Fin DATETIME2(3) NOT NULL,
	Consumo_Combustible DECIMAL(18, 2),
	Precio_Final DECIMAL(18, 0),
	Cod_Recorrido INT,
	Legajo_Chofer INT,
	Patente_Camion NVARCHAR(255),
	CONSTRAINT PK_viaje PRIMARY KEY (Id)
)
GO

CREATE TABLE [SIN_NOMBRE].PAQUETE_POR_VIAJE (
	Id_Viaje INT,
	Id_Paquete INT,
	Cantidad INT,
	CONSTRAINT PK_paquete_viaje PRIMARY KEY(Id_Viaje, Id_Paquete)
)
GO

CREATE TABLE [SIN_NOMBRE].RECORRIDO
(
	Codigo INT IDENTITY(1, 1),
	Ciudad_Origen INT,
	Ciudad_Destino INT,
	KM INT,
	Precio DECIMAL(18, 2),
	CONSTRAINT PK_recorrido PRIMARY KEY (Codigo ASC)
)



-------- FOREIGN KEYS
ALTER TABLE [SIN_NOMBRE].PAQUETE WITH CHECK ADD
	CONSTRAINT [FK_paquete_tipo] FOREIGN KEY(Tipo) REFERENCES [SIN_NOMBRE].TIPO_PAQUETE
GO

ALTER TABLE [SIN_NOMBRE].TALLER WITH CHECK ADD
	CONSTRAINT [FK_taller_ciudad] FOREIGN KEY(Ciudad) REFERENCES [SIN_NOMBRE].CIUDAD
GO

ALTER TABLE [SIN_NOMBRE].RECORRIDO WITH CHECK ADD
	CONSTRAINT [FK_recorrido_ciudadorigen] FOREIGN KEY(Ciudad_Origen) REFERENCES [SIN_NOMBRE].CIUDAD,
	CONSTRAINT [FK_recorrido_ciudaddestino] FOREIGN KEY(Ciudad_Destino) REFERENCES [SIN_NOMBRE].CIUDAD
GO

ALTER TABLE [SIN_NOMBRE].MECANICO WITH CHECK ADD
	CONSTRAINT [FK_mecanico_taller] FOREIGN KEY(Id_taller) REFERENCES [SIN_NOMBRE].TALLER
GO

ALTER TABLE [SIN_NOMBRE].MODELO_CAMION WITH CHECK ADD
	CONSTRAINT [FK_modelocamion_marca] FOREIGN KEY(Marca_Id) REFERENCES [SIN_NOMBRE].MARCA_CAMION
GO

ALTER TABLE [SIN_NOMBRE].CAMION WITH CHECK ADD
	CONSTRAINT [FK_camion_modelo] FOREIGN KEY(Marca_Id, Modelo_Id) REFERENCES [SIN_NOMBRE].MODELO_CAMION (Marca_Id, Modelo_Id)
GO

ALTER TABLE [SIN_NOMBRE].ORDEN_TRABAJO WITH CHECK ADD
	CONSTRAINT [FK_ot_camion] FOREIGN KEY(Patente_Camion) REFERENCES [SIN_NOMBRE].CAMION,
	CONSTRAINT [FK_ot_mecanico] FOREIGN KEY(Legajo_Mecanico) REFERENCES [SIN_NOMBRE].MECANICO,
	CONSTRAINT [FK_ot_estado] FOREIGN KEY (Estado) REFERENCES [SIN_NOMBRE].ESTADO_ORDEN_TRABAJO
GO

ALTER TABLE [SIN_NOMBRE].VIAJE WITH CHECK ADD
	CONSTRAINT [FK_viaje_recorrido] FOREIGN KEY(Cod_Recorrido) REFERENCES [SIN_NOMBRE].RECORRIDO,
	CONSTRAINT [FK_viaje_chofer] FOREIGN KEY(Legajo_Chofer) REFERENCES [SIN_NOMBRE].CHOFER,
	CONSTRAINT [FK_viaje_camion] FOREIGN KEY(Patente_Camion) REFERENCES [SIN_NOMBRE].CAMION
GO

ALTER TABLE [SIN_NOMBRE].MATERIAL_POR_TAREA WITH CHECK ADD
	CONSTRAINT [FK_MxT_Tarea] FOREIGN KEY(Cod_Tarea) REFERENCES [SIN_NOMBRE].TAREA,
	CONSTRAINT [FK_MxT_Material] FOREIGN KEY(Cod_Material) REFERENCES [SIN_NOMBRE].MATERIAL
GO

ALTER TABLE [SIN_NOMBRE].TAREA_POR_ORDEN WITH CHECK ADD
	CONSTRAINT [FK_TXO_Tarea] FOREIGN KEY(Cod_Tarea) REFERENCES [SIN_NOMBRE].TAREA,
	CONSTRAINT [FK_TXO_Orden] FOREIGN KEY([Nro_OT]) REFERENCES [SIN_NOMBRE].ORDEN_TRABAJO
GO

ALTER TABLE [SIN_NOMBRE].PAQUETE_POR_VIAJE WITH CHECK ADD
	CONSTRAINT [FK_PxV_viaje] FOREIGN KEY(Id_Viaje) REFERENCES [SIN_NOMBRE].VIAJE,
	CONSTRAINT [FK_PxV_paquete] FOREIGN KEY(Id_Paquete) REFERENCES [SIN_NOMBRE].PAQUETE
GO


----------------------------------------------------------------------------------------------

/* nota: considerar manejo de errores */

--CREATE PROCEDURE [SIN_NOMBRE].pr_populate_chofer AS
--BEGIN 
	INSERT INTO SIN_NOMBRE.CHOFER
	SELECT DISTINCT CHOFER_NRO_LEGAJO, [CHOFER_NOMBRE], [CHOFER_APELLIDO], [CHOFER_DNI], [CHOFER_DIRECCION], [CHOFER_TELEFONO], [CHOFER_MAIL], [CHOFER_FECHA_NAC], [CHOFER_COSTO_HORA]
	FROM gd_esquema.Maestra
	WHERE CHOFER_NRO_LEGAJO IS NOT NULL
--END
--GO

	INSERT INTO SIN_NOMBRE.MATERIAL
	SELECT DISTINCT [MATERIAL_COD], [MATERIAL_DESCRIPCION], [MATERIAL_PRECIO]
	FROM gd_esquema.Maestra
	WHERE MATERIAL_COD IS NOT NULL


	INSERT INTO SIN_NOMBRE.CIUDAD
	SELECT DISTINCT [TALLER_CIUDAD] /*busco todas las ciudades posibles presentes en la tabla*/
	FROM gd_esquema.Maestra
	WHERE [TALLER_CIUDAD] IS NOT NULL
	UNION
	SELECT [RECORRIDO_CIUDAD_DESTINO]
	FROM gd_esquema.Maestra
	WHERE [RECORRIDO_CIUDAD_DESTINO] IS NOT NULL
	UNION
	SELECT [RECORRIDO_CIUDAD_ORIGEN]
	FROM gd_esquema.Maestra
	WHERE [RECORRIDO_CIUDAD_ORIGEN] IS NOT NULL
	ORDER BY 1


	INSERT INTO SIN_NOMBRE.TALLER
	SELECT DISTINCT [TALLER_DIRECCION], [TALLER_TELEFONO], [TALLER_MAIL], [TALLER_NOMBRE], C.Id_ciudad
	FROM gd_esquema.Maestra
	JOIN SIN_NOMBRE.CIUDAD C ON TALLER_CIUDAD = C.Nombre 
	WHERE TALLER_NOMBRE IS NOT NULL


	INSERT INTO SIN_NOMBRE.RECORRIDO
	SELECT DISTINCT C1.Id_ciudad, C2.Id_ciudad, [RECORRIDO_KM], [RECORRIDO_PRECIO]
	FROM gd_esquema.Maestra
	JOIN SIN_NOMBRE.CIUDAD C1 ON RECORRIDO_CIUDAD_ORIGEN = C1.Nombre
	JOIN SIN_NOMBRE.CIUDAD C2 ON RECORRIDO_CIUDAD_DESTINO = C2.Nombre
	WHERE RECORRIDO_CIUDAD_DESTINO IS NOT NULL
	AND RECORRIDO_CIUDAD_ORIGEN IS NOT NULL


	INSERT INTO SIN_NOMBRE.TIPO_TAREA
	SELECT DISTINCT TIPO_TAREA
	FROM gd_esquema.Maestra
	WHERE TIPO_TAREA IS NOT NULL


	INSERT INTO SIN_NOMBRE.TAREA
	SELECT DISTINCT [TAREA_CODIGO], TT.Codigo, [TAREA_DESCRIPCION], [TAREA_TIEMPO_ESTIMADO]
	FROM gd_esquema.Maestra
	JOIN SIN_NOMBRE.TIPO_TAREA TT ON TIPO_TAREA = TT.Descripcion
	WHERE TAREA_CODIGO IS NOT NULL
	ORDER BY 1


	INSERT INTO SIN_NOMBRE.MECANICO
	SELECT DISTINCT [MECANICO_NRO_LEGAJO], T.Id, [MECANICO_NOMBRE], [MECANICO_APELLIDO], [MECANICO_DNI], [MECANICO_DIRECCION], [MECANICO_TELEFONO], [MECANICO_MAIL], [MECANICO_FECHA_NAC], [MECANICO_COSTO_HORA]
	FROM gd_esquema.Maestra
	JOIN SIN_NOMBRE.TALLER T ON TALLER_NOMBRE = T.Nombre
	WHERE MECANICO_NRO_LEGAJO IS NOT NULL


	INSERT INTO SIN_NOMBRE.TIPO_PAQUETE
	SELECT DISTINCT [PAQUETE_DESCRIPCION], [PAQUETE_PESO_MAX], [PAQUETE_ALTO_MAX], [PAQUETE_ANCHO_MAX], [PAQUETE_LARGO_MAX], [PAQUETE_PRECIO]
	FROM gd_esquema.Maestra
	WHERE PAQUETE_CANTIDAD IS NOT NULL


	INSERT INTO SIN_NOMBRE.MARCA_CAMION
	SELECT DISTINCT MARCA_CAMION_MARCA
	FROM gd_esquema.Maestra
	WHERE MARCA_CAMION_MARCA IS NOT NULL


	INSERT INTO SIN_NOMBRE.MODELO_CAMION
	SELECT DISTINCT MC.Id, MODELO_CAMION, MODELO_VELOCIDAD_MAX, MODELO_CAPACIDAD_TANQUE, MODELO_CAPACIDAD_CARGA
	FROM gd_esquema.Maestra
	JOIN SIN_NOMBRE.MARCA_CAMION MC ON MARCA_CAMION_MARCA = MC.Descripcion
	WHERE MODELO_CAMION IS NOT NULL
	ORDER BY 2


	INSERT INTO SIN_NOMBRE.ESTADO_ORDEN_TRABAJO
	SELECT DISTINCT ORDEN_TRABAJO_ESTADO
	FROM gd_esquema.Maestra
	WHERE ORDEN_TRABAJO_ESTADO IS NOT NULL

---- Carge de Camiones
	INSERT INTO [SIN_NOMBRE].CAMION
	SELECT DISTINCT
	M.CAMION_PATENTE,
	M.CAMION_NRO_CHASIS,
	M.CAMION_NRO_MOTOR,
	M.CAMION_FECHA_ALTA,
	MC.Marca_Id,
	MC.Modelo_Id
	FROM [gd_esquema].Maestra M
	JOIN [SIN_NOMBRE].MODELO_CAMION MC ON  MC.Descripcion =  M.MODELO_CAMION
	AND MC.Velocidad_Max		= M.MODELO_VELOCIDAD_MAX
	AND MC.Capacidad_Tanque	= M.MODELO_CAPACIDAD_TANQUE
	AND MC.Capacidad_Carga	= M.MODELO_CAPACIDAD_CARGA
	ORDER BY CAMION_FECHA_ALTA

-- ORDEN DE TRABAJO
INSERT INTO [SIN_NOMBRE].ORDEN_TRABAJO
SELECT DISTINCT
 M.ORDEN_TRABAJO_FECHA,
 M.CAMION_PATENTE,
 M.MECANICO_NRO_LEGAJO,
 EOT.Id_Estado
 FROM [gd_esquema].Maestra M
 JOIN [SIN_NOMBRE].ESTADO_ORDEN_TRABAJO EOT ON EOT.Descripcion = M.ORDEN_TRABAJO_ESTADO
 WHERE ORDEN_TRABAJO_ESTADO IS NOT NULL
 GROUP BY M.ORDEN_TRABAJO_FECHA,
	      M.CAMION_PATENTE, 
		  M.MECANICO_NRO_LEGAJO,
		  EOT.Id_Estado

-- TAREAS  por OT

INSERT INTO [SIN_NOMBRE].TAREA_POR_ORDEN
SELECT DISTINCT
	M.TAREA_FECHA_INICIO_PLANIFICADO,
	M.TAREA_FECHA_INICIO,
	M.TAREA_FECHA_FIN,
	M.TAREA_CODIGO,
	OT.Nro_OT
FROM [gd_esquema].Maestra M
JOIN [SIN_NOMBRE].ORDEN_TRABAJO OT ON OT.Fecha_Creacion = M.ORDEN_TRABAJO_FECHA
 AND OT.Legajo_Mecanico = M.MECANICO_NRO_LEGAJO

 -- Materiales por Tareas

INSERT INTO [SIN_NOMBRE].MATERIAL_POR_TAREA
 SELECT DISTINCT
	M.MATERIAL_COD,
    M.TAREA_CODIGO,
	NULL
 FROM [gd_esquema].Maestra M
 WHERE M.TAREA_CODIGO IS NOT NULL
		AND M.MATERIAL_COD IS NOT NULL
 ORDER BY M.TAREA_CODIGO