USE HotelEstrellaDelValle;
GO

CREATE TRIGGER trg_CalcularMontoReserva
ON Reservaciones
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualizamos la tabla Reservaciones uniendo con la tabla 'inserted' (el nuevo registro)
    -- y la tabla Habitaciones para obtener el precio.
    UPDATE R
    SET R.MontoTotal = R.CantidadNoches * H.PrecioPorNoche
    FROM Reservaciones R
    INNER JOIN inserted I ON R.IdReserva = I.IdReserva
    INNER JOIN Habitaciones H ON R.IdHabitacion = H.IdHabitacion;

    PRINT 'Trigger ejecutado: MontoTotal calculado automáticamente.';
END;
GO