/*
41. Cantidad de personas de cada país.
*/
SELECT COUNT(v.nombre) AS Personas, pa.pais
FROM paises AS pa,
     voluntarios AS v,
     localidades AS l,
     provincias AS pr
WHERE v.idLocalidad = l.idLocalidad
  AND l.idProvincia = pr.idProvincia
  AND pr.idPais = pa.idPais
GROUP BY pa.pais;

/*
42. Cantidad de personas de las diferentes provincias de España.
*/
SELECT provincias.provincia, COUNT(DISTINCT voluntarios.IdVoluntarios)
FROM voluntarios, localidades, provincias, paises
WHERE voluntarios.idLocalidad = localidades.idLocalidad
	AND localidades.idProvincia = provincias.idProvincia
	AND provincias.idPais = paises.idPais
	AND paises.pais = 'España'
GROUP BY provincias.provincia;

/*
43. Cantidad de personas de las tres provincias de Aragón.
 */
 SELECT provincias.provincia, COUNT(DISTINCT voluntarios.IdVoluntarios)
FROM voluntarios, localidades, provincias
WHERE voluntarios.idLocalidad = localidades.idLocalidad
    AND localidades.idProvincia = provincias.idProvincia
    AND provincias.provincia IN ('Huesca', 'Zaragoza', 'Teruel')
GROUP BY provincias.provincia;

/*
44. Cantidad de personas de las diferentes poblaciones de Huesca.
*/
SELECT localidades.localidad, COUNT(DISTINCT voluntarios.IdVoluntarios)
FROM localidades, voluntarios, provincias
WHERE voluntarios.idLocalidad = localidades.idLocalidad
    AND localidades.idProvincia = provincias.idProvincia
    AND provincias.provincia = 'Huesca'
GROUP BY localidades.localidad;

/*
45.
a. Cantidad de personas que se llaman igual.
*/
 SELECT COUNT(v.nombre) AS Personas_mismo_nombre, v.nombre
FROM voluntarios AS v
GROUP BY v.nombre
HAVING COUNT(v.nombre) > 1;

/*
b. Nombre que más se repite
*/
SELECT  v.nombre, COUNT(v.nombre) AS Personas_mismo_nombre
FROM voluntarios AS v
GROUP BY v.nombre
HAVING COUNT(v.nombre) = (SELECT MAX(cantidad)
                          FROM (SELECT COUNT(v.nombre) AS cantidad
                                FROM voluntarios AS v
                                GROUP BY v.nombre) AS t);

/*
c. Nombre que se repiten entre 5 y 10 veces
*/
SELECT  v.nombre, COUNT(v.nombre) AS Personas_mismo_nombre
FROM voluntarios AS v
GROUP BY v.nombre
HAVING COUNT(v.nombre) BETWEEN 5 AND 10;

/*
46. Cantidad de personas por edades.
*/
 SELECT COUNT(v.nombre) AS Personas, TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE()) AS edad
FROM voluntarios AS v
GROUP BY edad;

/*
47. Cantidad de personas por tallas.
*/
 SELECT COUNT(v.nombre) AS Personas, v.talla
FROM voluntarios AS v
GROUP BY v.talla;

/*
48. Cantidad de personas por profesion.
*/
 SELECT COUNT(v.nombre) AS Personas,laboral.labor
FROM voluntarios AS v, laboral
WHERE v.idLabor = laboral.idLabor
GROUP BY laboral.labor;

/*
49. Cantidad de personas por sexo.
*/
SELECT COUNT(v.nombre) AS Personas,
       CASE
           WHEN v.sexo = 'M' THEN 'Masculino'
           WHEN v.sexo = 'F' THEN 'Femenino'
           ELSE 'Otro'
       END AS sexo
FROM voluntarios_old AS v
GROUP BY v.sexo;

/*
50. Cantidad de personas nacidas en cada mes.
*/
SELECT COUNT(v.nombre) AS Personas, MONTH(v.fNacimiento) AS mes
FROM voluntarios AS v
GROUP BY mes;

/*
51. Cantidad de personas nacidas en cada trimestre.
*/
SELECT COUNT(v.nombre) AS Personas, QUARTER(v.fNacimiento) AS trimestre
FROM voluntarios AS v
GROUP BY trimestre;

/*
52. Cantidad de personas nacidas en cada trimestre, pero solo de aquellos trimestres
que tengan más de 110 personas.
*/
SELECT COUNT(v.nombre) AS Personas, QUARTER(v.fNacimiento) AS trimestre
FROM voluntarios AS v
GROUP BY trimestre
HAVING COUNT(v.nombre) > 110;

/*
53. Cantidad de personas de los diferentes niveles de italiano hablado.
*/
SELECT COUNT(v.nombre) AS Personas, i.idioma, n.hablado
FROM voluntarios AS v, idiomas AS i, nivel AS n
WHERE v.IdVoluntarios = n.IdVoluntario
   AND n.idIdioma = i.idIdioma
   AND i.idioma = 'Italiano'
GROUP BY n.hablado;

/*
54. Cantidad de personas de los diferentes niveles de frances hablado
*/
SELECT COUNT(v.nombre) AS Personas, i.idioma, n.hablado
FROM voluntarios AS v, idiomas AS i, nivel AS n
WHERE v.IdVoluntarios = n.IdVoluntario
   AND n.idIdioma = i.idIdioma
   AND i.idioma = 'Frances'
GROUP BY n.hablado;

/*
55. Cantidad de personas de los diferentes niveles de ingles hablado.
*/
SELECT COUNT(v.nombre) AS Personas, i.idioma, n.hablado
FROM voluntarios AS v, idiomas AS i, nivel AS n
WHERE v.IdVoluntarios = n.IdVoluntario
   AND n.idIdioma = i.idIdioma
   AND i.idioma = 'Ingles'
GROUP BY n.hablado;

/*
56. Cantidad de personas de los diferentes niveles de ingles hablado y por edades.
*/
SELECT COUNT(v.nombre) AS Personas, i.idioma, n.hablado, TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE()) AS edad
FROM voluntarios AS v, idiomas AS i, nivel AS n
WHERE v.IdVoluntarios = n.IdVoluntario
   AND n.idIdioma = i.idIdioma
   AND i.idioma = 'Ingles'
GROUP BY n.hablado, edad;

/*
57. Promedio de edades, Más viejo, Más Joven
*/
SELECT AVG(TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE())) AS Promedio_edad,
       MAX(TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE())) AS Mas_viejo,
       MIN(TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE())) AS Mas_joven
FROM voluntarios AS v;

/*
58. Promedio de edades de cada provincia.
*/
SELECT AVG(TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE())) AS Promedio_edad, p.provincia
FROM voluntarios AS v, provincias AS p, localidades AS l
WHERE v.idLocalidad = l.idLocalidad
   AND l.idProvincia = p.idProvincia
GROUP BY p.provincia;

/*
59. Edad de la persona más viejo y más joven de cada pais.
*/
SELECT MAX(TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE())) AS Más_Viejo,
       MIN(TIMESTAMPDIFF(YEAR, v.fNacimiento, CURDATE())) AS Más_Joven, pa.pais
FROM voluntarios AS v, provincias AS p, localidades AS l, paises AS pa
WHERE v.idLocalidad = l.idLocalidad
   AND l.idProvincia = p.idProvincia
GROUP BY pa.pais;
