<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "tecnoweb2";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$database", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $conn->prepare("SELECT tipo FROM categorias");
    $stmt->execute();
    $categorias = $stmt->fetchAll(PDO::FETCH_COLUMN);

} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}

$conn = null;
?>

<form action="catalogo.php" method="post">
    <label for="categoria">Categoria:</label>
    <select name="categorias" id="categoria" style="width: 100px;">
        <?php foreach ($categorias as $categoria): ?>
            <option value="<?php echo $categoria; ?>"><?php echo $categoria; ?></option>
        <?php endforeach; ?>
    </select>
    <br>
    <br>
    <input type="submit" value="Enviar">
</form>
