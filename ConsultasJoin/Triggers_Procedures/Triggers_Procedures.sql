/*
1. Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla.
*/
SELECT *
FROM information_schema.statistics
WHERE table_name = 'producto';

/*
2. Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará
menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?.
SELECT *
FROM producto
WHERE codigo_producto = 'OR-114';
SELECT *
FROM producto
WHERE nombre = 'Evonimus Pulchellus';
*/
EXPLAIN
SELECT *
FROM producto
WHERE codigo_producto = 'OR-114';
EXPLAIN
SELECT *
FROM producto
WHERE nombre = 'Evonimus Pulchellus';

/*Expliación:
La primera consulta realiza 1 comparación, ya que el campo codigo_producto es clave primaria y por lo tanto es un campo indexado.
La segunda consulta realiza 3 comparaciones, ya que el campo nombre no es clave primaria y por lo tanto no es un campo indexado.
*/

/*
3. Suponga que estamos trabajando con la base de datos jardineria y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
SELECT AVG(total)
FROM pago
WHERE YEAR(fecha_pago) = 2008;
SELECT AVG(total)
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';
*/
EXPLAIN
SELECT AVG(total)
FROM pago
WHERE YEAR(fecha_pago) = 2008;
EXPLAIN
SELECT AVG(total)
FROM pago
WHERE fecha_pago >= '2008-01-01'
  AND fecha_pago <= '2008-12-31';

/*Expliación:
La primera consulta realiza 1 comparación, ya que el campo fecha_pago no es clave primaria y por lo tanto no es un campo indexado.
La segunda consulta realiza 2 comparaciones, ya que el campo fecha_pago no es clave primaria y por lo tanto no es un campo indexado.
*/

/*
4. Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE 'A%';
*/
EXPLAIN
SELECT *
FROM cliente
         INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE 'A%';

/*
5. ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices?
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A%';
SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A';
*/
EXPLAIN
SELECT *
FROM cliente
         INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A%';
EXPLAIN
SELECT *
FROM cliente
         INNER JOIN pedido ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A';
/*
Expliación:
En ambos casos, el campo nombre_cliente no es clave primaria y por lo tanto no es un campo indexado.
*/

/*
Crea un índice de tipo FULLTEXT sobre las columnas nombre y descripcion de la tabla producto.
*/
ALTER TABLE producto
    ADD FULLTEXT (nombre, descripcion);

/*
7. Una vez creado el índice del ejercicio anterior realiza las siguientes consultas haciendo uso de la función MATCH, para buscar todos los productos que:
Contienen la palabra planta en el nombre o en la descripción. Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL
(IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta' WITH QUERY EXPANSION);

/*
Contienen la palabra planta seguida de cualquier carácter o conjunto de caracteres, en el nombre o en la descripción.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta*' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta*' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta*' WITH QUERY EXPANSION);

/*
Empiezan con la palabra planta en el nombre o en la descripción.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta*' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta*' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('planta*' WITH QUERY EXPANSION);

/*
Contienen la palabra tronco o la palabra árbol en el nombre o en la descripción.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco árbol' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco árbol' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco árbol' WITH QUERY EXPANSION);

/*
Contienen la palabra tronco y la palabra árbol en el nombre o en la descripción.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco + árbol' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco + árbol' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco + árbol' WITH QUERY EXPANSION);

/*
Contienen la palabra tronco pero no contienen la palabra árbol en el nombre o en la descripción.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco - árbol' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco - árbol' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('tronco - árbol' WITH QUERY EXPANSION);

/*
Contiene la frase proviene de las costas en el nombre o en la descripción.
*/
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('"proviene de las costas"' IN NATURAL LANGUAGE MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('"proviene de las costas"' IN BOOLEAN MODE);
SELECT *
FROM producto
WHERE MATCH (nombre, descripcion) AGAINST ('"proviene de las costas"' WITH QUERY EXPANSION);

/*
Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre_contacto de la tabla cliente.
*/
ALTER TABLE cliente
    ADD INDEX (apellido_contacto, nombre_contacto);

/*
Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN:
*/
EXPLAIN
SELECT *
FROM cliente
WHERE apellido_contacto = 'Villar'
  AND nombre_contacto = 'Javier';
EXPLAIN
SELECT *
FROM cliente
WHERE apellido_contacto = 'Villar';
EXPLAIN
SELECT *
FROM cliente
WHERE nombre_contacto = 'Javier';

/*
Busca el cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?
*/
EXPLAIN
SELECT *
FROM cliente
WHERE apellido_contacto = 'Villar'
  AND nombre_contacto = 'Javier';

/*
Busca el ciente anterior utilizando solamente el apellido Villar. ¿Cuántas filas se han examinado
hasta encontrar el resultado?
*/
EXPLAIN
SELECT *
FROM cliente
WHERE apellido_contacto = 'Villar';
/*
Explicación:
Se han examinado 1 fila, ya que el apellido es un campo indexado.
*/

/*
Busca el ciente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado
hasta encontrar el resultado? ¿Qué ha ocurrido en este caso?
*/
EXPLAIN
SELECT *
FROM cliente
WHERE nombre_contacto = 'Javier';
/*
Explicación:
Se han examinado 1 fila, ya que el nombre es un campo indexado.
*/

/*
Calcula cuál podría ser un buen valor para crear un índice sobre un prefijo de la columna nombre_cliente
de la tabla cliente. Tenga en cuenta que un buen valor será aquel que nos permita utilizar el menor número
de caracteres para diferenciar todos los valores que existen en la columna sobre la que estamos creando el índice.
*/
SELECT COUNT(DISTINCT nombre_cliente)
FROM cliente;

/*
En primer lugar calculamos cuántos valores distintos existen en la columna nombre_cliente. Necesitarás utilizar
la función COUNT y DISTINCT.
*/
SELECT COUNT(DISTINCT LEFT(nombre_cliente, 1))
FROM cliente;

/*
Haciendo uso de la función LEFT ve calculando el número de caracteres que necesitas utilizar como prefijo
para diferenciar todos los valores de la columna. Necesitarás la función COUNT, DISTINCT y LEFT.
*/
SELECT COUNT(DISTINCT LEFT(nombre_cliente, 2))
FROM cliente;
/*
Una vez que hayas encontrado el valor adecuado para el prefijo, crea el índice sobre la columna nombre_cliente de la tabla cliente.
Ejecuta algunas consultas de prueba sobre el índice que acabas de crear.
*/
ALTER TABLE cliente
    ADD INDEX (nombre_cliente(2));

/*
Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.
*/
DELIMITER //
CREATE PROCEDURE holaMundo()
BEGIN
    SELECT '¡Hola mundo!';
END //
DELIMITER ;

/*
Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el
número es positivo, negativo o cero.
*/
DELIMITER //
CREATE PROCEDURE positivoNegativo(IN numero REAL)
BEGIN
    IF numero > 0 THEN
        SELECT 'El número es positivo';
    ELSEIF numero < 0 THEN
        SELECT 'El número es negativo';
    ELSE
        SELECT 'El número es cero';
    END IF;
END //

/*
Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada,
con el valor un número real, y un parámetro de salida, con una cadena de caracteres indicando si el
número es positivo, negativo o cero.*/
DELIMITER //
CREATE PROCEDURE positivoNegativo(IN numero REAL, OUT resultado VARCHAR(20))
BEGIN
    IF numero > 0 THEN
        SET resultado = 'El número es positivo';
    ELSEIF numero < 0 THEN
        SET resultado = 'El número es negativo';
    ELSE
        SET resultado = 'El número es cero';
    END IF;
end //

/*
Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno,
y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
[0,5) = Insuficiente
[5,6) = Aprobado
[6, 7) = Bien
[7, 9) = Notable
[9, 10] = Sobresaliente
En cualquier otro caso la nota no será válida.
*/
DELIMITER //
CREATE PROCEDURE nota(IN nota REAL)
BEGIN
    IF nota >= 0 AND nota < 5 THEN
        SELECT 'Insuficiente';
    ELSEIF nota >= 5 AND nota < 6 THEN
        SELECT 'Aprobado';
    ELSEIF nota >= 6 AND nota < 7 THEN
        SELECT 'Bien';
    ELSEIF nota >= 7 AND nota < 9 THEN
        SELECT 'Notable';
    ELSEIF nota >= 9 AND nota <= 10 THEN
        SELECT 'Sobresaliente';
    ELSE
        SELECT 'Nota no válida';
    END IF;
end //

/*
Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada,
con el valor de la nota en formato numérico y un parámetro de salida, con una cadena de texto
indicando la nota correspondiente.
*/
DELIMITER //
CREATE PROCEDURE nota(IN nota REAL, OUT resultado VARCHAR(20))
BEGIN
    IF nota >= 0 AND nota < 5 THEN
        SET resultado = 'Insuficiente';
    ELSEIF nota >= 5 AND nota < 6 THEN
        SET resultado = 'Aprobado';
    ELSEIF nota >= 6 AND nota < 7 THEN
        SET resultado = 'Bien';
    ELSEIF nota >= 7 AND nota < 9 THEN
        SET resultado = 'Notable';
    ELSEIF nota >= 9 AND nota <= 10 THEN
        SET resultado = 'Sobresaliente';
    ELSE
        SET resultado = 'Nota no válida';
    END IF;

END //

/*
Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
*/
DELIMITER //
CREATE PROCEDURE nota(IN nota REAL, OUT resultado VARCHAR(20))
BEGIN
    CASE
        WHEN nota >= 0 AND nota < 5 THEN SET resultado = 'Insuficiente';
        WHEN nota >= 5 AND nota < 6 THEN SET resultado = 'Aprobado';
        WHEN nota >= 6 AND nota < 7 THEN SET resultado = 'Bien';
        WHEN nota >= 7 AND nota < 9 THEN SET resultado = 'Notable';
        WHEN nota >= 9 AND nota <= 10 THEN SET resultado = 'Sobresaliente';
        ELSE SET resultado = 'Nota no válida';
        END CASE;
END //

/*
Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente un día
de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente.
Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes. Resuelva el procedimiento haciendo
uso de la estructura de control IF.
*/
DELIMITER //
CREATE PROCEDURE diaSemana(IN dia INT, OUT resultado VARCHAR(20))
BEGIN
    IF dia = 1 THEN
        SET resultado = 'Lunes';
    ELSEIF dia = 2 THEN
        SET resultado = 'Martes';
    ELSEIF dia = 3 THEN
        SET resultado = 'Miercoles';
    ELSEIF dia = 4 THEN
        SET resultado = 'Jueves';
    ELSEIF dia = 5 THEN
        SET resultado = 'Viernes';
    ELSEIF dia = 6 THEN
        SET resultado = 'Sabado';
    ELSEIF dia = 7 THEN
        SET resultado = 'Domingo';
    END IF;
end //

/*
Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.
*/
DELIMITER //
CREATE PROCEDURE diaSemana(IN dia INT, OUT resultado VARCHAR(20))
BEGIN
    CASE
        WHEN dia = 1 THEN SET resultado = 'Lunes';
        WHEN dia = 2 THEN SET resultado = 'Martes';
        WHEN dia = 3 THEN SET resultado = 'Miercoles';
        WHEN dia = 4 THEN SET resultado = 'Jueves';
        WHEN dia = 5 THEN SET resultado = 'Viernes';
        WHEN dia = 6 THEN SET resultado = 'Sabado';
        WHEN dia = 7 THEN SET resultado = 'Domingo';
    END CASE;
end //

/*
1.8.2 Procedimientos con sentencias SQL
Escribe un procedimiento que reciba el nombre de un país como parámetro de entrada y realice una
consulta sobre la tabla cliente para obtener todos los clientes que existen en la tabla de ese país.
*/
DELIMITER //
CREATE PROCEDURE clientesPais(IN pais VARCHAR(20))
    BEGIN
         SELECT * FROM cliente AS c WHERE c.pais = pais;
    END //

/*
Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena
de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida el pago de máximo valor
realizado para esa forma de pago. Deberá hacer uso de la tabla pago de la base de datos jardineria.
*/
DELIMITER //
CREATE PROCEDURE pagoMax(IN formaPago VARCHAR(20), OUT resultado DECIMAL(10,2))
BEGIN
    SELECT MAX(p.total) INTO resultado FROM pago AS p WHERE p.forma_pago = formaPago;
end //

/*
Escribe un procedimiento que reciba como parámetro de entrada una forma de pago, que será una cadena
de caracteres (Ejemplo: PayPal, Transferencia, etc). Y devuelva como salida los siguientes valores
teniendo en cuenta la forma de pago seleccionada como parámetro de entrada:
- el pago de máximo valor,
- el pago de mínimo valor,
- el valor medio de los pagos realizados,
- la suma de todos los pagos,
- el número de pagos realizados para esa forma de pago.
Deberá hacer uso de la tabla pago de la base de datos jardineria.
*/
DELIMITER //
CREATE PROCEDURE pagoMax(IN formaPago VARCHAR(20), OUT maximo DECIMAL(10,2), OUT minimo DECIMAL(10,2), OUT media DECIMAL(10,2), OUT suma DECIMAL(10,2), OUT numero INT)
BEGIN
    SELECT MAX(p.total) INTO maximo FROM pago AS p WHERE p.forma_pago = formaPago;
    SELECT MIN(p.total) INTO minimo FROM pago AS p WHERE p.forma_pago = formaPago;
    SELECT AVG(p.total) INTO media FROM pago AS p WHERE p.forma_pago = formaPago;
    SELECT SUM(p.total) INTO suma FROM pago AS p WHERE p.forma_pago = formaPago;
    SELECT COUNT(p.total) INTO numero FROM pago AS p WHERE p.forma_pago = formaPago;
end //

/*
Crea una base de datos llamada procedimientos que contenga una tabla llamada cuadrados. La tabla cuadrados
debe tener dos columnas de tipo INT UNSIGNED, una columna llamada número y otra columna llamada cuadrado.
*/
-- CREAMOS LA BASE DE DATOS Y LA TABLA
CREATE DATABASE IF NOT EXISTS procedimientos;
USE procedimientos;
CREATE TABLE IF NOT EXISTS cuadrados (
    numero INT UNSIGNED,
    cuadrado INT UNSIGNED
);

-- CREAMOS EL PROCEDIMIENTO
DELIMITER //
CREATE PROCEDURE calcular_cuadrados(IN tope INT UNSIGNED)
BEGIN
    DECLARE i INT UNSIGNED DEFAULT 1;
    DECLARE cuadrado INT UNSIGNED DEFAULT 0;
    DELETE FROM cuadrados;
    WHILE i <= tope DO
        SET cuadrado = i * i;
        INSERT INTO cuadrados VALUES (i, cuadrado);
        SET i = i + 1;
    END WHILE;
END //

/*
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_cuadrados con las
siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED
y calculará el valor de los cuadrados de los primeros números naturales hasta el valor introducido como parámetro.
El valor del números y de sus cuadrados deberán ser almacenados en la tabla cuadrados que hemos creado previamente.
Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de la tabla antes de insertar
los nuevos valores de los cuadrados que va a calcular.

Utilice un bucle WHILE para resolver el procedimiento.
*/
DELIMITER //
CREATE PROCEDURE calcular_cuadrados(IN tope INT UNSIGNED)
BEGIN
    DECLARE i INT UNSIGNED DEFAULT 1;
    DECLARE cuadrado INT UNSIGNED DEFAULT 0;
    DELETE FROM cuadrados;
    WHILE i <= tope DO
        SET cuadrado = i * i;
        INSERT INTO cuadrados VALUES (i, cuadrado);
        SET i = i + 1;
    END WHILE;
END //

/*
Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
*/
DELIMITER //
CREATE PROCEDURE calcular_cuadrados(IN tope INT UNSIGNED)
BEGIN
    DECLARE i INT UNSIGNED DEFAULT 1;
    DECLARE cuadrado INT UNSIGNED DEFAULT 0;
    DELETE FROM cuadrados;
    REPEAT
        SET cuadrado = i * i;
        INSERT INTO cuadrados VALUES (i, cuadrado);
        SET i = i + 1;
    UNTIL i > tope END REPEAT;
END //

/*
Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
Crea una base de datos llamada procedimientos que contenga una tabla llamada ejercicio. La tabla debe tener una única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado calcular_números con las siguientes características. El procedimiento recibe un parámetro de entrada llamado valor_inicial de tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.

Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.

Utilice un bucle WHILE para resolver el procedimiento.

Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
Crea una base de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. Las dos tablas deben tener única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED.
Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado calcular_pares_impares con las siguientes características. El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y deberá almacenar en la tabla pares aquellos números pares que existan entre el número 1 el valor introducido como parámetro. Habrá que realizar la misma operación para almacenar los números impares en la tabla impares.

Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.

Utilice un bucle WHILE para resolver el procedimiento.

Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.
Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.
1.8.3 Funciones sin sentencias SQL
Escribe una función que reciba un número entero de entrada y devuelva TRUE si el número es par o FALSE en caso contrario.
Escribe una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.
Escribe una función que reciba como parámetro de entrada un valor numérico que represente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
Escribe una función que reciba tres números reales como parámetros de entrada y devuelva el mayor de los tres.
Escribe una función que devuelva el valor del área de un círculo a partir del valor del radio que se recibirá como parámetro de entrada.
Escribe una función que devuelva como salida el número de años que han transcurrido entre dos fechas que se reciben como parámetros de entrada. Por ejemplo, si pasamos como parámetros de entrada las fechas 2018-01-01 y 2008-01-01 la función tiene que devolver que han pasado 10 años.
Para realizar esta función puede hacer uso de las siguientes funciones que nos proporciona MySQL:

DATEDIFF
TRUNCATE
Escribe una función que reciba una cadena de entrada y devuelva la misma cadena pero sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.
1.8.4 Funciones con sentencias SQL
Escribe una función para la base de datos tienda que devuelva el número total de productos que hay en la tabla productos.
Escribe una función para la base de datos tienda que devuelva el valor medio del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
Escribe una función para la base de datos tienda que devuelva el valor máximo del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
Escribe una función para la base de datos tienda que devuelva el valor mínimo del precio de los productos de un determinado fabricante que se recibirá como parámetro de entrada. El parámetro de entrada será el nombre del fabricante.
1.8.5 Manejo de errores en MySQL
Crea una base de datos llamada test que contenga una tabla llamada alumno. La tabla debe tener cuatro columnas:
id: entero sin signo (clave primaria).
nombre: cadena de 50 caracteres.
apellido1: cadena de 50 caracteres.
apellido2: cadena de 50 caracteres.
Una vez creada la base de datos y la tabla deberá crear un procedimiento llamado insertar_alumno con las siguientes características. El procedimiento recibe cuatro parámetros de entrada (id, nombre, apellido1, apellido2) y los insertará en la tabla alumno. El procedimiento devolverá como salida un parámetro llamado error que tendrá un valor igual a 0 si la operación se ha podido realizar con éxito y un valor igual a 1 en caso contrario.

Deberá manejar los errores que puedan ocurrir cuando se intenta insertar una fila que contiene una clave primaria repetida.

1.8.6 Transacciones con procedimientos almacenados
Crea una base de datos llamada cine que contenga dos tablas con las siguientes columnas.
Tabla cuentas:

id_cuenta: entero sin signo (clave primaria).
saldo: real sin signo.
Tabla entradas:

id_butaca: entero sin signo (clave primaria).
nif: cadena de 9 caracteres.
Una vez creada la base de datos y las tablas deberá crear un procedimiento llamado comprar_entrada con las siguientes características. El procedimiento recibe 3 parámetros de entrada (nif, id_cuenta, id_butaca) y devolverá como salida un parámetro llamado error que tendrá un valor igual a 0 si la compra de la entrada se ha podido realizar con éxito y un valor igual a 1 en caso contrario.

El procedimiento de compra realiza los siguientes pasos:

Inicia una transacción.
Actualiza la columna saldo de la tabla cuentas cobrando 5 euros a la cuenta con el id_cuenta adecuado.
Inserta una una fila en la tabla entradas indicando la butaca (id_butaca) que acaba de comprar el usuario (nif).
Comprueba si ha ocurrido algún error en las operaciones anteriores. Si no ocurre ningún error entonces aplica un COMMIT a la transacción y si ha ocurrido algún error aplica un ROLLBACK.
Deberá manejar los siguientes errores que puedan ocurrir durante el proceso.

ERROR 1264 (Out of range value)
ERROR 1062 (Duplicate entry for PRIMARY KEY)
¿Qué ocurre cuando intentamos comprar una entrada y le pasamos como parámetro un número de cuenta que no existe en la tabla cuentas? ¿Ocurre algún error o podemos comprar la entrada?
En caso de que exista algún error, ¿cómo podríamos resolverlo?.

1.8.7 Cursores
Escribe las sentencias SQL necesarias para crear una base de datos llamada test, una tabla llamada alumnos y 4 sentencias de inserción para inicializar la tabla. La tabla alumnos está formada por las siguientes columnas:
id (entero sin signo y clave primaria)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres
fecha_nacimiento (fecha)
Una vez creada la tabla se decide añadir una nueva columna a la tabla llamada edad que será un valor calculado a partir de la columna fecha_nacimiento. Escriba la sentencia SQL necesaria para modificar la tabla y añadir la nueva columna.

Escriba una función llamada calcular_edad que reciba una fecha y devuelva el número de años que han pasado desde la fecha actual hasta la fecha pasada como parámetro:

Función: calcular_edad
Entrada: Fecha
Salida: Número de años (entero)
Ahora escriba un procedimiento que permita calcular la edad de todos los alumnmos que ya existen en la tabla. Para esto será necesario crear un procedimiento llamado actualizar_columna_edad que calcule la edad de cada alumno y actualice la tabla. Este procedimiento hará uso de la función calcular_edad que hemos creado en el paso anterior.

Modifica la tabla alumnos del ejercicio anterior para añadir una nueva columna email. Una vez que hemos modificado la tabla necesitamos asignarle una dirección de correo electrónico de forma automática.
Escriba un procedimiento llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.

Procedimiento: crear_email
Entrada:
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
dominio (cadena de caracteres)
Salida:
email (cadena de caracteres)
devuelva una dirección de correo electrónico con el siguiente formato:

El primer carácter del parámetro nombre.
Los tres primeros caracteres del parámetro apellido1.
Los tres primeros caracteres del parámetro apellido2.
El carácter @.
El dominio pasado como parámetro.
Ahora escriba un procedimiento que permita crear un email para todos los alumnmos que ya existen en la tabla. Para esto será necesario crear un procedimiento llamado actualizar_columna_email que actualice la columna email de la tabla alumnos. Este procedimiento hará uso del procedimiento crear_email que hemos creado en el paso anterior.

Escribe un procedimiento llamado crear_lista_emails_alumnos que devuelva la lista de emails de la tabla alumnos separados por un punto y coma. Ejemplo: juan@iescelia.org;maria@iescelia.org;pepe@iescelia.org;lucia@iescelia.org.
1.8.8 Triggers
Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas.
Tabla alumnos:

id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
nota (número real)
Una vez creada la tabla escriba dos triggers con las siguientes características:

Trigger 1: trigger_check_nota_before_insert
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de inserción.
Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.
Trigger2 : trigger_check_nota_before_update
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de actualización.
Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.
Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas.
Tabla alumnos:

id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
email (cadena de caracteres)
Escriba un procedimiento llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.

Procedimiento: crear_email
Entrada:
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
dominio (cadena de caracteres)
Salida:
email (cadena de caracteres)
devuelva una dirección de correo electrónico con el siguiente formato:

El primer carácter del parámetro nombre.
Los tres primeros caracteres del parámetro apellido1.
Los tres primeros caracteres del parámetro apellido2.
El carácter @.
El dominio pasado como parámetro.
Una vez creada la tabla escriba un trigger con las siguientes características:

Trigger: trigger_crear_email_before_insert
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de inserción.
Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla.
Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.
Nota: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.

Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características:
Trigger: trigger_guardar_email_after_update:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de actualización.
Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:

id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
old_email: valor anterior del email (cadena de caracteres)
new_email: nuevo valor con el que se ha actualizado
Modifica el ejercicio anterior y añade un nuevo trigger que tenga las siguientes características:
Trigger: trigger_guardar_alumnos_eliminados:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de borrado.
Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
La tabla log_alumnos_eliminados contiene los siguientes campos:

id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
nombre: nombre del alumno eliminado (cadena de caracteres)
apellido1: primer apellido del alumno eliminado (cadena de caracteres)
apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
email: email del alumno eliminado (cadena de caracteres)
1.9 Ejercicios de repaso
¿Qué beneficios nos puede aportar utilizar procedimientos y funciones almacenadas?
Según la siguiente sentencia, ¿estamos haciendo una llamada a un procedimiento o a una función?
CALL resolver_ejercicio2()
¿Cuáles de los siguientes bloques son correctos?
1.
LOOP bucle:
  statements
END bucle:

2.
bucle: LOOP
  statements
END bucle;

3.
bucle:
LOOP bucle;
  statements;
END bucle;
¿Pueden aparecer las siguientes sentencias en el mismo bloque de código?
DECLARE a INT;
DECLARE a INT;
¿Pueden aparecer las siguientes sentencias en el mismo bloque de código?
DECLARE a INT;
DECLARE a FLOAT;
¿Pueden aparecer las siguientes sentencias en el mismo bloque de código?
DECLARE b VARCHAR(20);
DECLARE b HANDLER FOR SQLSTATE '02000';
¿Para qué podemos utilizar un cursor en MySQL?

¿Puedo actualizar los datos de un cursor en MySQL? Si fuese posible actualizar los datos de un cursor, ¿se actualizarían automáticamente los datos de la tabla?

Cuál o cuáles de los siguientes bucles no está soportado en MySQL: FOR, LOOP, REPEAT y WHILE.

Si el cuerpo del bucle se debe ejecutar al menos una vez, ¿qué bucle sería más apropiado?

¿Qué valor devuelve la sentencia SELECT value?

0
9
10
NULL
El código entra en un bucle infinito y nunca alcanza la sentencia SELECT value
DELIMITER $$
CREATE PROCEDURE incrementor (OUT i INT)
BEGIN
  REPEAT
    SET i = i + 1;
  UNTIL i > 9
  END REPEAT;
END;

DELIMITER $$
CREATE PROCEDURE test ()
BEGIN
  DECLARE value INT default 0;
  CALL incrementor(value);

  -- ¿Qué valor se muestra en esta sentencia?
  SELECT value;
END;

DELIMITER ;
CALL test();
¿Qué valor devuelve la sentencia SELECT value?
0
9
10
NULL
El código entra en un bucle infinito y nunca alcanza la sentencia SELECT value
DELIMITER $$
CREATE PROCEDURE incrementor (IN i INT)
BEGIN
  REPEAT
    SET i = i + 1;
  UNTIL i > 9
  END REPEAT;
END;

DELIMITER $$
CREATE PROCEDURE test ()
BEGIN
  DECLARE value INT default 0;
  CALL incrementor(value);

  -- ¿Qué valor se muestra en esta sentencia?
  SELECT value;
END;

DELIMITER ;
CALL test();
Realice los siguientes procedimientos y funciones sobre la base de datos jardineria.
Función: calcular_precio_total_pedido
Descripción: Dado un código de pedido la función debe calcular la suma total del pedido. Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
Parámetros de entrada: codigo_pedido (INT)
Parámetros de salida: El precio total del pedido (FLOAT)
Función: calcular_suma_pedidos_cliente
Descripción: Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT)
Función: calcular_suma_pagos_cliente
Descripción: Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT)
Procedimiento: calcular_pagos_pendientes
Descripción: Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes.
Deberá insertar en una tabla llamada clientes_con_pagos_pendientes los siguientes datos:

id_cliente
suma_total_pedidos
suma_total_pagos
pendiente_de_pago
Teniendo en cuenta el significado de los siguientes códigos de error:
Error: 1036 (ER_OPEN_AS_READONLY). Table ‘%s’ is read only
Error: 1062 (ER_DUP_ENTRY). Duplicate entry ‘%s’ for key %d
-- Paso 1
CREATE TABLE t (s1 INT, PRIMARY KEY (s1));

-- Paso 2
DELIMITER $$
CREATE PROCEDURE handlerexam(IN a INT, IN b INT, IN c INT, OUT x INT)
BEGIN
  DECLARE EXIT HANDLER FOR 1036 SET x = 10;
  DECLARE EXIT HANDLER FOR 1062 SET x = 30;

  SET x = 1;
  INSERT INTO t VALUES (a);
  SET x = 2;
  INSERT INTO t VALUES (b);
  SET x = 3;
  INSERT INTO t VALUES (c);
  SET x = 4;
END
$$
¿Qué devolvería la última sentencia SELECT @x en cada caso (a y b)? Justifique su respuesta. Sin una justificación válida la respuesta será considerada incorrecta.

-- a)
CALL handlerexam(1, 2, 3, @x);
SELECT @x;

-- b)
CALL handlerexam(1, 2, 1, @x);
SELECT @x;
Dado el siguiente procedimiento:
-- Paso 1
CREATE TABLE t (s1 INT, PRIMARY KEY (s1));

-- Paso 2
DELIMITER $$
CREATE PROCEDURE test(IN a INT, OUT b INT)
BEGIN
    SET b = 0;
    WHILE a > b DO
        SET b = b + 1;
        IF b != 2 THEN
            INSERT INTO t VALUES (b);
        END IF
    END WHILE;
END;
¿Qué valores tendría la tabla t y qué valor devuelve la sentencia SELECT value en cada caso (a y b)? Justifique la respuesta. Sin una justificación válida la respuesta será considerada incorrecta.

-- a)
CALL test(-10, @value);
SELECT @value;

-- b)
CALL test(10, @value);
SELECT @value;
Escriba un procedimiento llamado obtener_numero_empleados que reciba como parámetro de entrada el código de una oficina y devuelva el número de empleados que tiene.
Escriba una sentencia SQL que realice una llamada al procedimiento realizado para comprobar que se ejecuta correctamente.

Escriba una función llamada cantidad_total_de_productos_vendidos que reciba como parámetro de entrada el código de un producto y devuelva la cantidad total de productos que se han vendido con ese código.
Escriba una sentencia SQL que realice una llamada a la función realizada para comprobar que se ejecuta correctamente.

Crea una tabla que se llame productos_vendidos que tenga las siguientes columnas:
id (entero sin signo, auto incremento y clave primaria)
codigo_producto (cadena de caracteres)
cantidad_total (entero)
Escriba un procedimiento llamado estadísticas_productos_vendidos que para cada uno de los productos de la tabla producto calcule la cantidad total de unidades que se han vendido y almacene esta información en la tabla productos_vendidos.

El procedimiento tendrá que realizar las siguientes acciones:

Borrar el contenido de la tabla productos_vendidos.
Recorrer cada uno de los productos de la tabla producto. Será necesario usar un cursor.
Calcular la cantidad total de productos vendidos. En este paso será necesario utilizar la función cantidad_total_de_productos_vendidos desarrollada en el ejercicio 2.
Insertar en la tabla productos_vendidos los valores del código de producto y la cantidad total de unidades que se han vendido para ese producto en concreto.
Crea una tabla que se llame notificaciones que tenga las siguientes columnas:
id (entero sin signo, autoincremento y clave primaria)
fecha_hora: marca de tiempo con el instante del pago (fecha y hora)
total: el valor del pago (real)
codigo_cliente: código del cliente que realiza el pago (entero)
Escriba un trigger que nos permita llevar un control de los pagos que van realizando los clientes. Los detalles de implementación son los siguientes:

Nombre: trigger_notificar_pago
Se ejecuta sobre la tabla pago.
Se ejecuta después de hacer la inserción de un pago.
Cada vez que un cliente realice un pago (es decir, se hace una inserción en la tabla pago), el trigger deberá insertar un nuevo registro en una tabla llamada notificaciones.
*/

/*
Configura tu sistema gestor de base de datos para que registre aquellas consultas que tardan más de
3 segundos en ejecutarse.
*/

/*
Realice algunas consultas sobre las bases de datos jardineria y universidad que tengan un tiempo
de ejecución superior a 3 segundos.
*/


/*
Configura tu sistema gestor de base de datos para que registre aquellas consultas que no usan índices.
*/


/*
Realice algunas consultas sobre las bases de datos jardineria y universidad que no hagan uso de índices.
*/


/*
¿Cómo podemos optimizar el tiempo de ejecución de las consultas que hemos detectado? Realice las operaciones necesarias para optimizar las consultas anteriores y vuelva a realizar las consultas para comparar los tiempos de ejecución en ambos casos.
*/