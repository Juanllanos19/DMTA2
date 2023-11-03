    WITH ClientesOl as (
        SELECT cliente
        FROM dmtaller2.supermercado.Compras
        WHERE producto like "OLI%"
        GROUP BY cliente
    ),
    ClientesEx as (
        SELECT cliente
        FROM dmtaller2.supermercado.Compras
        WHERE producto like "EXI%"
        GROUP BY cliente
    )
    SELECT *
    FROM dmtaller2.supermercado.Clientes
    JOIN ClientesOl ON 'CLI'||Numero= ClientesOl.cliente
    LEFT JOIN ClientesEx ON ClientesOL.cliente = ClientesEx.cliente
    WHERE ClientesEX.cliente IS NULL