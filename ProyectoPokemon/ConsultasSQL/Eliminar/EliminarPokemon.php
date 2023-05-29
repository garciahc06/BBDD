<?php
require_once '../../Conn/Connection.php';
?>

<?php
echo "<link rel='stylesheet' type='text/css' href='Eliminar.css'>";
echo "<body>";
echo "<form action='../../Posts/DeletePost.php' method='post'>";
echo "<div id='panelEliminar'>";
echo "<div id='header'><p id='parrafito'>Eliminar Pokemon</p></div>";
echo "<table id='tablaEliminar'>";
echo "<tr><td><label>Nombre:</label></td><td><input type='text' name='nombre' required></td></tr>";
echo "<tr><td><input id='btnEliminar' type='submit' value='Eliminar'></td></tr>";
echo "</table>";

