With Compradores as(
    SELECT cliente, COUNT(cliente) AS Purchase_Count
    FROM dmtaller2.supermercado.Compras
    GROUP BY cliente
    ORDER BY Purchase_Count DESC
)
SELECT Compradores.Purchase_Count, Apellidos, Nombre_1, Nombre_2, Edad, Sexo, Tipo_Doc, Numero, Fecha_de_Nacimiento, 
Departamento,Ind__Pr__stamo, Ind__Salario,Ind__Formaci__n, Latitude, Longitude, Score_Cliente, Riesgo_Cliente
FROM Compradores INNER JOIN dmtaller2.supermercado.Clientes
ON Compradores.cliente = 'CLI'||Numero
Order by Compradores.Purchase_Count DESC