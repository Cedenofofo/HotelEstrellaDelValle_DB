USE HotelEstrellaDelValle;
GO


-- LÓGICA DE CONJUNTOS: UNION de Clientes Activos e Inactivos

-- 1. Clientes con al menos una reservación (Activos)
SELECT 
    c.IdCliente, 
    c.Nombre, 
    c.Apellidos, 
    'Activo' AS Estado
FROM Clientes c
WHERE c.IdCliente IN (SELECT IdCliente FROM Reservaciones)

UNION 

-- 2. Clientes sin reservaciones (Inactivos)
SELECT 
    c.IdCliente, 
    c.Nombre, 
    c.Apellidos, 
    'Inactivo' AS Estado
FROM Clientes c
WHERE c.IdCliente NOT IN (SELECT IdCliente FROM Reservaciones)

ORDER BY Apellidos, Nombre;
GO