WITH ClientesOl as (
    SELECT cliente as clienteOl
    FROM dmtaller2.supermercado.Compras
    WHERE producto like "OLI%"
    GROUP BY cliente
),
ClientesEx as (
    SELECT cliente as clienteEx
    FROM dmtaller2.supermercado.Compras
    WHERE producto like "EXI%"
    GROUP BY cliente
)
SELECT *
FROM dmtaller2.supermercado.Clientes
JOIN ClientesOl ON 'CLI'||Numero= ClientesOl.clienteOl
LEFT JOIN ClientesEx ON ClientesOL.clienteOl = ClientesEx.clienteEx
WHERE ClientesEX.clienteEx IS NULL