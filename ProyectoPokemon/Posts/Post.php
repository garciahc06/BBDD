<?php
require_once '../Conn/Connection.php';
global $conn;

// Obtener los datos del formulario
$name = $_POST['name'];
$email = $_POST['email'];

// Verificar si ya existe un registro con el mismo correo
$existingQuery = "SELECT * FROM Usuario WHERE Correo = '$email'";
$existingResult = $conn->query($existingQuery);

if (!$existingResult->num_rows > 0) { // Insertar el nuevo registro
    $insertQuery = "INSERT INTO Usuario (Nombre, Correo) VALUES ('$name', '$email')";
    $conn->query($insertQuery);
}
else {
    $updateQuery = "UPDATE Usuario SET Nombre = '$name' WHERE Correo = '$email'";
    $conn->query($updateQuery);
}

// Cerrar conexión
$conn->close();

// Redireccionar al usuario a la página principal
header("Location: ../PagWeb/WebPage.php");
exit();
?>
