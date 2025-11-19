-- Script: 07_insert_clientes.sql
-- Propósito: Inserción de 10 clientes.

USE HotelEstrellaDelValle;
GO

INSERT INTO Clientes (Nombre, Apellidos, Telefono, Email) VALUES
('Juan', 'Perez', '555-1001', 'juan.perez@ejemplo.com'),
('Maria', 'Lopez', '555-1002', 'maria.lopez@ejemplo.com'),
('Carlos', 'Rodriguez', '555-1003', 'carlos.rodriguez@ejemplo.com'),
('Ana', 'Gomez', '555-1004', 'ana.gomez@ejemplo.com'),
('Luis', 'Hernandez', '555-1005', 'luis.hernandez@ejemplo.com'),
('Laura', 'Diaz', '555-1006', 'laura.diaz@ejemplo.com'),
('Pedro', 'Alvarez', '555-1007', 'pedro.alvarez@ejemplo.com'),
('Elena', 'Torres', '555-1008', 'elena.torres@ejemplo.com'),
('Miguel', 'Vargas', '555-1009', 'miguel.vargas@ejemplo.com'),
('Sofia', 'Martinez', '555-1010', 'sofia.martinez@ejemplo.com');
GO