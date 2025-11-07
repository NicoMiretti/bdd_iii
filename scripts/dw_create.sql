-- crea la base de datos del DW
CREATE DATABASE DistribuidoraDW;
GO

-- selecciona la base de datos para trabajar
USE DistribuidoraDW;
GO


CREATE TABLE Dim_Tiempo (
    id_tiempo INT IDENTITY(1,1) PRIMARY KEY,
    anio INT,
    mes INT
);

-- Tabla Dimensión Producto
CREATE TABLE Dim_Producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    familia_producto VARCHAR(200),
    nombre_producto VARCHAR(200)
);

-- Tabla Dimensión Distribución Geográfica
CREATE TABLE Dim_Distr_Geografica (
    id_distr_geografica INT IDENTITY(1,1) PRIMARY KEY,
    departamento VARCHAR(100),
    ciudad VARCHAR(100)
);

-- Tabla Dimensión Vendedor
CREATE TABLE Dim_Vendedor (
    id_vendedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre_vendedor VARCHAR(100),
    hs_capacitacion INT,
    antiguedad INT,
    sueldo DECIMAL(10,2)
);

-- Tabla Dimensión Rubro
CREATE TABLE Dim_Rubro (
    id_rubro INT IDENTITY(1,1) PRIMARY KEY,
    nom_rubro VARCHAR(100)
);

-- Tabla de Hechos Ventas
CREATE TABLE Fact_Ventas (
    id_fact INT IDENTITY(1,1) PRIMARY KEY,
    id_tiempo INT,
    id_producto INT,
    id_distr_geografica INT,
    id_vendedor INT,
    id_rubro INT,
    cant_ventas INT,
    FOREIGN KEY (id_tiempo) REFERENCES Dim_Tiempo(id_tiempo),
    FOREIGN KEY (id_producto) REFERENCES Dim_Producto(id_producto),
    FOREIGN KEY (id_distr_geografica) REFERENCES Dim_Distr_Geografica(id_distr_geografica),
    FOREIGN KEY (id_vendedor) REFERENCES Dim_Vendedor(id_vendedor),
    FOREIGN KEY (id_rubro) REFERENCES Dim_Rubro(id_rubro)
);





