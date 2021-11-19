--- Primero necesitariamos las distintas tareas por Camion en distintas OT, en distintos Talleres
-- CREATE VIEW [SIN_NOMBRE].[V_Top_5_Tareas_Camion]
DECLARE @LT_TEMP_TAREAS TABLE(
	[Nro_OT] INT NOT NULL,
    [Cod_Tarea] INT NOT NULL,
	[Marca_Id] SMALLINT,
	[Modelo_Id] SMALLINT
	,[Id_Taller] INT
)
INSERT INTO @LT_TEMP_TAREAS
SELECT DISTINCT       
		[Nro_OT]
	  ,[Cod_Tarea]
	  ,[Marca_Id]
      ,[Modelo_Id]
	  ,[Id_Taller]
  FROM [SIN_NOMBRE].[BI_CAMION_MANTENIMIENTO]
ORDER BY Nro_OT
-- Declaro Tareas ejecutadas por Camion
DECLARE @LT_TEMP_TAREAS_EJECUTADAS_POR_CAMION TABLE(
    [Cod_Tarea] INT NOT NULL,
	[Marca_Id] SMALLINT NOT NULL,
	[Modelo_Id] SMALLINT NOT NULL
	,[Ejecutadas] BIGINT
)
INSERT INTO @LT_TEMP_TAREAS_EJECUTADAS_POR_CAMION
SELECT [Cod_Tarea]
	  ,[Marca_Id]
	  ,[Modelo_Id]
      ,ISNULL(COUNT(*), 0) AS [Ejecutadas]
FROM @LT_TEMP_TAREAS T
GROUP BY [Cod_Tarea], [Marca_Id], [Modelo_Id]
ORDER BY Ejecutadas DESC
-- Ahora busco el TOP 5 por Camion
SELECT DISTINCT
   T.[Marca_ID]
  ,T.[Modelo_ID]
  ,T.[Cod_Tarea]
  ,TE.Ejecutadas AS [Veces Realizas]
FROM @LT_TEMP_TAREAS T
JOIN @LT_TEMP_TAREAS_EJECUTADAS_POR_CAMION TE ON 
	TE.Modelo_Id = T.Modelo_Id AND TE.Cod_Tarea = T.Cod_Tarea
	AND TE.Marca_Id = T.Marca_Id
WHERE T.Cod_Tarea IN (SELECT TOP 5 Cod_Tarea
						FROM @LT_TEMP_TAREAS_EJECUTADAS_POR_CAMION TxC
						WHERE T.Marca_Id = TxC.Marca_Id
						AND T.Modelo_Id = TxC.Modelo_Id
						ORDER BY Ejecutadas DESC)
ORDER BY Marca_Id ASC, Modelo_Id ASC, TE.Ejecutadas DESC
GO