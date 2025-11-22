USE HotelEstrellaDelValle;
GO

-- MANIPULACIÓN DE DATOS: Eliminar pagos de una reserva cancelada (DELETE)

DECLARE @IdReservaCancelada INT = 4;

DELETE FROM Pagos
WHERE IdReserva = @IdReservaCancelada;

SELECT @@ROWCOUNT AS 'Pagos Eliminados', @IdReservaCancelada AS 'IdReserva Cancelada';
GO


-------verificacion