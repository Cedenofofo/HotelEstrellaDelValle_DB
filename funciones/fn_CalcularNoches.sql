USE HotelEstrellaDelValle;
GO

CREATE FUNCTION fn_CalcularNoches 
(
    @FechaEntrada DATE,
    @FechaSalida DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Noches INT;

    -- Calculamos la diferencia en días
    SET @Noches = DATEDIFF(DAY, @FechaEntrada, @FechaSalida);

    -- Validación simple: Si la fecha de salida es anterior o igual, retornamos 0
    IF @Noches < 0
        SET @Noches = 0;

    RETURN @Noches;
END;
GO