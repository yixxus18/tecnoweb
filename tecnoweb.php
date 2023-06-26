<!DOCTYPE html>
<html>
<head>
  <title>Registro de Usuarios</title>
  <style>
    .container {
      width: 300px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
    }
    .container h2 {
      text-align: center;
    }
    .container input[type="text"],
    .container input[type="password"],
    .container select {
      width: 100%;
      padding: 5px;
      margin-bottom: 10px;
    }
    .container button {
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Registro de Usuarios</h2>
    <form method="get">
      <input type="text" name="nombre" placeholder="Nombre y apellidos" required>
      <input type="text" name="edad" placeholder="Edad" required>
      <select name="genero">
        <option value="Masculino">Masculino</option>
        <option value="Femenino">Femenino</option>
      </select>
      <input type="text" name="telefono" placeholder="Telefono" required>
      <select name="tipo_usuario">
        <option value="administrador">Administrador</option>
        <option value="empleado">Empleado</option>
        <option value="usuario">Usuario</option>
      </select>
      <input type="email" name="correo" placeholder="Correo electrónico" required>
      <input type="password" name="contraseña" placeholder="Contraseña" required>
      <button type="submit" >Registrar</button>
    </form>

  </div>
</body>
</html>




<?php
$pdo = new PDO("mysql:host=localhost;dbname=tecnoweb", 'jesus', '2342');


if (isset($_GET['nombre'])){

  $nombre = $_GET['nombre'];
  $edad = $_GET['edad'];
  $genero = $_GET['genero'];
  $telefono = $_GET['telefono'];
  $tipo = $_GET['tipo_usuario'];
  $correo = $_GET['correo'];
  $contraseña = $_GET['contrseña'];


  $insertar="INSERT INTO usuarios(registro,nombre_apellidos,edad,genero,telefono,tipo_usuarios,correo,contraseña) 
  values(null,'$nombre',$edad,'$genero','$telefono','$tipo','$correo','$contraseña')";

if (mysqli_query($conexion, $insertar)) {
  echo "Datos insertados correctamente";
} else {
  echo "Error al insertar los datos: " . mysqli_error($conexion);
}



}


?>