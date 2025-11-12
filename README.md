# 📊 Trabajo Práctico Nº1 — Data Warehouse  
**Materia:** Base de Datos III  
**Autores:** Cravero, Demaría, Giordano, Miretti  

---

## 🧱 Modelo Dimensional

### Tabla de Hechos: `Fact_Ventas`
- **Medida:** `cant_ventas`
- **Dimensiones:**
  - `Dim_Tiempo`: `anio`, `mes`
  - `Dim_Producto`: `familia_producto`, `nombre_producto`
  - `Dim_Distr_Geografica`: `departamento`, `ciudad`
  - `Dim_Vendedor`: `id`, `nombre`, `hs_capacitacion`, `sueldo`, `antigüedad`
  - `Dim_Rubro`: `nom_rubro`

---

## 🧮 Cubo OLAP

Incluye todas las dimensiones mencionadas, con datos agregados por:
- Ciudad, Departamento
- Producto (familia y nombre)
- Rubro
- Año
- Vendedor (nombre, sueldo, capacitación, antigüedad)

---

## 📈 Reportes Solicitados

### 1. Evolución de ventas por familia de producto
- **Dimensiones:** Tiempo (mes, año), Producto (familia)
- **Medida:** `SUM(cant_ventas)`

### 2. Evolución refinada por producto específico
- **Dimensiones:** Tiempo, Producto (nombre)
- **Medida:** `SUM(cant_ventas)`

### 3. Ventas por ciudad
- **Dimensiones:** Tiempo, Producto (familia), Geografía (ciudad, departamento)
- **Medida:** `SUM(cant_ventas)`

### 4. Ventas por rubro
- **Dimensiones:** Tiempo, Rubro
- **Medida:** `SUM(cant_ventas)`

### 5. Ventas por departamento, ciudad y familia de producto
- **Dimensiones:** Tiempo, Geografía, Producto (familia)
- **Medida:** `SUM(cant_ventas)`

### 6. Desempeño del vendedor en el tiempo
- **Dimensiones:** Tiempo, Vendedor (nombre)
- **Medida:** `SUM(cant_ventas)`

### 7. Influencia de capacitación, antigüedad y sueldo
- **Dimensiones:** Tiempo, Vendedor (nombre, hs_cap, antigüedad, sueldo)
- **Medida:** `SUM(cant_ventas)`

### 8. Asignación de producto a vendedores
- **Dimensiones:** Tiempo, Producto (nombre), Vendedor (nombre)
- **Medida:** `SUM(cant_ventas)`

### 9. Planificación de giras por ciudad
- **Dimensiones:** Tiempo, Ciudad, Vendedor
- **Medida:** `SUM(cant_ventas)`

---

## 📌 Total General de Ventas: `19`
