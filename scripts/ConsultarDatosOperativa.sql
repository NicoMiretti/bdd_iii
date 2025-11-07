-- 🔹 Clientes con ciudad, departamento y rubro
SELECT 
    C.Id_cliente,
    C.Nombre AS cliente,
    C.Direccion,
    C.Telefono,
    Ci.Nom_ciudad,
    D.Nom_depto,
    R.Nom_rubro,
    C.Categoria,
    C.Fecha_alta
FROM Clientes C
JOIN Ciudades Ci ON Ci.Id_ciudad = C.Id_ciudad
JOIN Departamentos D ON D.Id_depto = C.Id_depto
JOIN Rubros R ON R.Id_rubro = C.Id_rubro;

-- 🔹 Productos con nombre y familia
SELECT 
    P.Id_producto,
    CP.Descripcion AS nombre_producto,
    CF.Descripcion AS familia_producto,
    CD.Descripcion AS duracion
FROM Productos P
LEFT JOIN Codigos CP ON CP.Tipo = 'Producto' AND CP.Codigo = P.Id_producto
LEFT JOIN Codigos CF ON CF.Tipo = 'Familia' AND CF.Codigo = P.Id_familia
LEFT JOIN Codigos CD ON CD.Tipo = 'Duración' AND CD.Codigo = P.Id_duracion;

-- 🔹 Artículos con nombre de producto y tamaño
SELECT 
    A.Id_articulo,
    CA.Descripcion AS nombre_articulo,
    CP.Descripcion AS producto,
    CT.Descripcion AS tamaño
FROM Articulos A
LEFT JOIN Codigos CA ON CA.Tipo = 'Artículo' AND CA.Codigo = A.Id_articulo
LEFT JOIN Codigos CP ON CP.Tipo = 'Producto' AND CP.Codigo = A.Id_producto
LEFT JOIN Codigos CT ON CT.Tipo = 'Tamaño' AND CT.Codigo = A.Id_tamaño;

-- 🔹 Facturas con cliente y vendedor
SELECT 
    F.Nro_Factura,
    F.Fecha,
    C.Nombre AS cliente,
    V.Nombre AS vendedor
FROM Facturas F
JOIN Clientes C ON C.Id_cliente = F.Id_cliente
JOIN Vendedores V ON V.Id_vendedor = F.Id_vendedor;

-- 🔹 Registros de factura con artículo y promoción
SELECT 
    RF.Nro_Factura,
    RF.Id_articulo,
    CA.Descripcion AS articulo,
    RF.Unidades,
    RF.Importe,
    PR.Precio_promocion,
    PR.Fecha_inicio,
    PR.Fecha_fin
FROM RegistrosFacturas RF
LEFT JOIN Codigos CA ON CA.Tipo = 'Artículo' AND CA.Codigo = RF.Id_articulo
LEFT JOIN Promocion PR ON PR.Id_promocion = RF.Id_promocion;

-- 🔹 Empleados con teléfonos
SELECT 
    E.Legajo,
    E.Nombre,
    E.Apellido,
    T.Telefono_empleado
FROM Empleado E
LEFT JOIN Telefono_empleado T ON T.Legajo = E.Legajo;

-- 🔹 Empleados con capacitaciones
SELECT 
    E.Legajo,
    E.Nombre,
    E.Apellido,
    CAP.Descripcion AS capacitacion,
    CAP.Duracion_horas,
    CXE.Resultado
FROM CapacitacionXEmpleado CXE
JOIN Empleado E ON E.Legajo = CXE.Legajo
JOIN Capacitacion CAP ON CAP.Id_capacitacion = CXE.Id_capacitacion;

-- 🔹 Empleados con ausencias
SELECT 
    E.Legajo,
    E.Nombre,
    E.Apellido,
    EA.Fecha_ausencia,
    MA.Descripcion AS motivo
FROM Empleado_ausencia EA
JOIN Empleado E ON E.Legajo = EA.Legajo
JOIN Motivo_Ausencia MA ON MA.Cod_motivo = EA.Cod_motivo;

-- 🔹 Empleados con categoría salarial
SELECT 
    E.Legajo,
    E.Nombre,
    E.Apellido,
    CAT.Descripcion AS categoria,
    BC.SalarioBasico,
    BC.FechaInicioVigencia,
    BC.FechaFinVigencia
FROM CategoriaXEmpleado CXE
JOIN Empleado E ON E.Legajo = CXE.Legajo
JOIN Categoria CAT ON CAT.IdCategoriaSalarial = CXE.IdCategoriaSalarial
JOIN BasicoCategoria BC ON BC.IdCategoriaSalarial = CAT.IdCategoriaSalarial;
