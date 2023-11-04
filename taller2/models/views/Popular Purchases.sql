With compras as(
    SELECT producto as codigop, COUNT(*) AS num_compras
    FROM dmtaller2.supermercado.Compras
    GROUP BY codigop
    ORDER BY num_compras DESC
),
comprasEx as(
    SELECT *
    FROM dmtaller2.supermercado.Exito INNER JOIN compras
    on Codigo=compras.codigop
),
comprasOli as(
    SELECT *
    FROM dmtaller2.supermercado.Olimpica INNER JOIN compras
    on Codigo=compras.codigop
)
SELECT  *
FROM comprasOli
UNION ALL
SELECT  *
FROM comprasEx
ORDER BY num_compras DESC