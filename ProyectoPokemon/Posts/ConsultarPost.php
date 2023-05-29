<?php
global $conn;
require_once '../../Conn/Connection.php';
?>

<?php
$numero = $_POST['numero'];
$nombre = $_POST['nombre'];
$tipo = $_POST['tipo'];

$consulta = "SELECT * FROM pokemon WHERE numero = '$numero' OR nombre = '$nombre' OR tipo = '$tipo'";
$resultado = $conn->query($consulta);

//mostramos los resultados por pantalla en otra tabla
echo "<link rel='stylesheet' type='text/css' href='Consultar.css'>";
echo "<body>";
echo "<div id='panelConsultar'>";
echo "<div id='header'><p id='parrafito'>Consultar Pokemon</p></div>";
echo "<table id='tablaConsultar'>";
echo "<tr><th>Numero</th><th>Nombre</th><th>Tipo</th><th>Altura</th><th>Peso</th><th>Vida</th><th>Ataque</th><th>Defensa</th></tr>";
while ($fila = $resultado->fetch_assoc()) {
    echo "<tr><td>" . $fila['numero'] . "</td><td>" . $fila['nombre'] . "</td><td>" . $fila['tipo'] . "</td><td>" . $fila['altura'] . "</td><td>" . $fila['peso'] . "</td><td>" . $fila['vida'] . "</td><td>" . $fila['ataque'] . "</td><td>" . $fila['defensa'] . "</td></tr>";
}
echo "</table>";
echo "</div>";
echo "</body>";
