USE HotelEstrellaDelValle;
GO

-- Definición de la CTE
WITH CTE_IngresosClientes AS (
    SELECT 
        C.IdCliente,
        C.Nombre + ' ' + C.Apellidos AS NombreCompleto,
        COUNT(R.IdReserva) AS TotalReservas,
        ISNULL(SUM(R.MontoTotal), 0) AS TotalGastado
    FROM Clientes C
    LEFT JOIN Reservaciones R ON C.IdCliente = R.IdCliente
    GROUP BY C.IdCliente, C.Nombre, C.Apellidos
)
-- Uso de la CTE (Consultamos como si fuera una tabla normal)
SELECT * FROM CTE_IngresosClientes
ORDER BY TotalGastado DESC;
GO