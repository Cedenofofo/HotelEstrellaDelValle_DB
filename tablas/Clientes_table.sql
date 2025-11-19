-- Script: Clientes_table.sql
-- Propósito: Creación de la tabla Clientes.

USE HotelEstrellaDelValle;
GO

CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100) UNIQUE
);
GO