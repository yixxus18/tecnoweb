<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "tecnoweb2";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $correo = $_POST['correo'];
    $contrasena = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE correo = :correo");
    $stmt->bindParam(':correo', $correo);
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $hashedPassword = $row['contraseña'];

        if (password_verify($contrasena, $hashedPassword)) {
            echo "Inicio de sesión exitoso";
            // Redirigir al usuario a la página de inicio
            header("Location: index.php");
            exit();
        } else {
            echo "Contraseña incorrecta";
        }
    } else {
        echo "Correo no encontrado";
    }
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}

$conn = null;
?>
