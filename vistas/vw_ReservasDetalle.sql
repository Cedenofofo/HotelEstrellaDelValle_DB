USE HotelEstrellaDelValle;
GO

CREATE VIEW vw_ReservasDetalle AS
SELECT 
    R.IdReserva,
    C.Nombre + ' ' + C.Apellidos AS Cliente, -- Concatenamos nombre completo
    C.Email,
    H.Numero AS NumHabitacion,
    H.Tipo AS TipoHabitacion,
    R.FechaEntrada,
    R.FechaSalida,
    R.MontoTotal
FROM Reservaciones R
INNER JOIN Clientes C ON R.IdCliente = C.IdCliente
INNER JOIN Habitaciones H ON R.IdHabitacion = H.IdHabitacion;
GO