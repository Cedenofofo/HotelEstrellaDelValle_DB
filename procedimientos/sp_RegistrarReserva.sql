USE HotelEstrellaDelValle;
GO

CREATE PROCEDURE sp_RegistrarReserva
    @IdCliente INT,
    @IdHabitacion INT,
    @FechaEntrada DATE,
    @FechaSalida DATE
AS
BEGIN
    -- 1. Validar que la fecha de salida sea posterior a la entrada
    IF @FechaSalida <= @FechaEntrada
    BEGIN
        PRINT 'Error: La fecha de salida debe ser posterior a la fecha de entrada.';
        RETURN;
    END

    -- 2. Obtener el precio por noche de la habitación
    DECLARE @PrecioPorNoche DECIMAL(10, 2);
    SELECT @PrecioPorNoche = PrecioPorNoche 
    FROM Habitaciones 
    WHERE IdHabitacion = @IdHabitacion;

    -- 3. Calcular días y monto total
    DECLARE @Dias INT;
    SET @Dias = DATEDIFF(DAY, @FechaEntrada, @FechaSalida);

    DECLARE @MontoTotal DECIMAL(10, 2);
    SET @MontoTotal = @Dias * @PrecioPorNoche;

    -- 4. Insertar la reserva
    INSERT INTO Reservaciones (IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal)
    VALUES (@IdCliente, @IdHabitacion, @FechaEntrada, @FechaSalida, @MontoTotal);

    PRINT 'Reserva registrada exitosamente. Monto calculado: ' + CAST(@MontoTotal AS VARCHAR);
END;
GO