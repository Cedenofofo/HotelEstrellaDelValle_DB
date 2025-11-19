-- Script: 10_insert_pagos.sql
-- Propósito: Inserción de 15 pagos.

USE HotelEstrellaDelValle;
GO

INSERT INTO Pagos (IdReserva, Monto, MetodoPago) VALUES
(1, 150.00, 'Tarjeta'),
(2, 400.00, 'Efectivo'),
(3, 300.00, 'Transferencia'),
(4, 50.00, 'Tarjeta'),
(5, 320.00, 'Efectivo'),
(6, 600.00, 'Transferencia'),
(7, 160.00, 'Tarjeta'),
(8, 55.00, 'Efectivo'),
(9, 800.00, 'Tarjeta'),
(10, 170.00, 'Transferencia'),
(11, 160.00, 'Tarjeta'),
(12, 600.00, 'Efectivo'),
(13, 100.00, 'Tarjeta'),
(14, 240.00, 'Transferencia'),
(15, 750.00, 'Tarjeta');
GO