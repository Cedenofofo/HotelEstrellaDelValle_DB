USE HotelEstrellaDelValle;
GO


-- LÓGICA DE CONJUNTOS: EXCEPT para Habitaciones sin Reservación

-- Todas las habitaciones
SELECT IdHabitacion, Numero
FROM Habitaciones

EXCEPT

-- Habitaciones que sí tienen al menos una reservación
SELECT DISTINCT IdHabitacion, h.Numero
FROM Habitaciones h
JOIN Reservaciones r ON h.IdHabitacion = r.IdHabitacion;
GO