
CREATE VIEW [vw_TitlarPerFörfattare] AS
WITH [FörfattareCTE] AS (
    SELECT
        [f].[Id],
        CONCAT([f].[Förnamn], ' ', [f].[Efternamn]) AS [Namn],
        CASE 
            WHEN [f].[Födelsedatum] IS NULL THEN NULL
            ELSE
                DATEDIFF(YEAR, [f].[Födelsedatum], [x].[AsOf])
                - CASE 
                    WHEN DATEADD(
                            YEAR,
                            DATEDIFF(YEAR, [f].[Födelsedatum], [x].[AsOf]),
                            [f].[Födelsedatum]
                      ) > [x].[AsOf]
                      THEN 1 
                      ELSE 0 
                  END
        END AS [Ålder]
    FROM [Författare] AS [f]
    CROSS APPLY (
        SELECT CASE 
                 WHEN [f].[Dödsdatum] IS NOT NULL THEN [f].[Dödsdatum]
                 ELSE SYSDATETIME()
               END AS [AsOf]
    ) AS [x]
)
SELECT
    [f].[Namn],
    CONCAT([f].[Ålder], ' år') AS [Ålder],
    CONCAT(COUNT(DISTINCT [bf].[ISBN]), ' st') AS [Titlar],
    CONCAT(CAST(COALESCE(SUM([b].[Pris] * [ls].[Antal]), 0) AS INT), ' kr') AS [Lagervärde]
FROM [FörfattareCTE] AS [f]
LEFT JOIN [Bokförfattare] AS [bf] ON [f].[Id] = [bf].[FörfattarId]
LEFT JOIN [LagerSaldo]   AS [ls] ON [bf].[ISBN] = [ls].[ISBN]
LEFT JOIN [Böcker]       AS [b]  ON [ls].[ISBN] = [b].[ISBN]
GROUP BY
    [f].[Id],
    [f].[Namn],
    [f].[Ålder];


-- select * from [Böcker]
-- select * from Bokförfattare
-- select * from författares
-- select * from LagerSaldo