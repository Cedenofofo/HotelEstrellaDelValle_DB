USE HotelEstrellaDelValle;
GO

CREATE PROCEDURE sp_ReporteIngresosPorMes
    @Anio INT
AS
BEGIN
    SELECT 
        DATENAME(MONTH, FechaEntrada) AS Mes,   -- Nombre del mes (Enero, Febrero...)
        MONTH(FechaEntrada) AS NumeroMes,       -- Para poder ordenar correctamente
        COUNT(*) AS TotalReservas,              -- Cuántas reservas hubo
        SUM(MontoTotal) AS IngresosTotales      -- Suma del dinero
    FROM Reservaciones
    WHERE YEAR(FechaEntrada) = @Anio
    GROUP BY DATENAME(MONTH, FechaEntrada), MONTH(FechaEntrada)
    ORDER BY NumeroMes ASC; -- Ordenamos de Enero (1) a Diciembre (12)
END;
GO