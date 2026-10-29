# Banking Operations Analysis

## Descripción
Proyecto de análisis de datos bancarios con SQL y SQLite, desarrollado con datos ficticios para practicar consultas y análisis de operaciones.

## Objetivo
Analizar movimientos, cuentas y clientes mediante consultas SQL para obtener indicadores y explorar patrones de actividad bancaria.

## Herramientas
- SQLite
- DB Browser for SQLite
- SQL

## Modelo de datos
- **clientes:** segmento, provincia y fecha de alta.
- **cuentas:** tipo de cuenta, fecha de apertura, estado y saldo inicial.
- **movimientos:** fecha, tipo de movimiento, importe y canal.

## Análisis realizados
- Cantidad e importe de operaciones por tipo y canal.
- Análisis mensual de movimientos y aperturas de cuentas.
- Operaciones por cuenta, segmento de clientes y provincia.
- Saldos iniciales por tipo de cuenta.
- Importes acumulados por fecha mediante funciones de ventana.
- Controles de calidad e integridad entre tablas.
- Indicadores generales para un resumen ejecutivo.

## Habilidades SQL aplicadas
`SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, `INNER JOIN`, `LEFT JOIN`, `CASE WHEN`, funciones de agregación, subconsultas, `strftime()` y funciones de ventana.

## Datos
Todos los datos utilizados son ficticios y fueron creados exclusivamente con fines educativos. Los importes representan movimientos brutos registrados; no equivalen a saldos actuales ni a resultados financieros netos.

## Archivos
- `Banking_Operations_Analysis.db`: base de datos SQLite.
- `banking_operations_analysis.sql`: consultas SQL del proyecto.

## Alcance
Proyecto de práctica orientado al desarrollo de habilidades de análisis de datos para puestos junior. Los resultados no representan información real de una entidad financiera.