<?php
require_once '../../Conn/Connection.php';
global $conn;
?>

<?php
//Este es el Post para eliminar un pokemon
$nombre = $_POST['nombre'];

$deleteQuery = "DELETE FROM pokemon WHERE nombre = '$nombre'";
$deleteQueryResult = $conn->query($deleteQuery);

if (!$deleteQueryResult) {
    echo "<script>alert('Error al eliminar el pokemon')</script>";
    exit();
}
else {
    echo "<script>alert('Pokemon eliminado correctamente')</script>";
    echo "<script>window.location.href='../PagWeb/WebPage.php'</script>";
    exit();
}

$conn->close();

?>