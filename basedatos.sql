-- Crear la base de datos tecnoweb2 (si ya existe, se elimina)
DROP DATABASE IF EXISTS tecnoweb2;
CREATE DATABASE tecnoweb2;
USE tecnoweb2;

-- Crear la tabla 'usuarios'
CREATE TABLE usuarios (
  registro INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  edad INT,
  genero ENUM('M','F'),
  telefono VARCHAR(10),
  tipo_usuario ENUM('cliente', 'empleado', 'administrador'),
  correo NVARCHAR(50) NOT NULL,
  contraseña VARCHAR(50) NOT NULL
);

create table usuarios_fisicos(
 nombre INT AUTO_INCREMENT PRIMARY KEY,
 apellidos varchar (50)
);

-- Crear el trigger para validar correos únicos

-- Crear la tabla 'dispositivos'
CREATE TABLE dispositivos (
  id_dips INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  marca ENUM ('Samsumg', 'Iphone', 'Motorola', 'Huawei', 'Xiaomi'),
  modelo VARCHAR(50) NOT NULL,
  tipo_dispositivos ENUM ('celulares', 'tablets', 'laptops', 'computadoras')
);

-- Crear la tabla 'reparaciones'
CREATE TABLE reparaciones (
  id_reparaciones INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  tipo_reparaciones VARCHAR(50)
);

-- Crear la tabla 'reparacion_dispositivos'
CREATE TABLE reparacion_dispositivos (
  id_rd INT AUTO_INCREMENT PRIMARY KEY,
  dispositivo_id INT NOT NULL,
  reparacion_id INT NOT NULL,
  precio decimal (8,2),
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivos (id_dips),
  FOREIGN KEY (reparacion_id) REFERENCES reparaciones (id_reparaciones)
);

-- Crear la tabla 'categorias'
CREATE TABLE categorias (
 id_cat INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 tipo ENUM ('fundas', 'micas', 'cargadores', 'memorias', 'cables', 'audifonos','celulares')
);

-- Crear la tabla 'accesorios'
CREATE TABLE accesorios (
  id_inventario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100),
  precio decimal (8,2),
  cantidad int,
  tipo_cat INT,
  FOREIGN KEY (tipo_cat) REFERENCES categorias (id_cat)
);

-- Crear la tabla 'registro_accesorios'
CREATE TABLE registro_accesorios (
  id_reg INT AUTO_INCREMENT PRIMARY KEY,
  fecha_venta DATE,
  cantidad_v INT,
  accesorio_id INT,
  FOREIGN KEY (accesorio_id) REFERENCES accesorios (id_inventario)
);

-- Crear la tabla 'citas'
CREATE TABLE citas (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  fecha_cita DATE,
  fecha_elegida time,
  motivo_cita VARCHAR(80),
  usuario_reg INT,
  marca_cita varchar (50),
  modelo_cita varchar (50),
  tipo_dis varchar (50),
  FOREIGN KEY (usuario_reg) REFERENCES usuarios (registro)
);


-- Crear la tabla 'reporte'
CREATE TABLE reporte (
  id_reporte INT AUTO_INCREMENT PRIMARY KEY,
  precio DECIMAL(8,2),
  fecha_entrega DATE,
  cita INT,
  FOREIGN KEY (cita) REFERENCES citas (id_cita)
);



-- Crear el disparador para actualizar la cantidad en la tabla 'accesorios' cuando se inserta un registro en 'registro_accesorios'
DELIMITER //

CREATE TRIGGER actualizar_cantidad_accesorios
AFTER INSERT ON registro_accesorios
FOR EACH ROW
BEGIN
  UPDATE accesorios
  SET cantidad = cantidad - NEW.cantidad_v
  WHERE id_inventario = NEW.accesorio_id;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER validar_correo
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
  IF NEW.correo NOT LIKE '%@%' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo debe contener el símbolo "@"';
  END IF;
END//
DELIMITER ;

-- Establecer el valor de incremento automático en cada tabla
ALTER TABLE usuarios AUTO_INCREMENT = 1000;
ALTER TABLE dispositivos AUTO_INCREMENT = 1000;
ALTER TABLE reparaciones AUTO_INCREMENT = 1000;
ALTER TABLE reparacion_dispositivos AUTO_INCREMENT = 1000;
ALTER TABLE categorias AUTO_INCREMENT = 1000;
ALTER TABLE accesorios AUTO_INCREMENT = 1000;
ALTER TABLE citas AUTO_INCREMENT = 1000;
ALTER TABLE reporte AUTO_INCREMENT = 1000;
ALTER TABLE registro_accesorios AUTO_INCREMENT = 1000;

CREATE VIEW reporte_ventas_accesorios AS
SELECT a.nombre AS nombre_accesorio, SUM(ra.cantidad_v) AS cantidad_vendida, SUM(a.precio * ra.cantidad_v) AS monto_total
FROM accesorios a
INNER JOIN registro_accesorios ra ON a.id_inventario = ra.accesorio_id
GROUP BY a.nombre;

-- Crear la vista para el reporte mensual de reparaciones
CREATE VIEW reporte_reparaciones_mensuales AS
SELECT
  MONTH(fecha_entrega) AS mes,
  YEAR(fecha_entrega) AS anio,
  COUNT(*) AS cantidad_reparaciones
FROM
  reporte
GROUP BY
  MONTH(fecha_entrega), YEAR(fecha_entrega);


-- Crear la vista para el reporte detallado de reparaciones
CREATE VIEW reporte_reparaciones_detalle AS
SELECT
  r.id_reporte,
  r.fecha_entrega,
  c.fecha_cita,
  u.nombre,
  u.apellidos,
  d.marca,
  d.modelo,
  rep.tipo_reparaciones,
  r.precio AS costo_reparacion
FROM
  reporte r
  JOIN citas c ON r.cita = c.id_cita
  JOIN usuarios u ON c.usuario_reg = u.registro
  JOIN dispositivos d ON c.dis_cita = d.marca AND c.rep_cita = d.modelo -- Corrección aquí
  JOIN reparaciones rep ON c.rep_cita = rep.tipo_reparaciones; -- Corrección aquí


-- Inserción de registros en la tabla 'categorias'
INSERT INTO categorias (tipo)
VALUES
  ('fundas'),
  ('micas'),
  ('cargadores'),
  ('memorias'),
  ('cables');

-- Agregar 5 registros a la tabla 'accesorios'
INSERT INTO accesorios (nombre, descripcion, precio, cantidad, tipo_cat)
VALUES
  ('Adaptador USB-C a HDMI', 'Adaptador para conectar dispositivos USB-C a HDMI', 49.99, 15, 1000),
  ('Altavoz Bluetooth', 'Altavoz portátil con conectividad Bluetooth', 69.99, 20, 1001),
  ('Base de refrigeración', 'Base para laptops con ventiladores para mantener la temperatura baja', 29.99, 8, 1002),
  ('Mouse inalámbrico', 'Mouse ergonómico con conexión inalámbrica', 19.99, 12, 1003),
  ('Teclado retroiluminado', 'Teclado con retroiluminación LED ajustable', 39.99, 10, 1004);

-- Inserción de registros en la tabla 'registro_accesorios'
INSERT INTO registro_accesorios (fecha_venta, cantidad_v, accesorio_id)
VALUES
  ('2023-06-01', 2, 1000),
  ('2023-06-02', 5, 1001),
  ('2023-06-03', 1, 1002),
  ('2023-06-04', 3, 1003),
  ('2023-06-05', 4, 1004);
  
  
DELIMITER //
CREATE PROCEDURE AgregarDispositivo
   (IN p_marca ENUM('Samsung', 'iPhone', 'Motorola', 'Huawei', 'Xiaomi'),
    IN p_modelo VARCHAR(50),
    IN p_tipo_dispositivos ENUM('celulares', 'tablets', 'laptops', 'computadoras'))
BEGIN
    INSERT INTO dispositivos (marca, modelo, tipo_dispositivos)
    VALUES (p_marca, p_modelo, p_tipo_dispositivos);
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE AgregarReparacion
   (IN tipo_reparacion VARCHAR(50))
BEGIN
    INSERT INTO reparaciones (tipo_reparaciones)
    VALUES (tipo_reparacion);
END //

DELIMITER ;  
