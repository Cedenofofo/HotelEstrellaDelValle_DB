SELECT 
    p.IdPago,
    c.Nombre,
    c.Apellidos,
    p.Monto,
    p.FechaPago,
    p.MetodoPago
FROM Pagos p
JOIN Reservaciones r ON p.IdReserva = r.IdReserva
JOIN Clientes c ON r.IdCliente = c.IdCliente;