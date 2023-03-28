-- COMPOSICION INTERNA
/*
Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
*/
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c
         INNER JOIN empleado AS e
                    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE e.puesto = 'Representante Ventas';

-- SIN JOIN
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c,
     empleado AS e
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
  AND e.puesto = 'Representante Ventas';

/*
Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
*/
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c
         INNER JOIN empleado AS e
                    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
         INNER JOIN pago AS p
                    ON c.codigo_cliente = p.codigo_cliente
WHERE e.puesto = 'Representante Ventas';

-- SIN JOIN
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c,
     empleado AS e,
     pago AS p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
  AND c.codigo_cliente = p.codigo_cliente
  AND e.puesto = 'Representante Ventas';

/*
Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
*/
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c
         INNER JOIN empleado AS e
                    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
         LEFT JOIN pago AS p
                   ON c.codigo_cliente = p.codigo_cliente
WHERE e.puesto = 'Representante Ventas'
  AND p.codigo_cliente IS NULL;

-- SIN JOIN
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2
FROM cliente AS c,
     empleado AS e,
     pago AS p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
  AND c.codigo_cliente = p.codigo_cliente
  AND p.codigo_cliente IS NULL;

/*
Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad
de la oficina a la que pertenece el representante.
*/
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c
         INNER JOIN empleado AS e
                    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
         INNER JOIN pago AS p
                    ON c.codigo_cliente = p.codigo_cliente
         INNER JOIN oficina AS o
                    ON e.codigo_oficina = o.codigo_oficina
WHERE e.puesto = 'Representante Ventas';

-- SIN JOIN
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c,
     empleado AS e,
     pago AS p,
     oficina AS o
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
  AND c.codigo_cliente = p.codigo_cliente
  AND e.codigo_oficina = o.codigo_oficina
  AND e.puesto = 'Representante Ventas';

/*
Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la
ciudad de la oficina a la que pertenece el representante.
*/
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c
         INNER JOIN empleado AS e
                    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
         INNER JOIN oficina AS o
                    ON e.codigo_oficina = o.codigo_oficina
         INNER JOIN pago AS p
                    ON c.codigo_cliente = p.codigo_cliente
WHERE e.puesto = 'Representante Ventas'
  AND p.codigo_cliente IS NULL;

-- SIN JOIN
SELECT c.codigo_cliente, c.nombre_cliente, c.ciudad, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c,
     empleado AS e,
     oficina AS o,
     pago AS p
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
  AND e.codigo_oficina = o.codigo_oficina
  AND c.codigo_cliente = p.codigo_cliente
  AND p.codigo_cliente IS NULL;

/*
Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
*/
SELECT o.linea_direccion1, o.linea_direccion2
FROM oficina AS o
         INNER JOIN empleado AS e
                    ON o.codigo_oficina = e.codigo_oficina
         INNER JOIN cliente AS c
                    ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.ciudad = 'Fuenlabrada';

-- SIN JOIN
SELECT o.linea_direccion1, o.linea_direccion2
FROM oficina AS o,
     empleado AS e,
     cliente AS c
WHERE o.codigo_oficina = e.codigo_oficina
  AND e.codigo_empleado = c.codigo_empleado_rep_ventas
  AND c.ciudad = 'Fuenlabrada';

/*
Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que
pertenece el representante.
*/
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c
         INNER JOIN empleado AS e
                    ON c.codigo_empleado_rep_ventas = e.codigo_empleado
         INNER JOIN oficina AS o
                    ON e.codigo_oficina = o.codigo_oficina;

-- SIN JOIN
SELECT c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM cliente AS c,
     empleado AS e,
     oficina AS o
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
  AND e.codigo_oficina = o.codigo_oficina;

/*
Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
*/
SELECT e.nombre, e.apellido1, e.apellido2, j.nombre, j.apellido1, j.apellido2
FROM empleado AS e
         INNER JOIN empleado AS j
                    ON e.codigo_jefe = j.codigo_empleado;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, j.nombre, j.apellido1, j.apellido2
FROM empleado AS e,
     empleado AS j
WHERE e.codigo_jefe = j.codigo_empleado;

/*
Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
*/
SELECT e.nombre, e.apellido1, e.apellido2, j.nombre, j.apellido1, j.apellido2, jj.nombre, jj.apellido1, jj.apellido2
FROM empleado AS e
         INNER JOIN empleado AS j
                    ON e.codigo_jefe = j.codigo_empleado
         INNER JOIN empleado AS jj
                    ON j.codigo_jefe = jj.codigo_empleado;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, j.nombre, j.apellido1, j.apellido2, jj.nombre, jj.apellido1, jj.apellido2
FROM empleado AS e,
     empleado AS j,
     empleado AS jj
WHERE e.codigo_jefe = j.codigo_empleado
    AND j.codigo_jefe = jj.codigo_empleado;

/*
Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
*/
SELECT DISTINCT c.nombre_cliente
FROM cliente AS c
        INNER JOIN pedido AS p
            ON c.codigo_cliente = p.codigo_cliente
WHERE p.fecha_pedido IS NULL
    OR p.fecha_entrega < CURRENT_DATE;

-- SIN JOIN
SELECT DISTINCT c.nombre_cliente
FROM cliente AS c,
     pedido AS p
WHERE c.codigo_cliente = p.codigo_cliente
    AND (p.fecha_pedido IS NULL
        OR p.fecha_entrega < CURRENT_DATE);

/*
Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
*/
SELECT gm.gama
FROM gama_producto AS gm
        INNER JOIN producto AS p
                ON gm.gama = p.gama
        INNER JOIN detalle_pedido AS dp
                ON p.codigo_producto = dp.codigo_producto
        INNER JOIN pedido AS pe
                ON dp.codigo_pedido = pe.codigo_cliente
        INNER JOIN cliente AS c
                ON pe.codigo_cliente = c.codigo_cliente
GROUP BY gm.gama;

-- SIN JOIN
SELECT gm.gama
FROM gama_producto AS gm,
     producto AS p,
     detalle_pedido AS dp,
     pedido AS pe,
     cliente AS c
WHERE gm.gama = p.gama
    AND p.codigo_producto = dp.codigo_producto
    AND dp.codigo_pedido = pe.codigo_cliente
    AND pe.codigo_cliente = c.codigo_cliente
GROUP BY gm.gama;

-- COMPOSICION EXTERNA
/*
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
*/
SELECT c.nombre_cliente
FROM cliente AS c
        LEFT JOIN pago As p
                ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

/*
Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
*/
SELECT c.nombre_cliente
FROM cliente AS c
       LEFT JOIN pedido AS p
                ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

/*
Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
*/
SELECT c.nombre_cliente
FROM cliente AS c
        LEFT JOIN pago AS p
                ON c.codigo_cliente = p.codigo_cliente
        LEFT JOIN pedido AS pe
                ON c.codigo_cliente = pe.codigo_cliente
WHERE p.codigo_cliente IS NULL
    AND pe.codigo_cliente IS NULL;

/*
Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
*/
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado AS e
        LEFT JOIN oficina AS o
                ON e.codigo_oficina = o.codigo_oficina
WHERE o.codigo_oficina IS NULL;

/*
Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
*/
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado AS e
        LEFT JOIN cliente AS c
                ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_empleado_rep_ventas IS NULL;

/*
Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los
datos de la oficina donde trabajan.
*/
SELECT e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM empleado AS e
        LEFT JOIN cliente AS c
                ON e.codigo_empleado = c.codigo_empleado_rep_ventas
        LEFT JOIN oficina AS o
                ON e.codigo_oficina = o.codigo_oficina
WHERE c.codigo_empleado_rep_ventas IS NULL;

/*
Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
*/
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado AS e
        LEFT JOIN oficina AS o
                ON e.codigo_oficina = o.codigo_oficina
        LEFT JOIN cliente AS c
                ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE o.codigo_oficina IS NULL
    AND c.codigo_empleado_rep_ventas IS NULL;

/*
Devuelve un listado de los productos que nunca han aparecido en un pedido.
*/
SELECT p.gama, p.nombre, p.descripcion
FROM producto AS p
      LEFT JOIN detalle_pedido AS dp
                ON p.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL;


/*
Devuelve un listado de los productos que nunca han aparecido en un pedido.
El resultado debe mostrar el nombre, la descripción y la imagen de gama_producto.
*/
SELECT p.gama, p.nombre, p.descripcion, gp.imagen
FROM producto AS p
        LEFT JOIN detalle_pedido AS dp
                ON p.codigo_producto = dp.codigo_producto
        LEFT JOIN gama_producto AS gp
                ON p.gama = gp.gama
WHERE dp.codigo_producto IS NULL;

/*
Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas
de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
*/
SELECT o.ciudad
FROM oficina AS o
        LEFT JOIN empleado AS e
                ON o.codigo_oficina = e.codigo_oficina
        LEFT JOIN cliente AS c
                ON e.codigo_empleado = c.codigo_empleado_rep_ventas
        LEFT JOIN pedido AS pe
                ON c.codigo_cliente = pe.codigo_cliente
        LEFT JOIN detalle_pedido AS dp
                ON pe.codigo_pedido = dp.codigo_pedido
        LEFT JOIN producto AS p
                ON dp.codigo_producto = p.codigo_producto
WHERE p.gama = 'Frutales';

/*
Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
*/
SELECT c.nombre_cliente
FROM cliente AS c
        INNER JOIN pedido AS p
                ON c.codigo_cliente = p.codigo_cliente
        LEFT JOIN pago AS pa
                ON c.codigo_cliente = pa.codigo_cliente
WHERE pa.codigo_cliente IS NULL;

/*
Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e2.nombre AS nombre_jefe, e2.apellido1 AS apellido1_jefe, e2.apellido2 AS apellido2_jefe
FROM empleado AS e
        LEFT JOIN cliente AS c
                ON e.codigo_empleado = c.codigo_empleado_rep_ventas
        LEFT JOIN empleado AS e2
                ON e.codigo_jefe = e2.codigo_empleado
WHERE c.codigo_empleado_rep_ventas IS NULL;
