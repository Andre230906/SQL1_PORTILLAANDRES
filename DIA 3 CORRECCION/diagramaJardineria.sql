-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS jardineria;
USE jardineria;

CREATE TABLE IF NOT EXISTS gama_producto (
    gama VARCHAR(50) PRIMARY KEY,
    descripcion_text TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256)
);

INSERT INTO gama_producto (gama, descripcion_text, descripcion_html, imagen) VALUES 
('Ornamentales', 'Plantas ornamentales', '<p>Plantas ornamentales</p>', 'ornamentales.jpg'),
('Frutales', 'Árboles frutales', '<p>Árboles frutales</p>', 'frutales.jpg');

CREATE TABLE IF NOT EXISTS producto (
    codigo_producto VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(70),
    gama VARCHAR(50),
    dimensiones VARCHAR(50),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT,
    precio_venta DECIMAL(15,2),
    precio_proveedor DECIMAL(15,2),
    FOREIGN KEY (gama) REFERENCES gama_producto(gama)
);

INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES 
('P001', 'Rosa', 'Ornamentales', '30cm', 'Proveedor A', 'Rosa ornamental', 150, 10.50, 5.00),
('P002', 'Manzano', 'Frutales', '150cm', 'Proveedor B', 'Árbol de manzano', 50, 20.00, 15.00);

CREATE TABLE IF NOT EXISTS cliente (
    codigo_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(50),
    nombre_contacto VARCHAR(30),
    apellido_contacto VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(15),
    codigo_empleado_rep_ventas INT,
    limite_credito DECIMAL(15,2)
);

INSERT INTO cliente (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito) VALUES 
(1, 'Cliente 1', 'Juan', 'Pérez', '123456789', '123456789', 'Calle Falsa 123', '', 'Madrid', 'Madrid', 'España', '28001', 1, 1000.00),
(2, 'Cliente 2', 'María', 'García', '987654321', '987654321', 'Avenida Siempre Viva 742', '', 'Barcelona', 'Cataluña', 'España', '08001', 2, 2000.00);

CREATE TABLE IF NOT EXISTS pedido (
    codigo_pedido INT PRIMARY KEY,
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha_entrega DATE,
    estado VARCHAR(15),
    comentarios TEXT,
    codigo_cliente INT,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

INSERT INTO pedido (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) VALUES 
(1, '2023-01-01', '2023-01-10', '2023-01-09', 'Entregado', 'Ninguno', 1),
(2, '2023-02-01', '2023-02-10', '2023-02-11', 'Entregado', 'Ninguno', 2);

CREATE TABLE IF NOT EXISTS detalle_pedido (
    codigo_pedido INT,
    codigo_producto VARCHAR(15),
    cantidad INT,
    precio_unidad DECIMAL(15,2),
    numero_linea SMALLINT,
    PRIMARY KEY (codigo_pedido, codigo_producto),
    FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) VALUES 
(1, 'P001', 10, 10.50, 1),
(2, 'P002', 5, 20.00, 1);

CREATE TABLE IF NOT EXISTS pago (
    codigo_cliente INT,
    forma_pago VARCHAR(40),
    id_transaccion VARCHAR(50),
    fecha_pago DATE,
    total DECIMAL(15,2),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total) VALUES 
(1, 'Paypal', 'TXN123', '2008-01-01', 100.00),
(2, 'Transferencia', 'TXN124', '2008-02-01', 200.00);

CREATE TABLE IF NOT EXISTS oficina (
    codigo_oficina VARCHAR(10) PRIMARY KEY,
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    region VARCHAR(50),
    codigo_postal VARCHAR(15),
    telefono VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50)
);

INSERT INTO oficina (codigo_oficina, ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2) VALUES 
('OF001', 'Madrid', 'España', 'Madrid', '28001', '123456789', 'Calle Mayor 1', 'Edificio A'),
('OF002', 'Barcelona', 'España', 'Cataluña', '08001', '987654321', 'Avenida Diagonal 123', 'Edificio B');

CREATE TABLE IF NOT EXISTS empleado (
    codigo_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    codigo_oficina VARCHAR(10),
    codigo_jefe INT,
    puesto VARCHAR(50),
    FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina),
    FOREIGN KEY (codigo_jefe) REFERENCES empleado(codigo_empleado)
);

INSERT INTO empleado (codigo_empleado, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, puesto) VALUES 
(1, 'Carlos', 'Sánchez', 'López', '100', 'carlos@example.com', 'OF001', NULL, 'Director'),
(2, 'Ana', 'Martínez', 'Gómez', '101', 'ana@example.com', 'OF001', 1, 'Representante de ventas'),
(3, 'Luis', 'Fernández', 'Pérez', '102', 'luis@example.com', 'OF002', 1, 'Representante de ventas');
