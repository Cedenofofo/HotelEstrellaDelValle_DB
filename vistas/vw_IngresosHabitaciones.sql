USE HotelEstrellaDelValle;
GO

CREATE VIEW vw_IngresosHabitaciones AS
SELECT 
    H.Numero AS NumHabitacion,
    H.Tipo,
    COUNT(R.IdReserva) AS TotalOcupaciones, -- Cuántas veces se ha reservado
    ISNULL(SUM(R.MontoTotal), 0) AS IngresosGenerados -- Suma total de dinero
FROM Habitaciones H
LEFT JOIN Reservaciones R ON H.IdHabitacion = R.IdHabitacion
GROUP BY H.Numero, H.Tipo;
GO