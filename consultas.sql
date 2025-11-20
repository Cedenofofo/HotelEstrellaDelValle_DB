
-- 1. Listar todos los clientes ordenados por apellido
SELECT IdCliente, Nombre, Apellidos, Telefono, Email
FROM Clientes
ORDER BY Apellidos ASC;

-- 2. Listar habitaciones de mayor a menor precio
SELECT IdHabitacion, Numero, Tipo, PrecioPorNoche
FROM Habitaciones
ORDER BY PrecioPorNoche DESC;

-- 3. Mostrar reservaciones realizadas en un rango de fechas
SELECT *
FROM Reservaciones
WHERE FechaEntrada BETWEEN '2025-12-01' AND '2025-12-10';

-- 1. JOIN entre Reservaciones, Habitaciones y Clientes
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

-- 2. JOIN para ver pagos por cliente
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

-- 3. Subconsulta: clientes que han hecho más de una reserva
SELECT Nombre, Apellidos
FROM Clientes
WHERE IdCliente IN (
    SELECT IdCliente
    FROM Reservaciones
    GROUP BY IdCliente
    HAVING COUNT(*) > 1
);
-- Clientes cuyo apellido empieza con “L”
SELECT *
FROM Clientes
WHERE Apellidos LIKE 'L%';

-- Habitaciones con precio mayor a 60
SELECT *
FROM Habitaciones
WHERE PrecioPorNoche > 60;

-- Reservaciones entre 1 y 3 noches
SELECT *
FROM Reservaciones
WHERE CantidadNoches BETWEEN 1 AND 3;

