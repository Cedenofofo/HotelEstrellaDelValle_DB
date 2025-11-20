USE master;
GO

-- Comando RESTORE para restaurar la base de datos
RESTORE DATABASE HotelEstrellaDelValle_RESTORED -- Nombre de la NUEVA base de datos
FROM DISK = 'C:\Backups\HotelEstrellaDelValle.bak' -- ¡RUTA DE TU ARCHIVO .BAK!

-- Cláusulas MOVE: Indican la nueva ubicación de los archivos .mdf y .ldf
WITH 
    MOVE 'HotelEstrellaDelValle_Data' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HotelEstrellaDelValle_RESTORED.mdf', -- Ajusta la ruta a tu carpeta de DATA de SQL Server
    MOVE 'HotelEstrellaDelValle_Log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\HotelEstrellaDelValle_RESTORED_Log.ldf', -- Ajusta la ruta a tu carpeta de DATA de SQL Server
    REPLACE, -- Permite sobrescribir una base de datos existente con el mismo nombre (si usas el mismo nombre)
    STATS = 10;
GO

PRINT 'Base de datos restaurada como HotelEstrellaDelValle_RESTORED';