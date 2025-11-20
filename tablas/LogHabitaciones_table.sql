USE HotelEstrellaDelValle;
GO

CREATE TABLE LogHabitaciones (
    IdLog INT PRIMARY KEY IDENTITY(1,1),
    IdHabitacion INT,
    Usuario VARCHAR(100),
    Fecha DATETIME,
    TipoCambio VARCHAR(50),
    Detalle VARCHAR(MAX)
);
GO