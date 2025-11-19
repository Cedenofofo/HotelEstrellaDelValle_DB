-- Script: Habitaciones_table.sql
-- Propósito: Creación de la tabla Habitaciones.

USE HotelEstrellaDelValle;
GO

CREATE TABLE Habitaciones (
    IdHabitacion INT PRIMARY KEY IDENTITY(1,1),
    Numero INT UNIQUE NOT NULL,
    Tipo VARCHAR(50) CHECK (Tipo IN ('Sencilla', 'Doble', 'Suite')) NOT NULL,
    PrecioPorNoche DECIMAL(10, 2) NOT NULL
);
GO