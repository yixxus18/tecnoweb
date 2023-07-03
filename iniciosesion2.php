<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "tecnoweb2";

try {
    $conn = new PDO("mysql:host=localhost;dbname=tecnoweb2", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $edad = $_POST['edad'];
    $genero = $_POST['genero'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE correo = :correo");
    $stmt->bindParam(':correo', $email);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo "El correo electrónico ya está registrado.";
    } else {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        $stmt = $conn->prepare("INSERT INTO usuarios (nombre, apellidos, edad, genero, telefono, correo, contraseña) VALUES (:nombre, :apellido, :edad, :genero, :telefono, :correo, :contrasena)");
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':apellido', $apellido);
        $stmt->bindParam(':edad', $edad);
        $stmt->bindParam(':genero', $genero);
        $stmt->bindParam(':telefono', $telefono);
        $stmt->bindParam(':correo', $email);
        $stmt->bindParam(':contrasena', $hashedPassword);
        $stmt->execute();

        header("Location: index.php");
    }
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}

$conn = null;
?>
