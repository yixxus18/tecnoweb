create database tecnoweb2;
use tecnoweb2;
CREATE TABLE usuarios (
  registro INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  edad INT,
  genero VARCHAR(20),
  telefono VARCHAR(10),
  tipo_usuario ENUM ('administrador', 'empleado', 'usuario'),
  correo NVARCHAR(50) NOT NULL,
  contraseña VARCHAR(100) NOT NULL
);

ALTER TABLE usuarios AUTO_INCREMENT = 1000;

CREATE TABLE Categorias (
 id_cat INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 tipo ENUM ('fundas', 'micas', 'cargadores', 'memorias', 'cables', 'audifonos')
);

ALTER TABLE Categorias AUTO_INCREMENT = 1000;

CREATE TABLE accesorios_venta (
  id_v INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(200),
  tipo_cat INT,
  FOREIGN KEY (tipo_cat) REFERENCES Categorias (id_cat)
);

ALTER TABLE accesorios_venta AUTO_INCREMENT = 1000;

CREATE TABLE dispositivos (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  capacidad INT,
  tipo_dispositivos ENUM ('celulares', 'tablets', 'laptops', 'computadoras', 'consolas'),
  color VARCHAR(20)
);

CREATE TABLE dispositivos_usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dispositivo_id INT NOT NULL,
  usuario_id INT NOT NULL,
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivos (id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (registro)
);

CREATE TABLE reparaciones (
  id_reparaciones INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  tipo ENUM ('fisica', 'software') NOT NULL,
  tipo_reparaciones VARCHAR(50),
  descripcion NVARCHAR(100)
);

CREATE TABLE cotizacion (
  id_tipor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  dispositivo INT,
  tipo_reparacion INT,
  precio_c DECIMAL(10,2),
  FOREIGN KEY (dispositivo) REFERENCES dispositivos (id),
  FOREIGN KEY (tipo_reparacion) REFERENCES reparaciones (id_reparaciones)
);

CREATE TABLE comentarios (
  id_comentario INT AUTO_INCREMENT PRIMARY KEY,
  descripcion NVARCHAR(200)
);

CREATE TABLE cita (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  usuario_id INT,
  dispositivo_id INT,
  tipo_rep INT,
  precios INT,
  reparacion_dispositivo_id INT,
  FOREIGN KEY (reparacion_dispositivo_id) REFERENCES reparacion_dispositivo (id_rd),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (registro),
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivos_usuarios (id),
  FOREIGN KEY (precios) REFERENCES reparaciones_moda (id_rm),
  FOREIGN KEY (tipo_rep) REFERENCES reparaciones (id_reparaciones)
);

CREATE TABLE reparaciones_moda (
  id_rm INT AUTO_INCREMENT PRIMARY KEY,
  reparacion_id INT NOT NULL,
  dispositivo_id INT NOT NULL,
  precio DECIMAL(10,2),
  FOREIGN KEY (reparacion_id) REFERENCES reparaciones (id_reparaciones),
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivos (id),
  FOREIGN KEY (precio) REFERENCES cotizacion (precio_c)
);

CREATE TABLE reparacion_dispositivo (
  id_rd INT AUTO_INCREMENT PRIMARY KEY,
  dispositivo_id INT NOT NULL,
  reparacion_id INT NOT NULL,
  FOREIGN KEY (dispositivo_id) REFERENCES dispositivos (id),
  FOREIGN KEY (reparacion_id) REFERENCES reparaciones (id_reparaciones)
);
