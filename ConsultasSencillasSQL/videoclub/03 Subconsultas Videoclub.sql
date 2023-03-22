/*
36. Selecciona el Titulo y el Precio de las películas cuyo precio supere al precio medio de
todas las películas.
*/
SELECT p.titulo, p.precio
FROM peliculas AS p
WHERE p.precio >
      (SELECT AVG(peliculas.PRECIO) FROM peliculas);

/*
37. Selecciona el Titulo de las películas que nunca han sido alquiladas.
*/
SELECT p.TITULO
FROM peliculas AS p
WHERE p.CODIGOPELICULA NOT IN
      (SELECT (a.CODIGOPELICULA) FROM alquileres AS a);

/*
38. Selecciona el Titulo de aquellas películas que superen el precio mas bajo de las películas
del género Terror
*/
SELECT p.TITULO
FROM peliculas AS p
WHERE p.PRECIO >
      (SELECT MIN(p2.PRECIO)
       FROM peliculas AS p2,
            generos AS g
       WHERE p2.GENERO = g.CODIGOGENERO
         AND g.NOMBREGENERO = 'Terror');

/*
39. Seleccionar el Titulo de las películas que tengan como inicial una letra diferente a las
iniciales de las películas del género comedia.
*/
SELECT p.TITULO
FROM peliculas AS p
WHERE SUBSTR(p.TITULO, 1, 1) NOT IN
      (SELECT SUBSTR(p2.TITULO, 1, 1)
       FROM peliculas AS p2,
            generos AS g
       WHERE p2.GENERO = g.CODIGOGENERO
         AND g.NOMBREGENERO = 'Comedia');

/*
40. Seleccionar el Título de las películas que contengan las letras ‘el’ o que hayan sido
alquiladas por personas cuyo nombre contenga las letras ‘el’
*/
SELECT p.TITULO
FROM peliculas AS p
WHERE p.TITULO LIKE '%el%'
   OR p.CODIGOPELICULA IN
      (SELECT a.CODIGOPELICULA
       FROM alquileres AS a,
            clientes AS c
       WHERE a.CODIGOCLIENTE = c.CODIGOCLIENTE
         AND c.NOMBRECLIENTE LIKE '%el%');
