SELECT codigo_oficina, ciudad FROM oficina;

SELECT ciudad, telefono FROM oficina WHERE pais = 'España';

SELECT nombre, apellido1, apellido2, email FROM empleado WHERE codigo_jefe = 7;

SELECT puesto, nombre, apellido1, apellido2, email FROM empleado WHERE codigo_empleado IN (SELECT codigo_jefe FROM empleado WHERE codigo_jefe IS NULL);

SELECT nombre, apellido1, apellido2, puesto FROM empleado WHERE puesto <> 'Representante de ventas';

SELECT nombre_cliente FROM cliente WHERE pais = 'España';

SELECT DISTINCT estado FROM pedido;

SELECT DISTINCT codigo_cliente FROM pago WHERE YEAR(fecha_pago) = 2008;

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido WHERE fecha_entrega > fecha_esperada;

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido WHERE fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega FROM pedido WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

SELECT * FROM pedido WHERE YEAR(fecha_pedido) = 2009;

SELECT * FROM pedido WHERE MONTH(fecha_pedido) = 1;

SELECT * FROM pago WHERE YEAR(fecha_pago) = 2008 AND forma_pago = 'Paypal' ORDER BY total DESC;

SELECT DISTINCT forma_pago FROM pago;

SELECT * FROM producto WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100 ORDER BY precio_venta DESC;

SELECT * FROM cliente WHERE ciudad = 'Madrid' AND codigo_empleado_rep_ventas IN (11, 30);

SELECT codigo_producto, nombre FROM producto WHERE precio_venta > 50;

SELECT nombre_cliente, limite_credito FROM cliente ORDER BY limite_credito DESC;

SELECT nombre, cantidad_en_stock, precio_venta FROM producto WHERE nombre LIKE 'A%';

SELECT nombre_cliente, ciudad FROM cliente ORDER BY ciudad;

SELECT nombre, apellido1 FROM empleado WHERE codigo_oficina = 'OF001';

SELECT codigo_pedido, codigo_producto, cantidad FROM detalle_pedido WHERE cantidad > 10;

SELECT nombre_cliente, telefono FROM cliente WHERE fax IS NULL;

SELECT codigo_cliente, SUM(total) as total_pagado FROM pago GROUP BY codigo_cliente ORDER BY total_pagado DESC;

SELECT nombre_cliente, telefono FROM cliente WHERE limite_credito < 500;
