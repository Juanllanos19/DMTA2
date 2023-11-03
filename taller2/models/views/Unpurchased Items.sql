WITH all_products AS (
    SELECT DISTINCT Codigo
    FROM dmtaller2.supermercado.Exito
    UNION ALL
    SELECT DISTINCT Codigo
    FROM dmtaller2.supermercado.Olimpica
)
SELECT Codigo
FROM all_products
WHERE Codigo NOT IN (SELECT producto FROM dmtaller2.supermercado.Compras);