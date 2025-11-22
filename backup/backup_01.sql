USE master;
GO

-- Script para crear el archivo .bak de la base de datos HotelEstrellaDelValle
BACKUP DATABASE HotelEstrellaDelValle
TO DISK = 'C:\Backups\HotelEstrellaDelValle.bak'  -- ¡IMPORTANTE: Reemplaza esta ruta con tu ubicación deseada!
WITH 
    INIT,        -- Sobrescribe cualquier backup anterior en este archivo
    NAME = 'Copia de seguridad completa de HotelEstrellaDelValle',
    STATS = 10;  -- Muestra el progreso cada 10%
GO

PRINT 'El archivo de respaldo (HotelEstrellaDelValle.bak) ha sido creado.';