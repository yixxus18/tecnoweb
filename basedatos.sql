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
  tipo_cat INT,
  FOREIGN KEY (tipo_cat) REFERENCES categorias (id_cat)
);

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

-- Insertar registros en la tabla 'usuarios'
-- Insertar registros en la tabla 'usuarios'
INSERT INTO usuarios (nombre, apellidos, edad, genero, telefono, correo, contraseña)
VALUES
  ('Juan', 'Perez', 25, 'M', '1234567890', 'juan@example.com', 'contraseña1'),
  ('María', 'Lopez', 30, 'F', '9876543210', 'maria@example.com', 'contraseña2'),
  ('Carlos', 'García', 35, 'M', '4567890123', 'carlos@example.com', 'contraseña3'),
  ('Laura', 'Rodriguez', 28, 'F', '7890123456', 'laura@example.com', 'contraseña4'),
  ('Pedro', 'González', 32, 'M', '3216549870', 'pedro@example.com', 'contraseña5');

-- Insertar registros en la tabla 'dispositivos'
INSERT INTO dispositivos (marca, modelo, tipo_dispositivos)
VALUES
  ('Samsung', 'Galaxy S20', 'celulares'),
  ('Apple', 'iPad Pro', 'tablets'),
  ('Dell', 'XPS 15', 'laptops'),
  ('HP', 'Pavilion', 'laptops'),
  ('Sony', 'PlayStation 5', 'consolas');

-- Insertar registros en la tabla 'reparaciones'
INSERT INTO reparaciones (tipo_reparaciones, descripcion)
VALUES
  ('Reparación de pantalla', 'Reemplazo de la pantalla dañada'),
  ('Cambio de batería', 'Sustitución de la batería agotada'),
  ('Reinstalación del sistema operativo', 'Formateo y reinstalación del sistema operativo'),
  ('Reparación o reemplazo del teclado', 'Arreglo o sustitución del teclado defectuoso'),
  ('Limpieza y mantenimiento', 'Limpieza del sistema de ventilación');

-- Insertar registros en la tabla 'reparacion_dispositivos'
INSERT INTO reparacion_dispositivos (dispositivo_id, reparacion_id)
VALUES
  (1001, 1001),
  (1002, 1002),
  (1003, 1003),
  (1004, 1004);

-- Insertar registros en la tabla 'categorias'
INSERT INTO categorias (tipo)
VALUES
  ('fundas'),
  ('micas'),
  ('cargadores'),
  ('memorias'),
  ('cables'),
  ('audifonos');

-- Insertar registros en la tabla 'accesorios'
INSERT INTO accesorios (nombre, descripcion, tipo_cat)
VALUES
  ('Funda transparente', 'Funda de plástico transparente para protección', 1001),
  ('Mica de vidrio templado', 'Mica protectora de pantalla de vidrio templado', 1002),
  ('Cargador rápido', 'Cargador rápido de 20W para dispositivos móviles', 1003),
  ('Tarjeta de memoria microSD', 'Tarjeta de memoria microSD de 64GB', 1004),
  ('Cable USB tipo C', 'Cable USB tipo C de 2 metros de longitud', 1005);

-- Insertar registros en la tabla 'dispositivos_usuarios'
INSERT INTO dispositivos_usuarios (rep_dis, usuario)
VALUES
  (1000, 1000),
  (1001, 1001),
  (1002, 1002),
  (1003, 1003);

-- Insertar registros en la tabla 'citas'
INSERT INTO citas (fecha_cita, motivo_cita, usuario_reg, dis_id, rep_id)
VALUES
  ('2023-06-01', 'Reparación de pantalla rota', 1000, 1000, 1000),
  ('2023-06-02', 'Cambio de batería agotada', 1001, 1001, 1001),
  ('2023-06-03', 'Reinstalación del sistema operativo', 1002, 1002, 1002),
  ('2023-06-04', 'Reparación del teclado defectuoso', 1003, 1003, 1003),
  ('2023-06-05', 'Limpieza y mantenimiento', 1004, 1004, 1004);

-- Insertar registros en la tabla 'reporte'
INSERT INTO reporte (precio, fecha_entrega, cita)
VALUES
  (50.00, '2023-06-07', 1000),
  (80.00, '2023-06-08', 1001),
  (120.00, '2023-06-09', 1002),
  (90.00, '2023-06-10', 1003),
  (60.00, '2023-06-11', 1004);

