USE HotelEstrellaDelValle;
GO

-- MANIPULACIÓN DE DATOS: Actualizar precio de una habitación según el tipo (UPDATE)

DECLARE @TipoHabitacion VARCHAR(50) = 'Sencilla';
DECLARE @NuevoPrecio DECIMAL(10, 2) = 90.00; -- Nuevo precio por noche

UPDATE Habitaciones
SET PrecioPorNoche = @NuevoPrecio
WHERE Tipo = @TipoHabitacion;

SELECT @@ROWCOUNT AS 'Filas Actualizadas', @TipoHabitacion AS 'Tipo de Habitación';
GO

----verificacion 

SELECT * FROM Habitaciones WHERE Tipo = 'Sencilla';