USE HotelEstrellaDelValle;
GO

CREATE PROCEDURE sp_ActualizarDatosCliente
    @IdCliente INT,
    @NuevoTelefono VARCHAR(20),
    @NuevoEmail VARCHAR(100)
AS
BEGIN
    -- Verificamos si el cliente existe antes de actualizar
    IF EXISTS (SELECT 1 FROM Clientes WHERE IdCliente = @IdCliente)
    BEGIN
        UPDATE Clientes
        SET Telefono = @NuevoTelefono,
            Email = @NuevoEmail
        WHERE IdCliente = @IdCliente;

        PRINT 'Datos del cliente actualizados correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'Error: El cliente no existe.';
    END
END;
GO