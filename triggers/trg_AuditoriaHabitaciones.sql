USE HotelEstrellaDelValle;
GO

CREATE TRIGGER trg_AuditoriaHabitaciones
ON Habitaciones
AFTER UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    DECLARE @Usuario VARCHAR(100);
    SET @Usuario = SYSTEM_USER; -- Obtiene el usuario actual del sistema/base de datos
    
    -- 1. Si hay datos en 'inserted' y en 'deleted', es una ACTUALIZACIÓN (UPDATE)
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO LogHabitaciones (IdHabitacion, Usuario, Fecha, TipoCambio, Detalle)
        SELECT 
            i.IdHabitacion, 
            @Usuario, 
            GETDATE(), 
            'MODIFICACION',
            'Cambio de precio o tipo en habitación ' + CAST(i.Numero AS VARCHAR)
        FROM inserted i;
    END

    -- 2. Si solo hay datos en 'deleted' (y no en 'inserted'), es una ELIMINACIÓN (DELETE)
    ELSE IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO LogHabitaciones (IdHabitacion, Usuario, Fecha, TipoCambio, Detalle)
        SELECT 
            d.IdHabitacion, 
            @Usuario, 
            GETDATE(), 
            'ELIMINACION',
            'Se eliminó la habitación número ' + CAST(d.Numero AS VARCHAR)
        FROM deleted d;
    END
END;
GO