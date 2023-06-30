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
  correo NVARCHAR(50) NOT NULL,
  contraseña VARCHAR(50) NOT NULL
);

-- Crear el trigger para validar correos únicos

-- Crear la tabla 'dispositivos'
CREATE TABLE dispositivos (
  id_dips INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  tipo_dispositivos ENUM ('celulares', 'tablets', 'laptops', 'computadoras', 'consolas')
);

-- Crear la tabla 'reparaciones'
CREATE TABLE reparaciones (
  id_reparaciones INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  tipo_reparaciones VARCHAR(50),
  descripcion NVARCHAR(100) 
);

-- Crear la tabla 'reparacion_dispositivos'
CREATE TABLE reparacion_dispositivos (
  id_rd INT AUTO_INCREMENT PRIMARY KEY,
  dispositivo_id INT NOT NULL,
  reparacion_id INT NOT NULL,
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivos (id_dips),
  FOREIGN KEY (reparacion_id) REFERENCES reparaciones (id_reparaciones)
);

-- Crear la tabla 'categorias'
CREATE TABLE categorias (
 id_cat INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 tipo ENUM ('fundas', 'micas', 'cargadores', 'memorias', 'cables', 'audifonos')
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
/* agregar cantidad de accesorios y otra tabla de accesorios vendidos*/


-- Crear la tabla 'dispositivos_usuarios'
CREATE TABLE dispositivos_usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  rep_dis INT,
  usuario INT,
  FOREIGN KEY (rep_dis) REFERENCES reparacion_dispositivos (id_rd),
  FOREIGN KEY (usuario) REFERENCES usuarios (registro)
);

-- Crear la tabla 'citas'
CREATE TABLE citas (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  fecha_cita DATE,
  motivo_cita VARCHAR(80),
  usuario_reg INT,
  dis_id INT,
  rep_id INT,
  FOREIGN KEY (dis_id) REFERENCES dispositivos (id_dips),
  FOREIGN KEY (usuario_reg) REFERENCES usuarios (registro),
  FOREIGN KEY (rep_id) REFERENCES reparaciones (id_reparaciones)
);

-- Crear la tabla 'reporte'
CREATE TABLE reporte (
  id_reporte INT AUTO_INCREMENT PRIMARY KEY,
  precio DECIMAL(8,2),
  fecha_entrega DATE,
  cita INT,
  FOREIGN KEY (cita) REFERENCES citas (id_cita)
);

-- Crear la tabla 'registro_accesorios'
CREATE TABLE registro_accesorios (
  id_reg INT AUTO_INCREMENT PRIMARY KEY,
  fecha_venta DATE,
  cantidad_v INT,
  accesorio_id INT,
  FOREIGN KEY (accesorio_id) REFERENCES accesorios (id_inventario)
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

-- Establecer el valor de incremento automático en cada tabla
ALTER TABLE usuarios AUTO_INCREMENT = 1000;
ALTER TABLE dispositivos AUTO_INCREMENT = 1000;
ALTER TABLE reparaciones AUTO_INCREMENT = 1000;
ALTER TABLE reparacion_dispositivos AUTO_INCREMENT = 1000;
ALTER TABLE categorias AUTO_INCREMENT = 1000;
ALTER TABLE accesorios AUTO_INCREMENT = 1000;
ALTER TABLE dispositivos_usuarios AUTO_INCREMENT = 1000;
ALTER TABLE citas AUTO_INCREMENT = 1000;
ALTER TABLE reporte AUTO_INCREMENT = 1000;
ALTER TABLE registro_accesorios AUTO_INCREMENT = 1000;

-- Agregar 5 registros a la tabla 'usuarios'
use tecnoweb2;
INSERT INTO usuarios (nombre, apellidos, edad, genero, telefono, correo, contraseña)
VALUES
  ('Elena', 'González', 27, 'F', '4561237890', 'elena@example.com', 'contraseña6'),
  ('Andrés', 'Martínez', 40, 'M', '9870123456', 'andres@example.com', 'contraseña7'),
  ('Sofía', 'López', 22, 'F', '6549873210', 'sofia@example.com', 'contraseña8'),
  ('Alejandro', 'Hernández', 33, 'M', '3217896540', 'alejandro@example.com', 'contraseña9'),
  ('Ana', 'Ramírez', 29, 'F', '8904561237', 'ana@example.com', 'contraseña10');

-- Agregar 5 registros a la tabla 'dispositivos'
INSERT INTO dispositivos (marca, modelo, tipo_dispositivos)
VALUES
  ('Motorola', 'Moto G8', 'celulares'),
  ('Lenovo', 'Tab M10', 'tablets'),
  ('Asus', 'ROG Strix G15', 'laptops'),
  ('Acer', 'Nitro 5', 'laptops'),
  ('Microsoft', 'Xbox Series X', 'consolas');

-- Agregar 5 registros a la tabla 'reparaciones'
INSERT INTO reparaciones (tipo_reparaciones, descripcion)
VALUES
  ('Reemplazo de batería', 'Cambio de la batería dañada'),
  ('Reparación de software', 'Solución de problemas de software'),
  ('Reparación de conector de carga', 'Arreglo del conector de carga defectuoso'),
  ('Reparación de placa madre', 'Reparación o reemplazo de la placa madre'),
  ('Actualización de memoria RAM', 'Aumento de la memoria RAM');

-- Agregar 5 registros a la tabla 'reparacion_dispositivos'
INSERT INTO reparacion_dispositivos (dispositivo_id, reparacion_id)
VALUES
  (1000, 1000),
  (1001, 1001),
  (1002, 1003),
  (1003, 1002),
  (1004, 1004);

-- Agregar 5 registros a la tabla 'categorias'
INSERT INTO categorias (tipo)
VALUES
  ('fundas'),
  ('micas'),
  ('cargadores'),
  ('memorias'),
  ('cables'),
  ('audifonos');
-- Agregar 5 registros a la tabla 'accesorios'
INSERT INTO accesorios (nombre, descripcion, precio, cantidad, tipo_cat)
VALUES
  ('Adaptador USB-C a HDMI', 'Adaptador para conectar dispositivos USB-C a HDMI', 49.99, 15, 1000),
  ('Altavoz Bluetooth', 'Altavoz portátil con conectividad Bluetooth', 69.99, 20, 1001),
  ('Base de refrigeración', 'Base para laptops con ventiladores para mantener la temperatura baja', 29.99, 8, 1002),
  ('Mouse inalámbrico', 'Mouse ergonómico con conexión inalámbrica', 19.99, 12, 1003),
  ('Teclado retroiluminado', 'Teclado con retroiluminación LED ajustable', 39.99, 10, 1004);

-- Agregar 5 registros a la tabla 'dispositivos_usuarios'
INSERT INTO dispositivos_usuarios (rep_dis, usuario)
VALUES
  (1000, 1000),
  (1001, 1001),
  (1003, 1002),
  (1002, 1003),
  (1004, 1004);

-- Agregar 5 registros a la tabla 'citas'
INSERT INTO citas (fecha_cita, motivo_cita, usuario_reg, dis_id, rep_id)
VALUES
  ('2023-06-06', 'Reparación de software', 1000, 1000, 1001),
  ('2023-06-07', 'Reemplazo de batería', 1001, 1001, 1002),
  ('2023-06-08', 'Reparación de conector de carga', 1002, 1002, 1003),
  ('2023-06-09', 'Reparación de placa madre', 1003, 1003, 1004),
  ('2023-06-10', 'Actualización de memoria RAM', 1004, 1004, 1000);

-- Agregar 5 registros a la tabla 'reporte'
INSERT INTO reporte (precio, fecha_entrega, cita)
VALUES
  (60.00, '2023-06-13', 1000),
  (70.00, '2023-06-14', 1001),
  (90.00, '2023-06-15', 1002),
  (80.00, '2023-06-16', 1003),
  (75.00, '2023-06-17', 1004);

INSERT INTO registro_accesorios (fecha_venta, cantidad_v, accesorio_id)
VALUES ('2023-06-20', 3, 1000);
