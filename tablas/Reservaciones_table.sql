-- Script: Reservaciones_table.sql
-- Propósito: Creación de la tabla Reservaciones con sus claves foráneas.

USE HotelEstrellaDelValle;
GO

CREATE TABLE Reservaciones (
    IdReserva INT PRIMARY KEY IDENTITY(1,1),
    -- Claves Foráneas
    IdCliente INT FOREIGN KEY REFERENCES Clientes(IdCliente) NOT NULL,
    IdHabitacion INT FOREIGN KEY REFERENCES Habitaciones(IdHabitacion) NOT NULL,
    
    FechaEntrada DATE NOT NULL,
    FechaSalida DATE NOT NULL,
    -- Columna Calculada
    CantidadNoches AS DATEDIFF(DAY, FechaEntrada, FechaSalida), 
    MontoTotal DECIMAL(10, 2)
);
GO