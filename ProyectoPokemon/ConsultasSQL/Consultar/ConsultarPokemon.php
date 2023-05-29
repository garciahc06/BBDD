<?php
global $conn;
require_once '../../Conn/Connection.php';
?>

<?php
echo "<link rel='stylesheet' type='text/css' href='Consultar.css'>";
echo "<body>";
echo "<form action='../../Posts/ConsultarPost.php' method='post'>";
echo "<div id='panelConsultar'>";
echo "<div id='header'><p id='parrafito'>Consultar Pokemon</p></div>";
echo "<table id='tablaConsultar'>";
echo "<tr><td><label>Numero:</label></td><td><input type='number' name='numero' ></td></tr>";
echo "<tr><td><label>Nombre:</label></td><td><input type='text' name='nombre'></td></tr>";
echo "<tr><td><label>Tipo:</label></td><td><select name='pokemon' id='pokemon'><option value='Agua'>Agua</option><<option value='Bicho'>Bicho</option><option value='Dragon'>Dragón</option><option value='Electrico'>Eléctrico</option><option value='Fantasma'>Fantasma</option><option value='Fuego'>Fuego</option><option value='Hielo'>Hielo</option><option value='Lucha'>Lucha</option><option value='Normal'>Normal</option><option value='Planta'>Planta</option><option value='Psiquico'>Psiquico</option><option value='Roca'>Roca</option><option value='Tierra'>Tierra</option><option value='Veneno'>Veneno</option><option value='Volador'>Volador</option></select></td></tr>";
echo "<tr><td><input id='btnConsultar' type='submit' value='Consultar'></td></tr>";
echo "</table>";
echo "</div>";
echo "</form>";


?>

