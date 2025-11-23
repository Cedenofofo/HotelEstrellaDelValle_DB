SELECT 
    r.IdReserva,
    c.Nombre,
    c.Apellidos,
    h.Numero AS NumeroHabitacion,
    h.Tipo,
    r.FechaEntrada,
    r.FechaSalida,
    r.MontoTotal
FROM Reservaciones r
JOIN Clientes c ON r.IdCliente = c.IdCliente
JOIN Habitaciones h ON r.IdHabitacion = h.IdHabitacion;