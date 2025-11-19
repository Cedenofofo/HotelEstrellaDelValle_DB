-- Script: 09_insert_reservaciones.sql
-- Propósito: Inserción de 15 reservaciones.

USE HotelEstrellaDelValle;
GO

SET IDENTITY_INSERT Reservaciones ON; -- Permite insertar valores explícitos en IdReserva si es necesario para la trazabilidad.

INSERT INTO Reservaciones (IdReserva, IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal) VALUES
(1, 1, 1, '2025-12-01', '2025-12-04', 150.00),  -- 3 noches @ 50.00
(2, 2, 3, '2025-12-05', '2025-12-10', 400.00),  -- 5 noches @ 80.00
(3, 3, 6, '2025-12-15', '2025-12-17', 300.00),  -- 2 noches @ 150.00
(4, 4, 2, '2025-12-20', '2025-12-21', 50.00),   -- 1 noche @ 50.00
(5, 5, 5, '2025-12-24', '2025-12-28', 320.00),  -- 4 noches @ 80.00
(6, 6, 7, '2026-01-01', '2026-01-05', 600.00),  -- 4 noches @ 150.00
(7, 7, 4, '2026-01-10', '2026-01-12', 160.00),  -- 2 noches @ 80.00
(8, 8, 9, '2026-01-15', '2026-01-16', 55.00),   -- 1 noche @ 55.00
(9, 9, 10, '2026-01-20', '2026-01-25', 800.00), -- 5 noches @ 160.00
(10, 10, 8, '2026-02-01', '2026-02-03', 170.00), -- 2 noches @ 85.00
(11, 1, 10, '2026-02-10', '2026-02-11', 160.00), -- 1 noche @ 160.00
(12, 2, 6, '2026-03-01', '2026-03-05', 600.00),  -- 4 noches @ 150.00
(13, 3, 1, '2026-03-10', '2026-03-12', 100.00),  -- 2 noches @ 50.00
(14, 4, 3, '2026-03-15', '2026-03-18', 240.00),  -- 3 noches @ 80.00
(15, 5, 7, '2026-03-20', '2026-03-25', 750.00);  -- 5 noches @ 150.00

SET IDENTITY_INSERT Reservaciones OFF;
GO