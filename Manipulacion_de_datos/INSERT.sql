USE HotelEstrellaDelValle;
GO


-- MANIPULACIÓN DE DATOS: Insertar una reserva nueva con cálculo dinámico (INSERT)

DECLARE @IdClienteNuevo INT = 6; -- Cliente con IdCliente=6 (Laura Diaz)
DECLARE @IdHabitacionNueva INT = 1; -- Habitación con IdHabitacion=1 (Sencilla)
DECLARE @Entrada DATE = '2026-05-01';
DECLARE @Salida DATE = '2026-05-06'; -- 5 noches
DECLARE @Precio DECIMAL(10, 2);
DECLARE @MontoTotal DECIMAL(10, 2);

-- 1. Obtener el precio por noche
SELECT @Precio = PrecioPorNoche
FROM Habitaciones
WHERE IdHabitacion = @IdHabitacionNueva;

-- 2. Calcular el MontoTotal
SET @MontoTotal = DATEDIFF(DAY, @Entrada, @Salida) * @Precio;

-- 3. Insertar la nueva reserva
INSERT INTO Reservaciones (IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal)
VALUES (@IdClienteNuevo, @IdHabitacionNueva, @Entrada, @Salida, @MontoTotal);

SELECT SCOPE_IDENTITY() AS 'Nuevo IdReserva Insertado', @MontoTotal AS 'Monto Total Calculado';
GO


