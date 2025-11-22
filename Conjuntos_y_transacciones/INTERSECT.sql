USE HotelEstrellaDelValle;
GO

-- LÓGICA DE CONJUNTOS: INTERSECT para Clientes con Reservaciones y Pagos

-- Clientes que tienen al menos una reservación
SELECT IdCliente
FROM Reservaciones

INTERSECT

-- Clientes cuya reservación asociada tiene un pago
SELECT r.IdCliente
FROM Reservaciones r
JOIN Pagos p ON r.IdReserva = p.IdReserva;
GO
