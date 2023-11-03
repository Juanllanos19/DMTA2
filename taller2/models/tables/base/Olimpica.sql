WITH RankedData AS (
    SELECT 
        Precio,ROW_NUMBER() OVER (ORDER BY Precio) AS row_num
    FROM dmtaller2.supermercado.Olimpica_EXT
    WHERE Precio IS NOT NULL
    ORDER BY Precio
),
ROW_COUNT as (
    SELECT COUNT(*) AS row_count FROM RankedData
),
MEDIAN as (
    SELECT
    CASE
        WHEN MOD(ROW_COUNT.row_count, 2) = 1 THEN (SELECT Precio FROM RankedData WHERE row_num=ROW_COUNT.row_count/2+1)
        ELSE ((SELECT Precio FROM RankedData WHERE row_num=ROW_COUNT.row_count/2+1)+(SELECT Precio FROM RankedData WHERE row_num=ROW_COUNT.row_count/2))/2
    END as median
    from ROW_COUNT
)
SELECT
    Codigo, Producto, Cantidad, Unidad,
    CASE
        WHEN Precio IS NULL THEN CAST(median.median AS INT64)
        ELSE Precio
    END AS Precio
FROM dmtaller2.supermercado.Olimpica_EXT, MEDIAN