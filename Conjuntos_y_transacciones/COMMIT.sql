USE HotelEstrellaDelValle;
GO

-- SCRIPT DE TRANSACCIÓN EXITOSA (COMMIT)


USE HotelEstrellaDelValle;
GO

BEGIN TRANSACTION;
GO

-- 1. Variables y Lógica de Cálculo
DECLARE @NuevoIdCliente INT = 1;      -- Cliente (Juan Perez)
DECLARE @NuevoIdHabitacion INT = 5;   -- Habitación (Doble)
DECLARE @FechaEntrada DATE = '2026-05-15';
DECLARE @FechaSalida DATE = '2026-05-18'; -- 3 noches
DECLARE @PrecioNoche DECIMAL(10, 2);
DECLARE @MontoTotalReserva DECIMAL(10, 2);
DECLARE @NuevoIdReserva INT;
DECLARE @MetodoPago VARCHAR(50) = 'Tarjeta';
DECLARE @MontoPago DECIMAL(10, 2);

-- Obtener el precio por noche de la habitación
SELECT @PrecioNoche = PrecioPorNoche
FROM Habitaciones
WHERE IdHabitacion = @NuevoIdHabitacion;

-- Calcular el monto total
SET @MontoTotalReserva = DATEDIFF(DAY, @FechaEntrada, @FechaSalida) * @PrecioNoche;
SET @MontoPago = @MontoTotalReserva;

-- 2. Registrar la nueva reservación
INSERT INTO Reservaciones (IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal)
VALUES (@NuevoIdCliente, @NuevoIdHabitacion, @FechaEntrada, @FechaSalida, @MontoTotalReserva);

-- Obtener el IdReserva recién insertado
SET @NuevoIdReserva = SCOPE_IDENTITY();

-- 3. Insertar el pago correspondiente (con el IdReserva generado)
INSERT INTO Pagos (IdReserva, Monto, MetodoPago)
VALUES (@NuevoIdReserva, @MontoPago, @MetodoPago);

-- 4. Evaluar el resultado
IF (@@ERROR <> 0)
BEGIN
    ROLLBACK TRANSACTION;
    PRINT '⚠️ ERROR: La transacción ha fallado. ROLLBACK ejecutado.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
    PRINT '✅ ÉXITO: La reservación ' + CAST(@NuevoIdReserva AS VARCHAR) + ' y su pago fueron registrados correctamente. COMMIT ejecutado.';
    
    -- Verificación Rápida:
    SELECT 'Nueva Reserva' AS Tipo, r.* FROM Reservaciones r WHERE r.IdReserva = @NuevoIdReserva;
    SELECT 'Nuevo Pago' AS Tipo, p.* FROM Pagos p WHERE p.IdReserva = @NuevoIdReserva;
END
GO