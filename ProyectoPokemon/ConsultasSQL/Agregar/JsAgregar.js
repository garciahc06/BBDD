/*Funcion en la que si el número pokedex es igual a otro que se encuentra en la base de datos, sale un mensaje de error */
function validarPokedex() {
    var pokedex = document.getElementById("pokedex").value;
    var pokedex2 = document.getElementById("pokedex2").value;
    if (pokedex == pokedex2) {
        alert("El número pokedex ya existe");
        return false;
    }
}