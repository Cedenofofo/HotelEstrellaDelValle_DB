USE HotelEstrellaDelValle;
GO

CREATE FUNCTION fn_CalcularMonto
(
    @PrecioPorNoche DECIMAL(10, 2),
    @Noches INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @MontoTotal DECIMAL(10, 2);

    -- Operación aritmética simple
    SET @MontoTotal = @PrecioPorNoche * @Noches;

    RETURN @MontoTotal;
END;
GO