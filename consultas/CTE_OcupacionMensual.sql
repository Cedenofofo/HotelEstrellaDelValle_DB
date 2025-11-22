USE HotelEstrellaDelValle;
GO

-- Definición de la CTE
WITH CTE_OcupacionMensual AS (
    SELECT 
        YEAR(FechaEntrada) AS Anio,
        DATENAME(MONTH, FechaEntrada) AS Mes,
        MONTH(FechaEntrada) AS NumeroMes, -- Útil para ordenar
        COUNT(IdReserva) AS CantidadReservas,
        SUM(CantidadNoches) AS TotalNochesVendidas
    FROM Reservaciones
    GROUP BY YEAR(FechaEntrada), DATENAME(MONTH, FechaEntrada), MONTH(FechaEntrada)
)
-- Uso de la CTE
SELECT 
    Anio,
    Mes,
    CantidadReservas,
    TotalNochesVendidas
FROM CTE_OcupacionMensual
ORDER BY Anio, NumeroMes; -- Ordenamos cronológicamente
GO