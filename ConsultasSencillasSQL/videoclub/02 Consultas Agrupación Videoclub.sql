/*
21 Realiza una consulta que nos agrupe las películas por género.
*/
SELECT count(p.TITULO) as total_titulos, g.NOMBREGENERO
FROM Peliculas AS p,
     Generos AS g
WHERE g.CODIGOGENERO = p.GENERO
GROUP BY g.NOMBREGENERO;

/*
22. Realiza una consulta que nos muestre cuantas películas existen de cada género. (Mostrar
como título de columna TOTAL PELICULAS
*/
SELECT count(p.TITULO) AS TOTAL_PELICULAS, g.NOMBREGENERO
FROM Peliculas AS p,
     Generos AS g
WHERE g.CODIGOGENERO = p.GENERO
GROUP BY g.NOMBREGENERO;

/*
23. Realiza una consulta que nos muestre cuantas películas existen de cada género y nos
muestre aquellos que superen 10 películas (Mostrar como título de columna TOTAL
PELICULAS).
*/
SELECT count(p.TITULO) AS TOTAL, g.NOMBREGENERO
FROM Peliculas AS p,
     Generos AS g
WHERE g.CODIGOGENERO = p.GENERO
GROUP BY g.NOMBREGENERO
HAVING TOTAL > 10;

/*
24. Realiza una consulta que nos muestre cuantas películas existen de los géneros INFANTIL
y MUSICAL. (Mostrar como título de columna TOTAL PELICULAS)
*/
SELECT COUNT(p.TITULO) AS TOTAL_PELICULAS, g.NOMBREGENERO
FROM Peliculas AS p,
     Generos AS g
WHERE g.CODIGOGENERO = p.GENERO
  AND g.NOMBREGENERO IN ('INFANTIL', 'MUSICAL')
GROUP BY g.NOMBREGENERO;

/*
25. Realiza una consulta que nos agrupe las películas por fecha de publicación.
*/
SELECT p.FECHAPUBLICACION
FROM Peliculas AS p
GROUP BY p.FECHAPUBLICACION;

/*
26. Realiza una consulta que nos muestre cuantas películas existen de cada fecha de
publicación . (Mostrar como título de columna TOTAL PELICULAS)
*/
SELECT COUNT(p.TITULO) AS TOTAL_PELICULAS, p.FECHAPUBLICACION
FROM Peliculas AS p
GROUP BY p.FECHAPUBLICACION;

/*
27. Realiza una consulta que nos muestre cuantas películas existen de cada fecha de
publicación mostrando sólo aquellas fechas que tengan 1 película. (Mostrar como título de
columna TOTAL PELICULAS)
*/
SELECT COUNT(p.TITULO) AS TOTAL_PELICULAS, p.FECHAPUBLICACION
FROM peliculas AS p
GROUP BY p.FECHAPUBLICACION
HAVING TOTAL_PELICULAS = 1;

/*
28. Realiza una consulta que nos agrupe las películas por genero y fecha de publicación.
*/
SELECT g.NOMBREGENERO, p.FECHAPUBLICACION
FROM peliculas AS p,
     generos AS g
WHERE p.GENERO = g.CODIGOGENERO
GROUP BY g.NOMBREGENERO, p.FECHAPUBLICACION;

/*
29. Realiza una consulta que nos muestre cuantas películas existen de cada género y fecha
de publicación. (Mostrar como título de columna TOTAL PELICULAS
*/
SELECT COUNT(p.TITULO) AS TOTAL_PELICULAS, g.NOMBREGENERO, p.FECHAPUBLICACION
FROM peliculas AS p,
     generos AS g
WHERE p.GENERO = g.CODIGOGENERO
GROUP BY g.NOMBREGENERO, p.FECHAPUBLICACION;

/*
30. Añadir a la consulta anterior, la suma del precio. (Mostrar como título de columna TOTAL)
*/
SELECT COUNT(p.TITULO) AS TOTAL_PELICULAS, g.NOMBREGENERO, p.FECHAPUBLICACION, SUM(p.PRECIO) AS TOTAL
FROM peliculas AS p,
     generos AS g
WHERE p.GENERO = g.CODIGOGENERO
GROUP BY g.NOMBREGENERO, p.FECHAPUBLICACION;

/*
31. Realiza una consulta que nos muestre el sumatorio de los precios de las películas
publicadas en el año 2017 y al lado el sumatorio de los precios con un incremento del 21%
de IVA . (Mostrar como título de columnas TOTAL AÑO 2017 y TOTAL AÑO 2017 con
IVA)
*/
SELECT SUM(p.PRECIO) AS TOTAL_AÑO_2017, SUM(p.PRECIO * 0.21) AS TOTAL_AÑO_2017_CON_IVA
FROM peliculas AS p
WHERE p.FECHAPUBLICACION BETWEEN '2017-01-01' AND '2017-12-31';

/*
32. Realiza una consulta que nos muestre por cada fecha de publicación, el promedio de los
precios de las películas. (Mostrar como título de columna PROMEDIO
*/
SELECT AVG(p.PRECIO) AS PROMEDIO, p.FECHAPUBLICACION
FROM peliculas AS p
GROUP BY p.FECHAPUBLICACION;

/*
33. Realiza una consulta que nos muestre de cada tipo de película la primera y la última fecha
de publicación.
*/
SELECT MIN(p.FECHAPUBLICACION) AS PRIMERA_FECHA, MAX(p.FECHAPUBLICACION) AS ULTIMA_FECHA, p.TIPOPELICULA
FROM peliculas AS p
GROUP BY p.TIPOPELICULA;

/*
34. Realiza una consulta que nos muestre por cada género, el precio más barato, el precio
más caro y el promedio de precios de las películas
*/
SELECT MIN(p.PRECIO) AS PRECIO_MÁS_BARATO, MAX(p.PRECIO) AS PRECIO_MÁS_CARO, AVG(p.PRECIO) AS PROMEDIO, g.NOMBREGENERO
FROM peliculas AS p,
     generos AS g
WHERE p.GENERO = g.CODIGOGENERO
GROUP BY g.NOMBREGENERO;
