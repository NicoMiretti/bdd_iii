USE DistribuidoraOperativa;
GO

-- 🔸 Detalles y relaciones
DELETE FROM RegistrosFacturas;
DELETE FROM CapacitacionXEmpleado;
DELETE FROM Empleado_ausencia;
DELETE FROM CategoriaXEmpleado;
DELETE FROM Telefono_empleado;

-- 🔸 Dependientes
DELETE FROM Promocion;
DELETE FROM Articulos;
DELETE FROM Facturas;
DELETE FROM Clientes;

-- 🔸 Maestros
DELETE FROM Productos;
DELETE FROM Vendedores;
DELETE FROM Empleado;

-- 🔸 Referencias
DELETE FROM Codigos;
DELETE FROM Capacitacion;
DELETE FROM Motivo_Ausencia;
DELETE FROM Categoria;
DELETE FROM BasicoCategoria;

-- 🔸 Geografía y rubros
DELETE FROM Ciudades;
DELETE FROM Departamentos;
DELETE FROM Rubros;


-- 🔸 Geografía y rubros
DBCC CHECKIDENT ('Departamentos', RESEED, 0);
DBCC CHECKIDENT ('Ciudades', RESEED, 0);
DBCC CHECKIDENT ('Rubros', RESEED, 0);

-- 🔸 Codificación y referencias
DBCC CHECKIDENT ('Codigos', RESEED, 0);
DBCC CHECKIDENT ('Capacitacion', RESEED, 0);
DBCC CHECKIDENT ('Motivo_Ausencia', RESEED, 0);
DBCC CHECKIDENT ('Categoria', RESEED, 0);
DBCC CHECKIDENT ('BasicoCategoria', RESEED, 0);

-- 🔸 Maestros
DBCC CHECKIDENT ('Empleado', RESEED, 0);
DBCC CHECKIDENT ('Vendedores', RESEED, 0);
DBCC CHECKIDENT ('Clientes', RESEED, 0);
DBCC CHECKIDENT ('Productos', RESEED, 0);
DBCC CHECKIDENT ('Articulos', RESEED, 0);

-- 🔸 Facturación
DBCC CHECKIDENT ('Facturas', RESEED, 0);
DBCC CHECKIDENT ('Promocion', RESEED, 0);
DBCC CHECKIDENT ('RegistrosFacturas', RESEED, 0);
