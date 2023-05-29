<?php
global $conn;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_once '../../Conn/Connection.php';

    $numero = $_POST['numero'];
    $nombre = $_POST['nombre'];
    $tipo = $_POST['tipo'];
    $altura = $_POST['altura'];
    $peso = $_POST['peso'];
    $vida = $_POST['vida'];
    $ataque = $_POST['ataque'];
    $defensa = $_POST['defensa'];

    $query = "INSERT INTO pokemon (numero, nombre, tipo, altura, peso, vida, ataque, defensa) 
              VALUES ('$numero', '$nombre', '$tipo', '$altura', '$peso', '$vida', '$ataque', '$defensa')";

    if (mysqli_query($conn, $query)) {
        echo "Pokémon agregado exitosamente.";
    } else {
        echo "Error al agregar el Pokémon: " . mysqli_error($conn);
    }

    // Cierra la conexión a la base de datos
    mysqli_close($conn);
}
?>
