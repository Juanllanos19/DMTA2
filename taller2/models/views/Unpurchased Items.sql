WITH all_products AS (
    SELECT DISTINCT Codigo, Producto
    FROM dmtaller2.supermercado.Exito
    UNION ALL
    SELECT DISTINCT Codigo, Producto
    FROM dmtaller2.supermercado.Olimpica
)
SELECT *
FROM all_products
WHERE Codigo NOT IN (SELECT producto FROM dmtaller2.supermercado.Compras);