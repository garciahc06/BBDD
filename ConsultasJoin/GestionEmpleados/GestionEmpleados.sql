-- COMPOSICION INTERNA
/*
Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
*/
SELECT e.nombre, e.apellido1, e.apellido2, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e
         INNER JOIN departamento d
                    ON e.id_departamento = d.id;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e, departamento AS d
WHERE e.id_departamento = d.id;

/*
Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético)
y en segundo lugar por los apellidos y el nombre de los empleados.
*/
SELECT e.nombre, e.apellido1, e.apellido2, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e
         INNER JOIN departamento d
                    ON e.id_departamento = d.id
ORDER BY d.nombre, e.apellido1, e.apellido2, e.nombre;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e, departamento AS d
WHERE e.id_departamento = d.id
ORDER BY d.nombre, e.apellido1, e.apellido2, e.nombre;


/*
Devuelve un listado con el identificador y el nombre del departamento,
solamente de aquellos departamentos que tienen empleados.
*/
SELECT d.id, d.nombre
FROM departamento AS d
         INNER JOIN empleado e
                    ON d.id = e.id_departamento
GROUP BY d.id, d.nombre;

-- SIN JOIN
SELECT d.id, d.nombre
FROM departamento AS d, empleado AS e
WHERE d.id = e.id_departamento
GROUP BY d.id, d.nombre;

/*
Devuelve un listado con el identificador, el nombre del departamento y el valor del presupuesto
actual del que dispone, solamente de aquellos departamentos que tienen empleados.
El valor del presupuesto actual lo puede calcular restando al valor del
presupuesto inicial (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
*/
SELECT d.id, d.nombre, d.presupuesto - d.gastos AS presupuesto_actual
FROM departamento AS d
         INNER JOIN empleado e
                    ON d.id = e.id_departamento
GROUP BY d.id, d.nombre, d.presupuesto, d.gastos;

-- SIN JOIN
SELECT d.id, d.nombre, d.presupuesto - d.gastos AS presupuesto_actual
FROM departamento AS d, empleado AS e
WHERE d.id = e.id_departamento
GROUP BY d.id, d.nombre, d.presupuesto, d.gastos;

/*
Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
*/
SELECT d.nombre
FROM departamento AS d
         INNER JOIN empleado AS e
                    ON d.id = e.id_departamento
WHERE e.nif = '38382980M';

-- SIN JOIN
SELECT d.nombre
FROM departamento AS d, empleado AS e
WHERE d.id = e.id_departamento
  AND e.nif = '38382980M';

/*
Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
*/
SELECT d.nombre
FROM departamento AS d
         INNER JOIN empleado AS e
                    ON d.id = e.id_departamento
WHERE e.nombre = 'Pepe'
  AND e.apellido1 = 'Ruiz'
  AND e.apellido2 = 'Santana';

-- SIN JOIN
SELECT d.nombre
FROM departamento AS d, empleado AS e
WHERE d.id = e.id_departamento
  AND e.nombre = 'Pepe'
  AND e.apellido1 = 'Ruiz'
  AND e.apellido2 = 'Santana';


/*
Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D.
Ordena el resultado alfabéticamente.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM empleado AS e
         INNER JOIN departamento AS d
                    ON e.id_departamento = d.id
WHERE d.nombre = 'I+D'
ORDER BY e.apellido1, e.apellido2, e.nombre;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM empleado AS e, departamento AS d
WHERE e.id_departamento = d.id
  AND d.nombre = 'I+D'
ORDER BY e.apellido1, e.apellido2, e.nombre;

/*
Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas,
Contabilidad o I+D. Ordena el resultado alfabéticamente.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre
FROM empleado AS e
         INNER JOIN departamento d
                    ON e.id_departamento = d.id
WHERE d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
ORDER BY e.apellido1, e.apellido2, e.nombre;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre
FROM empleado AS e, departamento AS d
WHERE e.id_departamento = d.id
  AND d.nombre IN ('Sistemas', 'Contabilidad', 'I+D')
ORDER BY e.apellido1, e.apellido2, e.nombre;

/*
Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un
presupuesto entre 100000 y 200000 euros.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto
FROM empleado AS e
         INNER JOIN departamento AS d
                ON e.id_departamento = d.id
WHERE d.presupuesto NOT BETWEEN 100000 AND 200000;

-- SIN JOIN
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto
FROM empleado AS e, departamento AS d
WHERE e.id_departamento = d.id
  AND d.presupuesto NOT BETWEEN 100000 AND 200000;

/*
Devuelve un listado con el nombre de los departamentos donde existe algún empleado cuyo segundo
apellido sea NULL. Tenga en cuenta que no debe mostrar nombres de departamentos que estén repetidos.
 */
SELECT d.nombre
FROM departamento AS d
         INNER JOIN empleado AS e
                    ON d.id = e.id_departamento
WHERE e.apellido2 IS NULL
GROUP BY d.nombre;

-- SIN JOIN
SELECT d.nombre
FROM departamento AS d, empleado AS e
WHERE d.id = e.id_departamento
  AND e.apellido2 IS NULL
GROUP BY d.nombre;

-- COMPOSICION EXTERNA
/*
Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e
          LEFT JOIN departamento AS d
                    ON e.id_departamento = d.id
ORDER BY e.apellido1, e.apellido2, e.nombre;

/*
Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif
FROM empleado AS e
         LEFT JOIN departamento AS d
                    ON e.id_departamento = d.id
WHERE d.id IS NULL
ORDER BY e.apellido1, e.apellido2, e.nombre;

/*
Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
*/
SELECT d.nombre, d.presupuesto, d.gastos
FROM departamento AS d
           LEFT JOIN empleado AS e
                    ON d.id = e.id_departamento
WHERE e.id IS NULL
ORDER BY d.nombre;

/*
Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos
que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e
          LEFT JOIN departamento AS d
                    ON e.id_departamento = d.id
UNION
SELECT e1.nombre, e1.apellido1, e1.apellido2, e1.nif, d1.nombre, d1.presupuesto, d1.gastos
FROM departamento AS d1
          LEFT JOIN empleado AS e1
                    ON d1.id = e1.id_departamento
WHERE e1.id IS NULL
ORDER BY empleados.departamento.nombre;

/*
Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos
que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento
*/
SELECT e.nombre, e.apellido1, e.apellido2, e.nif, d.nombre, d.presupuesto, d.gastos
FROM empleado AS e
            LEFT JOIN departamento AS d
                    ON e.id_departamento = d.id
WHERE d.id IS NULL
UNION
SELECT e1.nombre, e1.apellido1, e1.apellido2, e1.nif, d1.nombre, d1.presupuesto, d1.gastos
FROM departamento AS d1
            LEFT JOIN empleado AS e1
                    ON d1.id = e1.id_departamento
WHERE e1.id IS NULL
ORDER BY empleados.departamento.nombre;