USE HotelEstrellaDelValle;
GO

CREATE VIEW vw_PagosPorCliente AS
SELECT 
    C.IdCliente,
    C.Nombre + ' ' + C.Apellidos AS Cliente,
    P.IdPago,
    P.FechaPago,
    P.MetodoPago,
    P.Monto
FROM Pagos P
INNER JOIN Reservaciones R ON P.IdReserva = R.IdReserva
INNER JOIN Clientes C ON R.IdCliente = C.IdCliente;
GO