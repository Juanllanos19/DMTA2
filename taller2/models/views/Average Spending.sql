WITH wines as (
    SELECT Codigo, Precio
    FROM dmtaller2.supermercado.Exito
    WHERE Producto LIKE "%Vino Tinto%"
    UNION ALL
    SELECT Codigo, Precio
    FROM dmtaller2.supermercado.Olimpica
    WHERE Producto LIKE "%Vino Tinto%"
),
compras_vinos as (
    SELECT Codigo,Precio
    FROM wines INNER JOIN dmtaller2.supermercado.Compras ON producto=Codigo
)
SELECT AVG(precio) AS gasto_promedio
FROM compras_vinos