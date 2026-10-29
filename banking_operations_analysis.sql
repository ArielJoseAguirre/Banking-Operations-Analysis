SELECT
    tipo_movimiento,
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total,
    ROUND(AVG(importe), 2) AS importe_promedio
FROM movimientos
GROUP BY tipo_movimiento
ORDER BY importe_total DESC;



SELECT
    canal,
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total,
    ROUND(AVG(importe), 2) AS importe_promedio
FROM movimientos
GROUP BY canal
ORDER BY cantidad_operaciones DESC;



SELECT
    fecha_movimiento,
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total
FROM movimientos
GROUP BY fecha_movimiento
ORDER BY fecha_movimiento ASC;



SELECT
    m.id_movimiento,
    m.fecha_movimiento,
    m.tipo_movimiento,
    m.importe,
    m.canal,
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado
FROM movimientos AS m
INNER JOIN cuentas AS c
    ON m.id_cuenta = c.id_cuenta
ORDER BY m.fecha_movimiento ASC;



SELECT
    cl.id_cliente,
    cl.segmento,
    cl.provincia,
    COUNT(m.id_movimiento) AS cantidad_operaciones,
    COALESCE(SUM(m.importe), 0) AS importe_total
FROM clientes AS cl
INNER JOIN cuentas AS c
    ON cl.id_cliente = c.id_cliente
INNER JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY
    cl.id_cliente,
    cl.segmento,
    cl.provincia
ORDER BY importe_total DESC;



SELECT
    cl.id_cliente,
    cl.segmento,
    cl.provincia,
    COUNT(m.id_movimiento) AS cantidad_operaciones,
    COALESCE(SUM(m.importe), 0) AS importe_total
FROM clientes AS cl
LEFT JOIN cuentas AS c
    ON cl.id_cliente = c.id_cliente
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY
    cl.id_cliente,
    cl.segmento,
    cl.provincia
ORDER BY importe_total DESC;



SELECT
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado,
    COUNT(m.id_movimiento) AS cantidad_operaciones,
    COALESCE(SUM(m.importe), 0) AS importe_total,
    ROUND(COALESCE(AVG(m.importe), 0), 2) AS importe_promedio
FROM cuentas AS c
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado
ORDER BY importe_total DESC;



SELECT
    id_movimiento,
    id_cuenta,
    fecha_movimiento,
    tipo_movimiento,
    importe,
    canal
FROM movimientos
WHERE importe >= 100000
ORDER BY importe DESC;



SELECT
    id_movimiento,
    id_cuenta,
    fecha_movimiento,
    canal,
    importe
FROM movimientos
WHERE tipo_movimiento = 'Transferencia'
  AND canal = 'Banca digital'
ORDER BY importe DESC;



SELECT
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total,
    ROUND(AVG(importe), 2) AS importe_promedio
FROM movimientos
WHERE fecha_movimiento >= '2025-07-01'
  AND fecha_movimiento < '2025-08-01';

  
 
SELECT
    tipo_movimiento,
    canal,
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total,
    ROUND(AVG(importe), 2) AS importe_promedio
FROM movimientos
GROUP BY
    tipo_movimiento,
    canal
ORDER BY
    tipo_movimiento ASC,
    importe_total DESC;
	
	

SELECT
    id_movimiento,
    fecha_movimiento,
    tipo_movimiento,
    importe,
    CASE
        WHEN importe < 25000 THEN 'Bajo'
        WHEN importe < 100000 THEN 'Medio'
        ELSE 'Alto'
    END AS rango_importe
FROM movimientos
ORDER BY importe DESC;
	
 





SELECT
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado,
    COUNT(m.id_movimiento) AS cantidad_movimientos
FROM cuentas AS c
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado
ORDER BY cantidad_movimientos ASC, c.id_cuenta ASC;



SELECT
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado,
    COUNT(m.id_movimiento) AS cantidad_movimientos
FROM cuentas AS c
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado
HAVING COUNT(m.id_movimiento) = 0;



SELECT
    c.estado,
    COUNT(m.id_movimiento) AS cantidad_movimientos,
    COALESCE(SUM(m.importe), 0) AS importe_total
FROM cuentas AS c
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY c.estado
ORDER BY importe_total DESC;

 

SELECT
    canal,
    COUNT(*) AS cantidad_operaciones,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM movimientos),
        2
    ) AS porcentaje_operaciones
FROM movimientos
GROUP BY canal
ORDER BY porcentaje_operaciones DESC;
 
 
 
SELECT
    strftime('%Y-%m', fecha_movimiento) AS mes,
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total,
    ROUND(AVG(importe), 2) AS importe_promedio
FROM movimientos
GROUP BY strftime('%Y-%m', fecha_movimiento)
ORDER BY mes ASC;



SELECT
    strftime('%Y-%m', fecha_movimiento) AS mes,
    COUNT(*) AS cantidad_operaciones,
    SUM(importe) AS importe_total,
    ROUND(AVG(importe), 2) AS importe_promedio
FROM movimientos
GROUP BY strftime('%Y-%m', fecha_movimiento)
ORDER BY mes ASC;


SELECT
    tipo_movimiento,
    COUNT(*) AS cantidad_operaciones,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM movimientos),
        2
    ) AS porcentaje_operaciones
FROM movimientos
GROUP BY tipo_movimiento
ORDER BY cantidad_operaciones DESC;


SELECT
    canal,
    SUM(importe) AS importe_total,
    ROUND(
        SUM(importe) * 100.0 /
        (SELECT SUM(importe) FROM movimientos),
        2
    ) AS porcentaje_importe
FROM movimientos
GROUP BY canal
ORDER BY importe_total DESC;


SELECT
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado,
    COUNT(m.id_movimiento) AS cantidad_operaciones,
    COALESCE(SUM(m.importe), 0) AS importe_total
FROM cuentas AS c
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY
    c.id_cuenta,
    c.tipo_cuenta,
    c.estado
ORDER BY importe_total DESC;


SELECT
    cl.segmento,
    COUNT(DISTINCT cl.id_cliente) AS cantidad_clientes,
    COUNT(m.id_movimiento) AS cantidad_operaciones,
    COALESCE(SUM(m.importe), 0) AS importe_total,
    ROUND(AVG(m.importe), 2) AS importe_promedio
FROM clientes AS cl
LEFT JOIN cuentas AS c
    ON cl.id_cliente = c.id_cliente
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY cl.segmento
ORDER BY importe_total DESC;


SELECT
    cl.provincia,
    COUNT(DISTINCT cl.id_cliente) AS cantidad_clientes,
    COUNT(m.id_movimiento) AS cantidad_operaciones,
    COALESCE(SUM(m.importe), 0) AS importe_total
FROM clientes AS cl
LEFT JOIN cuentas AS c
    ON cl.id_cliente = c.id_cliente
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY cl.provincia
ORDER BY importe_total DESC;

SELECT
    strftime('%Y-%m', fecha_apertura) AS mes_apertura,
    COUNT(*) AS cantidad_cuentas
FROM cuentas
GROUP BY strftime('%Y-%m', fecha_apertura)
ORDER BY mes_apertura ASC;


SELECT
    id_cuenta,
    tipo_cuenta,
    estado,
    saldo_inicial
FROM cuentas
WHERE saldo_inicial > 200000
ORDER BY saldo_inicial DESC;

SELECT
    tipo_cuenta,
    COUNT(*) AS cantidad_cuentas,
    SUM(saldo_inicial) AS saldo_inicial_total,
    ROUND(AVG(saldo_inicial), 2) AS saldo_inicial_promedio,
    MAX(saldo_inicial) AS saldo_inicial_maximo
FROM cuentas
GROUP BY tipo_cuenta
ORDER BY saldo_inicial_total DESC;

SELECT
    fecha_movimiento,
    SUM(importe) AS importe_del_dia,
    SUM(SUM(importe)) OVER (
        ORDER BY fecha_movimiento
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS importe_acumulado
FROM movimientos
GROUP BY fecha_movimiento
ORDER BY fecha_movimiento;

SELECT
    c.id_cuenta,
    c.tipo_cuenta,
    SUM(CASE
        WHEN m.tipo_movimiento = 'Deposito'
        THEN m.importe ELSE 0
    END) AS total_depositos,
    SUM(CASE
        WHEN m.tipo_movimiento = 'Extraccion'
        THEN m.importe ELSE 0
    END) AS total_extracciones,
    SUM(CASE
        WHEN m.tipo_movimiento = 'Transferencia'
        THEN m.importe ELSE 0
    END) AS total_transferencias
FROM cuentas AS c
LEFT JOIN movimientos AS m
    ON c.id_cuenta = m.id_cuenta
GROUP BY c.id_cuenta, c.tipo_cuenta
ORDER BY c.id_cuenta;

SELECT
    id_movimiento,
    id_cuenta,
    fecha_movimiento,
    tipo_movimiento,
    importe
FROM movimientos
WHERE importe <= 0
   OR fecha_movimiento IS NULL
   OR tipo_movimiento IS NULL;
   
SELECT
    c.id_cuenta,
    c.id_cliente,
    c.tipo_cuenta
FROM cuentas AS c
LEFT JOIN clientes AS cl
    ON c.id_cliente = cl.id_cliente
WHERE cl.id_cliente IS NULL;   

SELECT
    m.id_movimiento,
    m.id_cuenta,
    m.fecha_movimiento,
    m.tipo_movimiento,
    m.importe
FROM movimientos AS m
LEFT JOIN cuentas AS c
    ON m.id_cuenta = c.id_cuenta
WHERE c.id_cuenta IS NULL;

SELECT
    MIN(fecha_movimiento) AS primera_fecha,
    MAX(fecha_movimiento) AS ultima_fecha,
    COUNT(*) AS cantidad_movimientos
FROM movimientos;

SELECT
    (SELECT COUNT(*) FROM clientes) AS total_clientes,
    (SELECT COUNT(*) FROM cuentas) AS total_cuentas,
    (SELECT COUNT(*) FROM movimientos) AS total_movimientos,
    (SELECT SUM(importe) FROM movimientos) AS importe_total_operado,
    (SELECT ROUND(AVG(importe), 2) FROM movimientos) AS importe_promedio,
    (SELECT COUNT(DISTINCT canal) FROM movimientos) AS canales_utilizados;