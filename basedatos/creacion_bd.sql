IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'HotelEstrellaDelValle')
BEGIN
    CREATE DATABASE HotelEstrellaDelValle;
END
GO