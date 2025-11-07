USE DistribuidoraOperativa;
GO

-- 🔹 1. Tablas base (sin dependencias)
INSERT INTO Departamentos (Nom_depto, Zona)
VALUES 
('Montevideo', 'Sur'),
('Canelones', 'Sur'),
('Maldonado', 'Este'),
('Colonia', 'Oeste'),
('Paysandú', 'Litoral Norte');

INSERT INTO Rubros (Nom_rubro)
VALUES 
('Supermercado'),
('Almacén'),
('Restaurante'),
('Kiosco'),
('Distribuidor Mayorista');

INSERT INTO Categoria (Descripcion)
VALUES
('Junior'),
('Semi Senior'),
('Senior');

INSERT INTO Motivo_Ausencia (Descripcion)
VALUES
('Enfermedad'),
('Vacaciones'),
('Trámite personal');

INSERT INTO Capacitacion (Descripcion, Duracion_horas, Fecha_inicio)
VALUES
('Atención al cliente', 10, '2022-03-01'),
('Técnicas de venta', 20, '2022-04-01'),
('Manipulación de alimentos', 15, '2023-01-15');

-- 🔹 2. Geografía
INSERT INTO Ciudades (Id_depto, Nom_ciudad, Poblacion, Clasificacion)
VALUES 
(1, 'Montevideo', 1300000, 'Capital'),
(2, 'Las Piedras', 80000, 'Urbana'),
(2, 'Pando', 25000, 'Urbana'),
(3, 'Maldonado', 60000, 'Turística'),
(4, 'Colonia del Sacramento', 30000, 'Histórica'),
(5, 'Paysandú', 70000, 'Industrial');

-- 🔹 3. Codificación
INSERT INTO Codigos (Tipo, Codigo, Descripcion)
VALUES
-- Tamaño
('Tamaño', 1, 'Pequeño'),
('Tamaño', 2, 'Mediano'),
('Tamaño', 3, 'Grande'),
-- Duración
('Duración', 1, 'Corta'),
('Duración', 2, 'Larga'),
-- Familia
('Familia', 1, 'Bebidas'),
('Familia', 2, 'Alimentos'),
('Familia', 3, 'Limpieza'),
('Familia', 4, 'Frescos'),
-- Producto (alineado con familia)
('Producto', 1, 'Jugo de naranja'),
('Producto', 2, 'Agua mineral'),
('Producto', 3, 'Salsa portuguesa'),
('Producto', 4, 'Detergente'),
('Producto', 5, 'Yogur natural'),
-- Artículo
('Artículo', 1, 'Salsa portuguesa, lata 1/2 kg'),
('Artículo', 2, 'Jugo de naranja, botella 1L'),
('Artículo', 3, 'Detergente, frasco 500ml'),
('Artículo', 4, 'Yogur natural, pote 200g'),
('Artículo', 5, 'Agua mineral, botella 2L');

-- 🔹 4. Empleados
INSERT INTO Empleado (Dni, Nombre, Apellido, Direccion, Sueldo, Fecha_ingreso, Id_local)
VALUES
(38765928,'Sofía', 'García', 'Av. Rivera 123', 45000, '2019-01-10', 1),
(30472877,'Juan', 'Martínez', 'Calle 18 de Julio 456', 55000, '2020-06-15', 2),
(40723566,'Camila', 'López', 'Av. Italia 890', 48000, '2021-02-20', 1),
(29322032,'Andrés', 'Rodríguez', 'Bvar. Artigas 111', 60000, '2018-09-01', 3);

-- 🔹 5. Clientes
INSERT INTO Clientes (Nombre, Direccion, Telefono, Id_ciudad, Id_depto, Id_rubro, Categoria, Fecha_alta)
VALUES 
('Super El Gaucho', 'Av. Italia 1234', '099123456', 1, 1, 1, 'A', '2020-03-10'),
('Kiosco La Esquina', 'Bvar. Artigas 200', '098654321', 2, 2, 4, 'B', '2021-05-15'),
('Almacén Don Pepe', 'Ruta 5 km 10', '099777888', 3, 2, 2, 'B', '2019-08-21'),
('Restaurante Mar y Sol', 'Av. Gorlero 900', '097333222', 4, 3, 3, 'A', '2022-02-01'),
('Distribuidora Colonia', 'Calle Real 45', '092555444', 5, 4, 5, 'A', '2023-06-10');

-- 🔹 6. Vendedores
INSERT INTO Vendedores (Dni, Nombre, Direccion, Telefono, Especialidad)
VALUES
(38765928,'Sofía García', 'Av. Rivera 123', '094111222', 'Bebidas'),
(30472877,'Juan Martínez', 'Calle 18 de Julio 456', '093333111', 'Alimentos'),
(40723566,'Camila López', 'Av. Italia 890', '099555333', 'Limpieza'),
(29322032,'Andrés Rodríguez', 'Bvar. Artigas 111', '098444999', 'Frescos');

-- 🔹 7. Productos y Artículos
INSERT INTO Productos (Id_familia, Id_duracion)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2),
(4, 1);

INSERT INTO Articulos (Id_producto, Id_tamaño)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 2);

-- 🔹 8. Promociones
INSERT INTO Promocion (Id_articulo, Fecha_inicio, Fecha_fin, Precio_promocion)
VALUES
(1, '2023-01-01', '2023-01-31', 150.00),
(2, '2023-02-01', '2023-02-28', 200.00),
(3, '2023-03-01', '2023-03-31', 120.00),
(4, '2023-04-01', '2023-04-30', 180.00);

-- 🔹 9. Facturas y Registros
-- Junio
INSERT INTO Facturas (Fecha, Id_cliente, Id_vendedor)
VALUES
('2023-06-01', 1, 2),
('2023-06-03', 2, 3),
('2023-06-05', 3, 4);

-- Julio
INSERT INTO Facturas (Fecha, Id_cliente, Id_vendedor)
VALUES
('2023-07-02', 4, 1),
('2023-07-04', 5, 2),
('2023-07-06', 1, 3);

-- Agosto
INSERT INTO Facturas (Fecha, Id_cliente, Id_vendedor)
VALUES
('2023-08-01', 2, 4),
('2023-08-03', 3, 1),
('2023-08-05', 4, 2);

-- Septiembre
INSERT INTO Facturas (Fecha, Id_cliente, Id_vendedor)
VALUES
('2023-09-02', 5, 3),
('2023-09-04', 1, 4),
('2023-09-06', 2, 1);

INSERT INTO RegistrosFacturas (Nro_Factura, Id_articulo, Importe, Unidades, Id_promocion)
VALUES
(1, 1, 500.00, 10, 1),
(1, 2, 300.00, 5, 2),
(2, 3, 120.00, 3, 3),
(3, 4, 450.00, 7, 4),
(4, 5, 280.00, 4, NULL),
(5, 1, 150.00, 2, 1);

-- 🔹 10. Relaciones con Empleado
INSERT INTO Telefono_empleado (Legajo, Telefono_empleado)
VALUES
(1, '098111222'),
(1, '099222333'),
(2, '098444555'),
(3, '097777888'),
(4, '096999000');

INSERT INTO CapacitacionXEmpleado (Id_capacitacion, Legajo, Resultado)
VALUES
(1, 1, 'Aprobado'),
(2, 2, 'Aprobado'),
(3, 3, 'En curso'),
(1, 4, 'Aprobado');

INSERT INTO Empleado_ausencia (Legajo, Fecha_ausencia, Cod_motivo)
VALUES
(1, '2023-07-10', 1),
(2, '2023-07-15', 2),
(3, '2023-08-01', 3);

INSERT INTO BasicoCategoria (IdCategoriaSalarial, FechaInicioVigencia, FechaFinVigencia, SalarioBasico)
VALUES
(1, '2023-01-01', '2023-12-31', 40000),
(2, '2023-01-01', '2023-12-31', 55000),
(3, '2023-01-01', '2023-12-31', 70000);

INSERT INTO CategoriaXEmpleado (IdCategoriaSalarial, Legajo, FechaInicio, FechaFin)
VALUES
(1, 1, '2019-01-10', NULL),
(2, 2, '2020-06-15', NULL),
(1, 3, '2021-02-20', NULL),
(3, 4, '2018-09-01', NULL);


