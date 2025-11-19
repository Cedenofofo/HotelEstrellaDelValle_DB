-- Script: Pagos_table.sql
-- Propósito: Creación de la tabla Pagos con su clave foránea.

USE HotelEstrellaDelValle;
GO

CREATE TABLE Pagos (
    IdPago INT PRIMARY KEY IDENTITY(1,1),
    -- Clave Foránea
    IdReserva INT FOREIGN KEY REFERENCES Reservaciones(IdReserva) NOT NULL,
    
    Monto DECIMAL(10, 2) NOT NULL,
    FechaPago DATE DEFAULT GETDATE(),
    MetodoPago VARCHAR(50)
);
GO