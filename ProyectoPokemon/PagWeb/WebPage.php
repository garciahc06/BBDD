<?php
require_once '../Conn/Connection.php';
?>

<?php
echo "<link rel='stylesheet' type='text/css' href='EstilosWeb.css'>";
echo "<script src='JsWeb.js'></script>";
?>

<?php
echo "<body>";
echo "<video id='fondoWeb' autoplay muted loop src='Imagenes/videoFondo.mp4'></video>";
echo "<div id='agregarPokemon'>";
echo "<div id='panel'>";
echo "<div id'agregar'>";
echo "<img id='imgAgregar' src='Imagenes/pokeball.png' onclick='agregarPokemon()'>";
echo "<p id='parrafo1'><br>Insertar Pokemon</p>";
echo "</div>";
echo "<div id='consultar'>";
echo "<img id='imgConsultar' src='Imagenes/superball.png' onclick='consultarPokemon()'>";
echo "<p id='parrafo2'><br>Consultar Pokemon</p>";
echo "</div>";
echo "<div id='modificar'>";
echo "<img id='imgModificar' src='Imagenes/ultra1.png' onclick='modificarPokemon()'>";
echo "<p id='parrafo3'><br>Modificar Pokemon</p>";
echo "</div>";
echo "<div id='eliminar'>";
echo "<img id='imgEliminar' src='Imagenes/master1.png' onclick='eliminarPokemon()'>";
echo "<p id='parrafo4'><br>Eliminar Pokemon</p>";
echo "</div>";
echo "</div>";
echo "</div>";
echo "</body>";
?>
