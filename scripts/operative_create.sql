-- crea la base de datos operativa donde estarán los sistemas transaccionales
CREATE DATABASE DistribuidoraOperativa;
GO

-- selecciona la base de datos para trabajar
USE DistribuidoraOperativa;
GO

-- tabla de departamentos
CREATE TABLE Departamentos (
    Id_depto INT IDENTITY(1,1) PRIMARY KEY,
    Nom_depto VARCHAR(100),
    Zona VARCHAR(50)
);

-- tabla de ciudades
CREATE TABLE Ciudades (
    Id_ciudad INT IDENTITY(1,1) PRIMARY KEY,
    Id_depto INT FOREIGN KEY REFERENCES Departamentos(Id_depto),
    Nom_ciudad VARCHAR(100),
    Poblacion INT,
    Clasificacion VARCHAR(50)
);

-- tabla de rubros
CREATE TABLE Rubros (
    Id_rubro INT IDENTITY(1,1) PRIMARY KEY,
    Nom_rubro VARCHAR(100)
);

-- tabla de clientes
CREATE TABLE Clientes (
    Id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(50),
    Id_ciudad INT FOREIGN KEY REFERENCES Ciudades(Id_ciudad),
    Id_depto INT FOREIGN KEY REFERENCES Departamentos(Id_depto),
    Id_rubro INT FOREIGN KEY REFERENCES Rubros(Id_rubro),
    Categoria VARCHAR(50),
    Fecha_alta DATE
);

-- tabla de vendedores
CREATE TABLE Vendedores (
    Id_vendedor INT IDENTITY(1,1) PRIMARY KEY,
	Dni INT,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(50),
    Especialidad VARCHAR(100)
);

-- tabla de productos
CREATE TABLE Productos (
    Id_producto INT IDENTITY(1,1) PRIMARY KEY,
    Id_familia INT,
    Id_duracion INT
);

-- tabla de artículos
CREATE TABLE Articulos (
    Id_articulo INT IDENTITY(1,1) PRIMARY KEY,
    Id_producto INT FOREIGN KEY REFERENCES Productos(Id_producto),
    Id_tamaño INT
);

-- tabla de promociones
CREATE TABLE Promocion (
    Id_promocion INT IDENTITY(1,1) PRIMARY KEY,
    Id_articulo INT FOREIGN KEY REFERENCES Articulos(Id_articulo),
    Fecha_inicio DATE,
    Fecha_fin DATE,
    Precio_promocion DECIMAL(10,2)
);

-- tabla de facturas
CREATE TABLE Facturas (
    Nro_Factura INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    Id_cliente INT FOREIGN KEY REFERENCES Clientes(Id_cliente),
    Id_vendedor INT FOREIGN KEY REFERENCES Vendedores(Id_vendedor)
);

-- tabla de registros de facturas
CREATE TABLE RegistrosFacturas (
    Nro_Factura INT FOREIGN KEY REFERENCES Facturas(Nro_Factura),
    Id_articulo INT FOREIGN KEY REFERENCES Articulos(Id_articulo),
    Importe DECIMAL(10,2),
    Unidades INT,
    Id_promocion INT FOREIGN KEY REFERENCES Promocion(Id_promocion),
    PRIMARY KEY (Nro_Factura, Id_articulo)
);

-- tabla de códigos
CREATE TABLE Codigos (
    Tipo VARCHAR(50),
    Codigo INT,
    Descripcion VARCHAR(200),
    PRIMARY KEY (Tipo, Codigo)
);

---------------------------------------------------
-- sistema de recursos humanos
---------------------------------------------------

-- tabla de empleados
CREATE TABLE Empleado (
    Legajo INT IDENTITY(1,1) PRIMARY KEY,
	Dni INT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Direccion VARCHAR(200),
    Sueldo DECIMAL(10,2),
    Fecha_ingreso DATE,
    Id_local INT
);

-- tabla de teléfonos de empleados
CREATE TABLE Telefono_empleado (
    Legajo INT FOREIGN KEY REFERENCES Empleado(Legajo),
    Telefono_empleado VARCHAR(50),
    PRIMARY KEY (Legajo, Telefono_empleado)
);

-- tabla de capacitaciones
CREATE TABLE Capacitacion (
    Id_capacitacion INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(200),
    Duracion_horas INT,
    Fecha_inicio DATE
);

-- relación empleados-capacitaciones
CREATE TABLE CapacitacionXEmpleado (
    Id_capacitacion INT FOREIGN KEY REFERENCES Capacitacion(Id_capacitacion),
    Legajo INT FOREIGN KEY REFERENCES Empleado(Legajo),
    Resultado VARCHAR(50),
    PRIMARY KEY (Id_capacitacion, Legajo)
);

-- tabla de motivos de ausencia
CREATE TABLE Motivo_Ausencia (
    Cod_motivo INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(200)
);

-- tabla de ausencias de empleados
CREATE TABLE Empleado_ausencia (
    Legajo INT FOREIGN KEY REFERENCES Empleado(Legajo),
    Fecha_ausencia DATE,
    Cod_motivo INT FOREIGN KEY REFERENCES Motivo_Ausencia(Cod_motivo),
    PRIMARY KEY (Legajo, Fecha_ausencia)
);

-- tabla de categorías salariales
CREATE TABLE Categoria (
    IdCategoriaSalarial INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(100)
);

-- tabla de básicos por categoría
CREATE TABLE BasicoCategoria (
    IdCategoriaSalarial INT FOREIGN KEY REFERENCES Categoria(IdCategoriaSalarial),
    FechaInicioVigencia DATE,
    FechaFinVigencia DATE,
    SalarioBasico DECIMAL(10,2),
    PRIMARY KEY (IdCategoriaSalarial, FechaInicioVigencia)
);

-- relación categoría-empleado
CREATE TABLE CategoriaXEmpleado (
    IdCategoriaSalarial INT FOREIGN KEY REFERENCES Categoria(IdCategoriaSalarial),
    Legajo INT FOREIGN KEY REFERENCES Empleado(Legajo),
    FechaInicio DATE,
    FechaFin DATE,
    PRIMARY KEY (IdCategoriaSalarial, Legajo, FechaInicio)
);


