/*
1. Extranjeros que vienen al FOJE
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios,
     paises,
     provincias,
     localidades
WHERE voluntarios.idLocalidad = localidades.idLocalidad
  AND localidades.idProvincia = provincias.idProvincia
  AND provincias.idPais = paises.idPais
  AND paises.pais = 'Extranjeros';

/*
2. Personas de fuera de Aragón
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, provincias.provincia
FROM voluntarios,
     provincias,
     localidades
WHERE voluntarios.idLocalidad = localidades.idLocalidad
  AND localidades.idProvincia = provincias.idProvincia
  AND (provincias.provincia NOT IN ('Zaragoza', 'Huesca', 'Teruel'))
ORDER BY voluntarios.IdVoluntarios ASC;

/*
3. Personas de Jaca
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios,
     localidades
WHERE localidades.idLocalidad = voluntarios.idLocalidad
  AND localidades.idLocalidad = 'Jaca';


/*
4. Personas que no tengan alojamiento durante el FOJE
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios
WHERE voluntarios.alojamiento LIKE 'False';

/*
5. Personas entre 18 y 25 años que pesen más de 70Kg y lleven la talla M o L
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.peso, voluntarios.talla
FROM voluntarios
WHERE TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) BETWEEN 18 AND 25
  AND voluntarios.peso > 70
  AND (voluntarios.talla LIKE 'M' OR voluntarios.talla LIKE 'L');

/*
6. Personas entre 26 y 40 años de Zaragoza o Personas entre 41 y 55 años de huesca
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, localidades.localidad
FROM voluntarios,
     localidades,
     provincias
WHERE localidades.idLocalidad = voluntarios.idLocalidad
  AND localidades.idProvincia = provincias.idProvincia
  AND (TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) BETWEEN 26 AND 40
           AND provincias.idProvincia = 44
    OR TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) BETWEEN 41 AND 55
           AND provincias.idProvincia = 22);

/*
7. Personas mayores a 55 años
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios
WHERE TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) > 55;

/*
8. Personas con una talla XXL y cuya altura sea inferior a 175cm
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.talla, voluntarios.altura
FROM voluntarios
WHERE voluntarios.talla LIKE 'XXL'
  AND voluntarios.altura < 175;

/*
9. Personas estudiantes con nivel ALTO en informatica
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.nivelInformatica, laboral.labor
FROM voluntarios,
     laboral
WHERE laboral.IdLabor = voluntarios.idVoluntarios
  AND laboral.labor LIKE 'Estudiante'
  AND voluntarios.nivelInformatica LIKE 'ALTO';

/*
10. Personas estudiantes con un nivel ALTO en ingles hablado y escrito
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, idiomas.idioma, nivel.hablado, nivel.escrito, laboral.labor
FROM voluntarios,
     nivel,
     laboral,
     idiomas
WHERE (voluntarios.IdVoluntarios = nivel.IdVoluntario)
  AND (nivel.IdIdioma = idiomas.Ididioma)
  AND (laboral.IdLabor = voluntarios.idVoluntarios)
  AND (laboral.labor LIKE 'Estudiante')
  AND (idiomas.idioma LIKE 'Ingles')
  AND (nivel.hablado LIKE 'Alto')
  AND (nivel.escrito LIKE 'Alto');

/*
11. Personas jubiladas con un nivel ALTO en frances hablado y escrito o con un nivel
ALTO en inglés hablado y escrito
*/
SELECT DISTINCT voluntarios.IdVoluntarios,
                voluntarios.nombre,
                idiomas.Idioma,
                nivel.hablado,
                nivel.escrito,
                voluntarios.fNacimiento,
                TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) AS edad
FROM voluntarios,
     idiomas,
     nivel,
     laboral
WHERE (TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) > 65)
  AND (((voluntarios.IdVoluntarios = nivel.IdVoluntario) AND (nivel.hablado = 'ALTO') AND nivel.escrito = 'ALTO')
    AND ((idiomas.Ididioma = nivel.IdIdioma) AND (idiomas.Idioma = 'FRANCES')));

/*
12. Personas que practiquen esquí en cualquiera de sus modalidades
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, deportes.deporte
FROM voluntarios,
     deportes,
     practicar
WHERE voluntarios.IdVoluntarios = practicar.IdVoluntarios
  AND practicar.IdDeportes = deportes.IdDeporte
  AND deportes.deporte LIKE '%ESQUI%';

/*
13. Personas que cumplen años hoy
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.fNacimiento
FROM voluntarios
WHERE DAY(voluntarios.fNacimiento) = DAY(CURDATE())
  AND MONTH(voluntarios.fNacimiento) = MONTH(CURDATE());

/*
14. Personas que cumplen años en el mes de diciembre
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.fNacimiento
FROM voluntarios
WHERE MONTH(voluntarios.fNacimiento) = 12;

/*
15. Personas que cumplen años en invierno
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.fNacimiento
FROM voluntarios
WHERE MONTH(voluntarios.fNacimiento) = 12 AND DAY(voluntarios.fNacimiento) >= 21
   OR MONTH(voluntarios.fNacimiento) BETWEEN 1 AND 3
    AND IF(month(voluntarios.fNacimiento) = 3, day(voluntarios.fNacimiento) <= 20, TRUE);


/*
16. Personas que cumplen años en el primer trimestre del año
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios.fNacimiento
FROM voluntarios
WHERE MONTH(voluntarios.fNacimiento) BETWEEN 1 AND 3;

/*
17. Personas que tengan preferencia 1 en tareas de informática o preferencia 1 en tareas
de conducción
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, preferencias.Preferencia, tareas.nombre
FROM voluntarios,
     preferencias,
     tareas
WHERE voluntarios.IdVoluntarios = preferencias.IdVoluntario
  AND preferencias.IdTarea = tareas.IdTarea
  AND (preferencias.Preferencia = 1)
  AND ((tareas.nombre LIKE 'Informatica')
    OR (tareas.nombre LIKE 'Conduccion'));


/*
18. Personas que tengan preferencia 1 en tareas de interprete y que tengan un nivel
hablado alto en cualquiera de los idiomas
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, tareas.nombre, nivel.hablado, idiomas.idioma
FROM voluntarios,
     preferencias,
     nivel,
     tareas,
     idiomas
WHERE voluntarios.IdVoluntarios = preferencias.IdVoluntario
  AND preferencias.IdTarea = tareas.IdTarea
  AND (nivel.IdVoluntario = voluntarios.IdVoluntarios)
  AND (preferencias.Preferencia = 1)
  AND (tareas.nombre LIKE 'Interprete')
  AND (nivel.hablado LIKE 'ALTO');


/*
19. Personas que tengan preferencia 1 en tareas de informatica y tengan un nivel medio o
alto en informatica
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, tareas.nombre, voluntarios.nivelInformatica
FROM voluntarios,
     preferencias,
     tareas
WHERE voluntarios.IdVoluntarios = preferencias.IdVoluntario
  AND preferencias.IdTarea = tareas.IdTarea
  AND (preferencias.Preferencia = 1)
  AND (tareas.nombre LIKE 'Informatica')
  AND (voluntarios.nivelInformatica LIKE 'ALTO'
    OR voluntarios.nivelInformatica LIKE 'MEDIO');
/*
20. Personas que tengan preferencia 1 en tareas de conducción, tengan un nivel medio o
alto de ingles hablado, sean mayores de 26 años, tengan carnet de conducir B y sean
de Huesca.
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, tareas.nombre, nivel.hablado, voluntarios.fNacimiento, voluntarios.carnetB, provincias.provincia
FROM voluntarios,
     preferencias,
     nivel,
     tareas,
     idiomas,
     provincias,
     localidades
WHERE voluntarios.IdVoluntarios = preferencias.IdVoluntario
  AND preferencias.IdTarea = tareas.IdTarea
  AND (preferencias.Preferencia = 1)
  AND (tareas.nombre LIKE 'Conduccion')
  AND (nivel.IdVoluntario = voluntarios.IdVoluntarios)
  AND (nivel.IdIdioma = idiomas.Ididioma)
  AND (idiomas.Idioma LIKE 'INGLES')
  AND (nivel.hablado LIKE 'ALTO'
    OR nivel.hablado LIKE 'MEDIO')
  AND (TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) > 26)
  AND (voluntarios.carnetB = 1)
  AND (localidades.IdLocalidad = voluntarios.IdLocalidad)
  AND (provincias.IdProvincia = localidades.IdProvincia)
  AND (provincias.provincia LIKE 'HUESCA');


/*
21. Personas que tengan preferencia 2 en tareas administrativas, tengan un nivel medio o
alto de ingles hablado y sean mayores de 40 años.
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, tareas.nombre, nivel.hablado, voluntarios.fNacimiento
FROM voluntarios,
     preferencias,
     tareas,
     nivel,
     idiomas
WHERE voluntarios.IdVoluntarios = preferencias.IdVoluntario
  AND preferencias.IdTarea = tareas.IdTarea
  AND (preferencias.Preferencia = 2)
  AND (tareas.nombre LIKE 'Administrativas')
  AND (nivel.IdVoluntario = voluntarios.IdVoluntarios)
  AND (nivel.IdIdioma = idiomas.Ididioma)
  AND (idiomas.Idioma LIKE 'INGLES')
  AND (nivel.hablado LIKE 'ALTO'
    OR nivel.hablado LIKE 'MEDIO')
  AND (TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) > 40);

/*
22. Personas cuyo nombre comience por A y que sean de Cataluña
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, provincias.provincia
FROM voluntarios,
     localidades,
     provincias
WHERE voluntarios.IdLocalidad = localidades.IdLocalidad
  AND localidades.IdProvincia = provincias.IdProvincia
  AND (provincias.provincia LIKE 'Barcelona'
    OR provincias.provincia LIKE 'Girona'
    OR provincias.provincia LIKE 'Lleida'
    OR provincias.provincia LIKE 'Tarragona')
  AND (voluntarios.nombre LIKE 'A%');

/*
23. Personas cuyo codigo postal comience por 2 y termine en 6
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios_old.Cp
FROM voluntarios,
     voluntarios_old
WHERE voluntarios.IdVoluntarios = voluntarios_old.Idvoluntario
  AND (voluntarios_old.Cp LIKE '2%6');


/*
24. Personas cuya población comience por CAN
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, localidades.localidad
FROM voluntarios,
     localidades
WHERE voluntarios.IdLocalidad = localidades.IdLocalidad
  AND (localidades.localidad LIKE 'CAN%');
/*
25. Personas cuyo nombre comience por cualquiera de las siguientes letras
F,G.H,I,J,K,L,M
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios
WHERE (voluntarios.nombre REGEXP '^[F-M]');


/*
26. Personas cuya cuarta letra del nombre tenga una de las siguientes letras P,Q,R,S,T
y además sean aragonesas.
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, provincias.provincia
FROM voluntarios,
     localidades,
     provincias
WHERE voluntarios.idLocalidad = localidades.idLocalidad
  AND localidades.idProvincia = provincias.idProvincia
  AND (provincias.provincia in ('Huesca', 'Zaragoza', 'Teruel'))
  AND (voluntarios.nombre REGEXP '^[A-Z]{3}[P-T]');

/*
27. Personas cuyo nombre comience por cualquiera de las siguientes letras
A,B,C,D,E,F,G,H,I,J,K,L sean varones y residan en Galicia
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, voluntarios_old.sexo, provincias.provincia
FROM voluntarios,
     voluntarios_old,
     localidades,
     provincias
WHERE voluntarios.IdVoluntarios = voluntarios_old.Idvoluntario
  AND voluntarios.IdLocalidad = localidades.IdLocalidad
  AND localidades.idProvincia = provincias.idProvincia
  AND (provincias.provincia in ('A Coruña', 'Lugo', 'Ourense', 'Pontevedra'))
  AND (voluntarios.nombre REGEXP '^[A-L]')
  AND (voluntarios_old.sexo LIKE 'M');

/*
28. Personas cuyo nombre comience y termine por una vocal
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios
WHERE (voluntarios.nombre REGEXP '^[AEIOU].*[AEIOU]$');

/*
29. Personas cuyo nombre tenga 3 letras o tenga 10 letras
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre
FROM voluntarios
WHERE (voluntarios.nombre REGEXP '^[A-Z]{3}$')
   OR (voluntarios.nombre REGEXP '^[A-Z]{10}$');

/*
30. Personas en cuya población aparezca la palabra VILLANUEVA
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, localidades.localidad
FROM voluntarios,
     localidades
WHERE voluntarios.idLocalidad = localidades.idLocalidad
  AND (localidades.localidad REGEXP 'VILLANUEVA');

/*
31. Personas en cuya población aparezca la letra Ñ
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, localidades.localidad
FROM voluntarios,
     localidades
WHERE voluntarios.idLocalidad = localidades.idLocalidad
  AND (localidades.localidad REGEXP 'ñ');

/*
32. Personas en cuya población aparezca una vocal acentuada
*/
SELECT voluntarios.IdVoluntarios, voluntarios.nombre, localidades.localidad
FROM voluntarios,
     localidades
WHERE voluntarios.idLocalidad = localidades.idLocalidad
  AND (localidades.localidad REGEXP '[áéíóú]');

/*
33. Seleccionar el campo nombre, otro que contenga las tres primeras posiciones del
nombre, otro que contenga las dos últimas posiciones del nombre.
*/
SELECT voluntarios.IdVoluntarios,
       voluntarios.nombre,
       SUBSTRING(voluntarios.nombre, 1, 3) AS campo1,
       SUBSTRING(voluntarios.nombre, -2)   AS campo2
FROM voluntarios;

/*
34. Seleccionar el campo nombre, población, otro que contenga las posiciones 2 y 3 del
nombre, y otro SUBSTRING que contenga la posición primera y última de la población.
*/
SELECT voluntarios.IdVoluntarios,
       voluntarios.nombre,
       localidades.localidad,
       SUBSTRING(voluntarios.nombre, 2, 2)                                     AS campo1,
       CONCAT(LEFT(localidades.localidad, 1), RIGHT(localidades.localidad, 1)) AS campo2
FROM voluntarios,
     localidades
WHERE voluntarios.idLocalidad = localidades.idLocalidad;

/*
35. Seleccionar el campo nombre, población, otro al que llamaremos usuario que
contenga las tres primeras posiciones del nombre junto con las tres ultimas posiciones
de la población y el idvoluntario y otro al que llamaremos clave que contenga los
dígitos 3 y 4 del codigo postal junto con el idvoluntario y el mes de nacimiento.
*/
SELECT voluntarios.IdVoluntarios,
       voluntarios.nombre,
       localidades.localidad,
       CONCAT(SUBSTRING(voluntarios.nombre, 1, 3), SUBSTRING(localidades.localidad, -3)) AS usuario,
       CONCAT(SUBSTRING(voluntarios_old.cp, 3, 2), voluntarios.IdVoluntarios,
              MONTH(voluntarios_old.fechanacimiento))                                    AS clave
FROM voluntarios,
     voluntarios_old,
     localidades
WHERE voluntarios.IdVoluntarios = voluntarios_old.Idvoluntario
  AND voluntarios.idLocalidad = localidades.idLocalidad;

/*
36. Seleccionar el campo nombre y otro llamado Dias Vividos donde muestre la diferencia
de dias entre la fecha actual y la de su nacimiento.
*/
SELECT voluntarios.nombre,
       DATEDIFF(CURDATE(), voluntarios.fNacimiento) AS DiasVividos
FROM voluntarios,
     voluntarios_old;

/*
37. Seleccionar el campo de nombre, fecha, otro llamado Dia Nacimiento en el que se
muestre el día de la semana en el que nació, otro llamado Trimestre en el que se
muestre el trimestre correspondiente a la fecha de nacimiento.
*/
SELECT voluntarios.nombre, voluntarios.fNacimiento,
       DAYNAME(voluntarios.fNacimiento) AS Dia_Nacimiento,
       QUARTER(voluntarios.fNacimiento) AS Trimestre
FROM voluntarios;
/*
38. Seleccionar el campo de nombre, provincia y otro al que llamaremos comunidad y el
cual llevará ARAGONES si la persona reside en cualquier provincia de Aragón,
ANDALUZ si reside en cualquier provincia de Andalucía y guiones (--------) en caso
contrario.
*/
SELECT voluntarios.nombre, provincias.provincia,
       CASE
           WHEN provincias.provincia IN ('Huesca', 'Teruel', 'Zaragoza') THEN 'ARAGONES'
           WHEN provincias.provincia IN ('Almería', 'Cádiz', 'Córdoba', 'Granada', 'Huelva', 'Jaén', 'Málaga', 'Sevilla') THEN 'ANDALUZ'
           ELSE '--------' END AS comunidad
FROM voluntarios,
     provincias;

/*
39. Selecciona el campo de nombre, fecha, edad y prepara un campo llamado Edad
Exacta que contenga la edad exacta de la persona.
*/
SELECT voluntarios.nombre, voluntarios.fNacimiento,
       TIMESTAMPDIFF(YEAR, voluntarios.fNacimiento, CURDATE()) AS edad,
         TIMESTAMPDIFF(MONTH, voluntarios.fNacimiento, CURDATE()) / 12 AS EdadExacta
FROM voluntarios;
