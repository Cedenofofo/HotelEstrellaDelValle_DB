SELECT Nombre, Apellidos
FROM Clientes
WHERE IdCliente IN (
    SELECT IdCliente
    FROM Reservaciones
    GROUP BY IdCliente
    HAVING COUNT(*) > 1
);