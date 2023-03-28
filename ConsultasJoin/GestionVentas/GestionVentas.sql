-- COMPOSICIÓN INTERNA
/*
Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado
algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente AS c
         INNER JOIN pedido AS p
                    ON c.id = p.id_cliente
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- SIN JOIN
SELECT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente AS c
WHERE c.id IN (SELECT id_cliente FROM pedido)
ORDER BY c.nombre, c.apellido1, c.apellido2;

/*
Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente.
El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos
de los clientes ordenados alfabéticamente.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total
FROM cliente AS c
         INNER JOIN pedido AS p
                    ON c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- SIN JOIN
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total
FROM cliente AS c,
     pedido AS p
WHERE c.id = p.id_cliente
ORDER BY c.nombre, c.apellido1, c.apellido2;

/*
Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial.
El resultado debe mostrar todos los datos de los pedidos y de los comerciales.
El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total
FROM comercial AS c
         INNER JOIN pedido AS p
                    ON c.id = p.id_comercial
ORDER BY c.nombre, c.apellido1, c.apellido2;

-- SIN JOIN
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total
FROM comercial AS c,
     pedido AS p
WHERE c.id = p.id_comercial
ORDER BY c.nombre, c.apellido1, c.apellido2;

/*
Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
con los datos de los comerciales asociados a cada pedido.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total, co.id, co.nombre, co.apellido1, co.apellido2
FROM cliente AS c
         INNER JOIN pedido AS p
                    ON c.id = p.id_cliente
         INNER JOIN comercial co
                    ON p.id_comercial = co.id;
-- SIN JOIN
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total, co.id, co.nombre, co.apellido1, co.apellido2
FROM cliente AS c,
     pedido AS p,
     comercial AS co
WHERE c.id = p.id_cliente
  AND p.id_comercial = co.id;

/*
Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017,
cuya cantidad esté entre 300 € y 1000 €.
*/
SELECT c.id, c.apellido1, c.apellido2, c.nombre
FROM cliente AS c
         INNER JOIN pedido AS p
                    ON c.id = p.id_cliente
WHERE YEAR(p.fecha) = 2017
  AND p.total BETWEEN 300 AND 1000;

-- SIN JOIN
SELECT c.id, c.apellido1, c.apellido2, c.nombre
FROM cliente AS c,
     pedido AS p
WHERE c.id = p.id_cliente
  AND YEAR(p.fecha) = 2017
  AND p.total BETWEEN 300 AND 1000;

/*
Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado
por María Santana Moreno.
*/
SELECT c.nombre, c.apellido1, c.apellido2
FROM comercial AS c
         INNER JOIN pedido AS p
                    ON c.id = p.id_comercial
         INNER JOIN cliente AS cl
                    ON p.id_cliente = cl.id
WHERE cl.nombre = 'María'
  AND cl.apellido1 = 'Santana'
  AND cl.apellido2 = 'Moreno';

-- SIN JOIN
SELECT c.nombre, c.apellido1, c.apellido2
FROM comercial AS c,
     pedido AS p,
     cliente AS cl
WHERE c.id = p.id_comercial
  AND p.id_cliente = cl.id
  AND cl.nombre = 'María'
  AND cl.apellido1 = 'Santana'
  AND cl.apellido2 = 'Moreno';

/*
Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente AS c
            INNER JOIN pedido AS p
                    ON c.id = p.id_cliente
            INNER JOIN comercial AS co
                    ON p.id_comercial = co.id
WHERE co.nombre = 'Daniel'
    AND co.apellido1 = 'Sáez'
    AND co.apellido2 = 'Vega';

-- SIN JOIN
SELECT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente AS c,
     comercial AS co,
     pedido AS p
WHERE c.id = p.id_cliente
    AND p.id_comercial = co.id
    AND co.nombre = 'Daniel'
    AND co.apellido1 = 'Sáez'
    AND co.apellido2 = 'Vega';

-- COMPOSICION EXTERNA
/*
Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado.
Este listado también debe incluir los clientes que no han realizado ningún pedido.
EL listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total
FROM cliente AS c
            LEFT JOIN pedido AS p
                    ON c.id = p.id_cliente
ORDER BY c.apellido1, c.apellido2, c.nombre;

/*
Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado.
Este listado también debe incluir los comerciales que no han realizado ningún pedido.
El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2, p.id, p.fecha, p.total
FROM comercial AS c
            LEFT JOIN pedido AS p
                    ON c.id = p.id_comercial
ORDER BY c.apellido1, c.apellido2, c.nombre;

/*
Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente AS c
            LEFT JOIN pedido AS p
                    ON c.id = p.id_cliente
WHERE p.id IS NULL;

/*
Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
*/
SELECT co.id, co.nombre, co.apellido1, co.apellido2
FROM comercial AS co
            LEFT JOIN pedido AS p
                    ON co.id = p.id_comercial
WHERE p.id IS NULL;

/*
Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han
participado en ningún pedido. Ordene el listado alfabéticamente por los apellidos y el nombre.
En en listado deberá diferenciar de algún modo los clientes y los comerciales.
*/
SELECT c.id, c.nombre, c.apellido1, c.apellido2, co.id, co.nombre, co.apellido1, co.apellido2
FROM cliente AS c
            LEFT JOIN pedido AS p
                    ON c.id = p.id_cliente
            RIGHT JOIN comercial AS co
                    ON co.id = p.id_comercial
WHERE p.id IS NULL
ORDER BY c.apellido1, c.apellido2, c.nombre, co.apellido1, co.apellido2, co.nombre;

/*
¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
 */
-- NO, porque no se puede hacer un JOIN con una tabla que no tiene una columna en común con la otra tabla.