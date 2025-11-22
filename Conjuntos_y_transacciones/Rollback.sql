-- SCRIPT DE TRANSACCIÓN FALLIDA (ROLLBACK)


USE HotelEstrellaDelValle;
GO

BEGIN TRANSACTION;
GO

-- 1. Variables y Lógica de Cálculo (Mismos valores para la prueba)
DECLARE @NuevoIdCliente INT = 1;
DECLARE @NuevoIdHabitacion INT = 5;
DECLARE @FechaEntrada DATE = '2026-06-01';
DECLARE @FechaSalida DATE = '2026-06-03'; -- 2 noches
DECLARE @PrecioNoche DECIMAL(10, 2);
DECLARE @MontoTotalReserva DECIMAL(10, 2);
DECLARE @NuevoIdReserva INT;
DECLARE @MontoPago DECIMAL(10, 2);

-- Obtener el precio por noche
SELECT @PrecioNoche = PrecioPorNoche
FROM Habitaciones
WHERE IdHabitacion = @NuevoIdHabitacion;

-- Calcular el monto total
SET @MontoTotalReserva = DATEDIFF(DAY, @FechaEntrada, @FechaSalida) * @PrecioNoche;
SET @MontoPago = @MontoTotalReserva;

-- 2. Registrar la nueva reservación (¡Esta inserción ocurre y será deshecha!)
INSERT INTO Reservaciones (IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal)
VALUES (@NuevoIdCliente, @NuevoIdHabitacion, @FechaEntrada, @FechaSalida, @MontoTotalReserva);

-- Obtener el IdReserva recién insertado (para referencia, aunque será eliminado)
SET @NuevoIdReserva = SCOPE_IDENTITY();
PRINT 'Reservación temporal con IdReserva: ' + CAST(@NuevoIdReserva AS VARCHAR) + ' insertada...';

-- 3. Insertar el pago correspondiente (¡ESTE PASO FALLARÁ!)
-- Se usa IdReserva = 0, lo que viola la Foreign Key (referencia a Reservaciones(IdReserva))
INSERT INTO Pagos (IdReserva, Monto, MetodoPago)
VALUES (0, @MontoPago, 'Tarjeta'); 

-- 4. Evaluar el resultado
IF (@@ERROR <> 0)
BEGIN
    -- Debido al error en el INSERT INTO Pagos, esta parte se ejecuta.
    ROLLBACK TRANSACTION;
    PRINT '⚠️ ERROR DETECTADO (Violación de FK). La transacción ha fallado. ROLLBACK ejecutado.';
    
    -- Verificación del Rollback:
    SELECT * FROM Reservaciones WHERE IdReserva = @NuevoIdReserva; -- Debe retornar 0 filas
    PRINT 'Verificación: El IdReserva ' + CAST(@NuevoIdReserva AS VARCHAR) + ' ha sido eliminado por el ROLLBACK (0 filas).';
END
ELSE
BEGIN
    -- Esto NO se ejecutará
    COMMIT TRANSACTION;
    PRINT '✅ ÉXITO: Se registró correctamente. COMMIT ejecutado.';
END
GO

