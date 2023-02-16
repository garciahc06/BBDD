/*
60. Mostrar voluntarios de la provincia de Madrid cuya edad supere la media de
edades de los voluntarios de Zaragoza.
*/
SELECT v.nombre, TIMESTAMPDIFF(YEAR, v.fNacimiento, CURRENT_DATE) AS edad
FROM voluntarios AS v,
     localidades AS l,
     provincias AS p
WHERE v.idLocalidad = l.idLocalidad
  AND l.idProvincia = p.idProvincia
  AND p.provincia = 'Madrid'
  AND TIMESTAMPDIFF(YEAR, v.fNacimiento, CURRENT_DATE) > ALL
      (SELECT AVG(TIMESTAMPDIFF(YEAR, v2.fNacimiento, CURRENT_DATE))
       FROM voluntarios AS v2,
            localidades AS l2,
            provincias AS p2
       WHERE v2.idLocalidad = l2.idLocalidad
         AND l2.idProvincia = p2.idProvincia
         AND p2.provincia = 'Zaragoza');

/*
61. Mostar voluntarios y edad que superen a todas las edades
de los voluntarios de la provincia de Madrid
Y MOSTRAMOS LA MEDIA DE LAS EDADES DE LOS VOLUNTARIOS DE MADRID EN LA CONSULTA
*/
SELECT v.nombre, TIMESTAMPDIFF(YEAR, v.fNacimiento, CURRENT_DATE) AS edad
FROM voluntarios AS v,
     localidades AS l,
     provincias AS p
WHERE v.idLocalidad = l.idLocalidad
  AND l.idProvincia = p.idProvincia
  AND p.provincia = 'Madrid'
  AND TIMESTAMPDIFF(YEAR, v.fNacimiento, CURRENT_DATE) > ALL
      (SELECT AVG(TIMESTAMPDIFF(YEAR, v2.fNacimiento, CURRENT_DATE))
       FROM voluntarios AS v2,
            localidades AS l2,
            provincias AS p2
       WHERE v2.idLocalidad = l2.idLocalidad
         AND l2.idProvincia = p2.idProvincia
         AND p2.provincia = 'Madrid');

/*
62. Mostrar voluntarios y altura, que superen el peso más alto de los voluntarios de
Barcelona.
*/
SELECT v.altura, v.nombre
FROM voluntarios AS v
WHERE v.peso > ALL
      (SELECT MAX(v2.peso)
       FROM voluntarios AS v2,
            localidades AS l,
            provincias AS p
       WHERE v2.idLocalidad = l.idLocalidad
         AND l.idProvincia = p.idProvincia
         AND p.provincia = 'Barcelona');

/*
63. Mostrar voluntarios y altura cuya altura sea inferior a cualquier altura
de los voluntarios de Burgos
*/
SELECT v.altura, v.nombre
FROM voluntarios AS v
WHERE v.altura < ALL
      (SELECT MIN(v2.altura)
       FROM voluntarios AS v2,
            localidades AS l,
            provincias AS p
       WHERE v2.idLocalidad = l.idLocalidad
         AND l.idProvincia = p.idProvincia
         AND p.provincia = 'Burgos');

/*
64. Mostrar nombre de voluntarios y altura cuya altura coincida con alturas de
voluntarios de Valencia.
*/
SELECT v.altura, v.nombre
FROM voluntarios AS v
WHERE v.altura in
      (SELECT v2.altura
        FROM voluntarios AS v2,
            localidades AS l,
            provincias AS p
       WHERE v2.idLocalidad = l.idLocalidad
         AND l.idProvincia = p.idProvincia
         AND p.provincia LIKE '%Valencia%');
