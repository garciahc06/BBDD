-- COMPOSICION INTERNA
/*
Devuelve una lista con el nombre del producto, precio y nombre de
fabricante de todos los productos de la base de datos.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id;

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id;

/*
Devuelve una lista con el nombre del producto, precio y nombre de
fabricante de todos los productos de la base de datos.
Ordene el resultado por el nombre del fabricante, por orden alfabético.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
ORDER BY f.nombre;

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
ORDER BY f.nombre;

/*
Devuelve una lista con el identificador del producto, nombre del producto,
identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
*/
SELECT p.id, p.nombre, f.id AS id_fabricante, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id;

-- SIN JOIN
SELECT p.id, p.nombre, f.id AS id_fabricante, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id;

/*
Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
ORDER BY p.precio
LIMIT 1;


-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
ORDER BY p.precio
LIMIT 1;

/*
Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
ORDER BY p.precio DESC
LIMIT 1;

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
ORDER BY p.precio DESC
LIMIT 1;

/*
Devuelve una lista de todos los productos del fabricante Lenovo.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE f.nombre = 'Lenovo';

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND f.nombre = 'Lenovo';

/*
Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE f.nombre = 'Crucial'
  AND p.precio > 200;

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND f.nombre = 'Crucial'
  AND p.precio > 200;

/*
Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
Sin utilizar el operador IN.
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE f.nombre = 'Asus'
   OR f.nombre = 'Hewlett-Packard'
   OR f.nombre = 'Seagate';

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND (f.nombre = 'Asus'
    OR f.nombre = 'Hewlett-Packard'
    OR f.nombre = 'Seagate');

/*
Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate.
Utilizando el operador IN.
 */
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

/*
Devuelve un listado con el nombre y el precio de todos los productos de los
fabricantes cuyo nombre termine por la vocal e.
 */
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%e';

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE '%e';

/*
Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre
de fabricante contenga el carácter w en su nombre.
 */
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE f.nombre LIKE '%w%';

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND f.nombre LIKE '%w%';

/*
Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
*/
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p
         INNER JOIN fabricante AS f
                    ON p.id_fabricante = f.id
WHERE p.precio >= 180;

-- SIN JOIN
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto AS p,
     fabricante AS f
WHERE p.id_fabricante = f.id
  AND p.precio >= 180;

/*
Devuelve un listado con el identificador y el nombre de fabricante, solamente
de aquellos fabricantes que tienen productos asociados en la base de datos.
 */
SELECT f.id, f.nombre AS fabricante
FROM fabricante AS f
         INNER JOIN producto AS p
                    ON f.id = p.id_fabricante
GROUP BY f.id;

-- SIN JOIN
SELECT f.id, f.nombre AS fabricante
FROM fabricante AS f,
     producto AS p
WHERE f.id = p.id_fabricante
GROUP BY f.id;

-- COMPOSICION EXTERNA
/*
Devuelve un listado de todos los fabricantes que existen en la base de datos,
junto con los productos que tiene cada uno de ellos.
El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
*/
SELECT f.id, f.nombre AS fabricante, p.nombre AS producto
FROM fabricante AS f
         LEFT JOIN producto AS p
                   ON f.id = p.id_fabricante;

/*
Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
*/
SELECT f.id, f.nombre AS fabricante
FROM fabricante AS f
         LEFT JOIN producto AS p
                   ON f.id = p.id_fabricante
WHERE p.id IS NULL;

/*
¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
 */
-- Sí, porque un producto puede no tener fabricante.


