start transaction;
savepoint inicio;

/*
Borrar todos los registros de clientes que residan fuera de Zaragoza.
*/
DELETE
FROM clientes
WHERE CIUDAD <> 'Zaragoza';

/*
42. Borrar todos los registros de Peliculas cuyo precio sea inferior a 15 €.
*/
DELETE
FROM peliculas
WHERE PRECIO < 15;


/*
43. Borrar todos los registros de películas que empiecen por H.
*/
DELETE
FROM peliculas
WHERE TITULO LIKE 'H%';

/*
44. Borrar todos los registros de películas cuya modalidad sea ESTRENO
*/
DELETE p
FROM peliculas AS p,
     tipopeliculas as tp
WHERE p.TIPOPELICULA = tp.CODIGOENTREGA
  AND tp.MODALIDAD = 'ESTRENO';

/*
45. Borrar todos los registros de películas del género de TERROR
*/
DELETE p
FROM peliculas AS p,
     generos AS g
WHERE p.GENERO = g.CODIGOGENERO
  AND g.NOMBREGENERO = 'Terror';

/*
46. Borrar todos los registros de películas cuyo género sea AVENTURAS y hayan sido
adquiridas en el año 98
*/
DELETE p
FROM peliculas AS p,
     generos AS g,
     alquileres AS a
WHERE p.GENERO = g.CODIGOGENERO
  AND g.NOMBREGENERO = 'Aventuras'
  AND p.CODIGOPELICULA = a.CODIGOPELICULA
  AND YEAR(a.FECHADESCARGA) = '1998';


/*
47. Añadir un registro nuevo en Generos cuyo numero sea 14 y se denomine
DOCUMENTAL
*/
INSERT INTO generos
VALUES (14, 'Documental');
rollback to inicio;

/*
48. Añadir un registro nuevo en la tabla de clientes cuya información corresponda a
vuestros datos personales.
*/
INSERT INTO clientes (CODIGOCLIENTE, NOMBRECLIENTE, APELLIDO1CLIENTE, APELLIDO2CLIENTE, DNI, DIRECCION, CIUDAD, codigopostal, PROVINCIA, TELEFONO, FECHALTA, OBSERVACIONES)
VALUES (21, 'Andres', 'Garcia', 'Miguel', '25209139N', 'DecimoOctava', 'Zaragoza', '50005', 'Zaragoza', '976 306 878', '2017-11-21', '');
rollback to inicio;

/*
49. Crear una tabla vacía (llamada CopiaGeneros) con los mismos campos de la tabla de
Generos. Traspasar toda la información de Generos a CopiaGeneros.
*/
CREATE TABLE CopiaGeneros
SELECT *
FROM generos;
rollback to inicio;

/*
50. Eliminar los registros de la tabla de CopiaGeneros cuyo nombre comience por C
*/
DELETE
FROM CopiaGeneros
WHERE NOMBREGENERO LIKE 'C%';
rollback to inicio;

/*
51. Añadir a la tabla CopiaGeneros los registros de Generos cuyo nombre comience por C
*/
INSERT INTO CopiaGeneros
SELECT *
FROM generos
WHERE NOMBREGENERO LIKE 'C%';
rollback to inicio;

/*
52. Crear una tabla vacía (llamada Infantiles) con los mismos campos de la tabla de
Peliculas. Traspasar todos los registros de la tabla Peliculas a la tabla Infantiles, que
tengan como genero Infantil, Aventuras, Ciencia-ficción
*/
CREATE TABLE Infantiles
SELECT *
FROM peliculas
WHERE GENERO IN (SELECT CODIGOGENERO
                  FROM generos
                  WHERE NOMBREGENERO IN ('Infantil', 'Aventuras', 'Ciencia-ficción'));
rollback to inicio;

/*
53. Dividir la tabla de clientes en dos tablas llamadas Capital y Provincias con la misma
estructura, en la primera guardaremos todos los registros de clientes que sean de
Zaragoza y en Provincias el resto.
*/
CREATE TABLE Capital
SELECT *
FROM clientes
WHERE CIUDAD = 'Zaragoza';

/*
54. Modificar el campo de Codigo Postal de la tabla de clientes para que a todos les
aparezca 50900 C/ MARÍA AUXILIADORA 57 | 50009 ZARAGOZA | T 976 306 878 | HTTP://ZARAGOZA.SALESIANOS.EDU
*/
UPDATE clientes
SET CODIGOPOSTAL = '50900 C/ MARÍA AUXILIADORA 57 | 50009 ZARAGOZA | T 976 306 878 | HTTP://ZARAGOZA.SALESIANOS.EDU';
rollback to inicio;

/*
55. Modificar el campo de Observaciones de la tabla de clientes para que a todos les
ponga un CODIGO formado por 3 caracteres de la izda del nombre + los 2
ultimos del 2 apellido+ 3 digitos centrales del telefono
*/
UPDATE clientes
SET OBSERVACIONES = CONCAT(LEFT(NOMBRECLIENTE, 3), RIGHT(APELLIDO2CLIENTE, 2), SUBSTRING(TELEFONO, 5, 3));
rollback to inicio;

/*
56. Modificar el campo de Observaciones de la tabla de clientes para que a todos los que
se dieron de alta en el mes de Abril del 99 les aparezca el mensaje de BONIFICADO
*/
UPDATE clientes
SET OBSERVACIONES = 'BONIFICADO'
WHERE MONTH(FECHALTA) = 4
  AND YEAR(FECHALTA) = 1999;
rollback to inicio;

/*
57. Modificar el campo de Ciudad de la tabla de clientes para que todos los que residan
en Zaragoza les aparezca la ciudad en mayúsculas.
*/
UPDATE clientes
SET CIUDAD = UPPER(CIUDAD)
WHERE CIUDAD = 'Zaragoza';

/*
58. Modificar el título de películas para que en todas que empiecen por R les aparezca -----
*/
UPDATE peliculas
SET TITULO = REPLACE(TITULO, 'R', '-----');
rollback to inicio;

/*
59. Incrementar el precio de cada película un cinco por ciento.
*/
UPDATE peliculas
SET PRECIO = PRECIO * 1.05;
rollback to inicio;

/*
60. Acentuar el apellido de López en la tabla de Clientes.
*/
UPDATE clientes
SET APELLIDO1CLIENTE = REPLACE(APELLIDO1CLIENTE, 'Lopez', 'López');
rollback to inicio;
