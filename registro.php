<?php

require_once"conexion.php";
  
    $nombre = $_POST['nombre'];
    $edad = $_POST['edad'];
    $genero = $_POST['genero'];
    $telefono = $_POST['telefono'];
    $usuario = $_POST['tipo_usuario'];
    $correo = $_POST['correo'];
    $contraseña = $_POST['contraseña'];  

    $insertar = $con->prepare("INSERT INTO usuarios (nombre_apellidos, edad, genero, telefono, tipo_usuario, correo, contraseña) VALUES (:nombre, :edad, :genero, :telefono, :tipo_usuario, :correo, :contraseña)");

    $insertar->bindParam(':nombre', $nombre);
    $insertar->bindParam(':edad', $edad);
    $insertar->bindParam(':genero', $genero);
    $insertar->bindParam(':telefono', $telefono);
    $insertar->bindParam(':tipo_usuario', $usuario);
    $insertar->bindParam(':correo', $correo);
    $insertar->bindParam(':contraseña', $contraseña);

    $insertar->execute();

    if($insertar->execute()){
      echo "Datos guardados";
    }
    else{
      echo "No se pudo";
    }
    
?>
