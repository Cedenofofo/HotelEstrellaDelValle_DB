-- Script: 08_insert_habitaciones.sql
-- Propósito: Inserción de 10 habitaciones.

USE HotelEstrellaDelValle;
GO

INSERT INTO Habitaciones (Numero, Tipo, PrecioPorNoche) VALUES
(101, 'Sencilla', 50.00),
(102, 'Sencilla', 50.00),
(201, 'Doble', 80.00),
(202, 'Doble', 80.00),
(203, 'Doble', 80.00),
(301, 'Suite', 150.00),
(302, 'Suite', 150.00),
(401, 'Doble', 85.00), 
(402, 'Sencilla', 55.00),
(403, 'Suite', 160.00);
GO