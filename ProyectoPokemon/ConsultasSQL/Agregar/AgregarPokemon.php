<?php
require_once '../../Conn/Connection.php';
?>

<?php
echo "<link rel='stylesheet' type='text/css' href='Agregar.css'>";

echo "<body>";
echo "<form action='../../Posts/AddPost.php' method='post'>";
echo "<div id='panelAgregar'>";
echo "<div id='header'><p id='parrafito'>Agregar Pokemon</p></div>";
echo "<table id='tablaAgregar'>";
echo "<tr><td><label>Numero:</label></td><td><input type='number' name='numero' required></td></tr>";
echo "<tr><td><label>Nombre:</label></td><td><input type='text' name='nombre' required></td></tr>";
echo "<tr><td><label>Tipo:</label></td><td><input type='text' name='tipo' required></td></tr>";
echo "<tr><td><label>Altura:</label></td><td><input type='number' name='altura' required></td></tr>";
echo "<tr><td><label>Peso:</label></td><td><input type='number' name='peso' required></td></tr>";
echo "<tr><td><label>Vida:</label></td><td><input type='number' name='vida' required></td></tr>";
echo "<tr><td><label>Ataque:</label></td><td><input type='number' name='ataque' required></td></tr>";
echo "<tr><td><label>Defensa:</label></td><td><input type='number' name='defensa' required></td></tr>";
echo "<tr><td><input id='btnAgregar' type='submit' value='Agregar'></td></tr>";
echo "</table>";
echo "</div>";
echo "</form>";
echo "</body>";

?>
