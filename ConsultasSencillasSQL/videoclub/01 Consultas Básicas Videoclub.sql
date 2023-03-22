/*
1. Realiza una consulta que nos muestre los campos Título, FECHAPUBLICACION de todas las
películas, ordenado descendentemente por el Título.
*/
SELECT peliculas.TITULO,
       peliculas.FECHAPUBLICACION
FROM peliculas
ORDER BY TITULO DESC;

/*
2. Realiza una consulta que nos muestre los campos Título, FECHAPUBLICACION y Género de
todas las películas, ordenando ascendentemente por FECHAPUBLICACION y
descendentemente por Género.
*/
SELECT peliculas.TITULO,
       peliculas.FECHAPUBLICACION,
       peliculas.GENERO
FROM peliculas
ORDER BY peliculas.GENERO DESC,
         peliculas.FECHAPUBLICACION;

/*
3. Realiza una consulta que nos muestre los campos Título, FECHAPUBLICACION, Género y
Tipo de todas las películas, ordenando ascendentemente por Tipo y Título.
*/
SELECT peliculas.TITULO,
       peliculas.FECHAPUBLICACION,
       peliculas.GENERO,
       peliculas.TIPOPELICULA
FROM peliculas
ORDER BY peliculas.TIPOPELICULA,
         peliculas.TITULO;

/*
4. Realiza una consulta que nos muestre el Título y Género de las 7 últimas películas (en orden
alfabético) del género Comedia.
*/
SELECT peliculas.TITULO, generos.NOMBREGENERO
FROM generos,
     peliculas
WHERE  generos.CODIGOGENERO = peliculas.GENERO
 AND   generos.NOMBREGENERO = 'Comedia'
ORDER BY peliculas.TITULO DESC
LIMIT 7;

/*
5. Realiza una consulta que nos muestre todos los campos de las películas cuyo género sea
Drama o Comedia, ordenadas por genero.
*/
SELECT peliculas.TITULO, generos.NOMBREGENERO
FROM peliculas,
     generos
WHERE peliculas.GENERO = generos.CODIGOGENERO
  AND generos.NOMBREGENERO in ('Drama', 'Comedia')
ORDER BY peliculas.GENERO;

/*
6. Realiza una consulta que nos muestre todos los campos de las películas cuyo precio esté
entre 15 y 16, ordenadas por título.
*/
SELECT peliculas.*
FROM peliculas
WHERE peliculas.PRECIO BETWEEN 15 AND 16
ORDER BY peliculas.TITULO;

/*
7. Realiza una consulta que nos muestre todos los campos de las películas PUBLICADAS en el
año 2017.
*/
SELECT peliculas.*
FROM peliculas
WHERE year(peliculas.FECHAPUBLICACION) = 2017;

/*
8. Realiza una consulta que nos muestre todos los campos de las películas PUBLICADAS en el
mes de marzo del año 2017.
*/
SELECT peliculas.*
FROM peliculas
WHERE year(peliculas.FECHAPUBLICACION) = 2017
  AND month(peliculas.FECHAPUBLICACION) = 03;

/*
9. Realiza una consulta que nos muestre el Título de la película y al lado una columna donde
aparezca &#39;Para niños&#39; si el género es INFANTIL, o que aparezca &#39;Para adultos&#39; en caso
contrario. (El título de la nueva columna se llamará RECOMENDADA).
*/
SELECT peliculas.TITULO,
       if(generos.NOMBREGENERO = 'Comedia', 'Para niños', 'Para adultos') AS RECOMENDADA
FROM peliculas,
     generos
WHERE peliculas.GENERO = generos.CODIGOGENERO;

/*
10. Realiza una consulta que nos muestre los Títulos de películas que empiezan por M o P.
*/
SELECT peliculas.TITULO
FROM peliculas
WHERE peliculas.TITULO LIKE 'M%'
   OR peliculas.TITULO LIKE 'P%';

/*
11. Realiza una consulta que nos muestre los Títulos de películas que acaben en la letra S.
*/
SELECT peliculas.TITULO
FROM peliculas
WHERE peliculas.TITULO LIKE '%S';

/*
12. Realiza una consulta que nos muestre los Títulos de películas que contengan la palabra
AMOR.
*/
SELECT peliculas.TITULO
FROM peliculas
WHERE peliculas.TITULO LIKE '%AMOR%';

/*
13. Realiza una consulta que nos muestre los Títulos y Géneros de películas que tengan 4
caracteres en su título.
*/
SELECT peliculas.TITULO,
       generos.NOMBREGENERO
FROM peliculas,
     generos
WHERE peliculas.GENERO = generos.CODIGOGENERO
  AND length(peliculas.TITULO) = 4;

/*
14. Realiza una consulta que nos muestre los Títulos y Géneros de películas que tengan 4
caracteres en su título y sean de género Acción.
*/
SELECT peliculas.TITULO,
       generos.NOMBREGENERO
FROM peliculas,
     generos
WHERE peliculas.GENERO = generos.CODIGOGENERO
  AND length(peliculas.TITULO) = 4
  AND generos.NOMBREGENERO = 'ACCION';

/*
15. Realiza una consulta que nos muestre los Títulos de películas que tengan por lo menos un
carácter numérico.
*/
SELECT peliculas.TITULO
FROM peliculas
WHERE peliculas.TITULO REGEXP '[0-9]';

/*
16. Realiza una consulta que nos muestre los Títulos y la fecha de publicación de las películas
que empiezan por alguno de los siguientes caracteres: C,D,E,F,G,H.
*/
SELECT peliculas.TITULO,
       peliculas.FECHAPUBLICACION
FROM peliculas
WHERE peliculas.TITULO REGEXP '^[C-H]';

/*
17. Realiza una consulta que nos muestre los Títulos y la fecha de publicación de las películas
que empiezan por alguno de los siguientes caracteres: C,D,E,F,G,H,P,Q,R,S,T,U,V.
*/
SELECT peliculas.TITULO,
       peliculas.FECHAPUBLICACION
FROM peliculas
WHERE peliculas.TITULO REGEXP '^[C-HP-V]';

/*
18. Realiza una consulta que nos muestre los Títulos y la fecha de publicación de las películas
que no terminen por alguno de los siguientes caracteres: I,J,K,L,M,N,O,P
*/
SELECT peliculas.TITULO,
       peliculas.FECHAPUBLICACION
FROM peliculas
WHERE peliculas.TITULO NOT REGEXP '[I-P]$';

/*
19. Realiza una consulta que muestre los Títulos de películas que no contengan la letra a.
*/
SELECT peliculas.TITULO
FROM peliculas
WHERE peliculas.TITULO NOT LIKE '%a%';

/*
20. Realiza una consulta que nos muestre los Títulos y el género de las películas cuyo género sea
TERROR, COMEDIA, INFANTIL ordenadas ascendentemente por el título.
*/
SELECT peliculas.TITULO,
       generos.NOMBREGENERO
FROM peliculas,
     generos
WHERE peliculas.GENERO = generos.CODIGOGENERO
 AND (generos.NOMBREGENERO IN ('Terror', 'Infantil', 'Comedia'))
ORDER BY peliculas.TITULO ASC;
