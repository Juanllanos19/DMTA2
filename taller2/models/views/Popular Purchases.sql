With compras as(
    SELECT producto, COUNT(*) AS num_compras
    FROM dmtaller2.supermercado.Compras
    GROUP BY producto
    ORDER BY num_compras DESC
),
comprasEx as(
    SELECT *
    FROM dmtaller2.supermercado.Exito INNER JOIN compras
    on Codigo=compras.producto
),
comprasOli as(
    SELECT *
    FROM dmtaller2.supermercado.Olimpica INNER JOIN compras
    on Codigo=compras.producto
)
SELECT  *
FROM comprasOli
UNION ALL
SELECT  *
FROM comprasEx
ORDER BY num_compras DESC