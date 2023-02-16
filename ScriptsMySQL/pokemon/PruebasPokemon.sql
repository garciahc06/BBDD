-- devuelveme tdo lo que pesan todos lo pokemon de tipo eléctrico
SELECT SUM(p.peso) AS Peso_Total, t.nombre
FROM pokemon AS p,
     pokemon_tipo AS pt,
     tipo AS t
WHERE p.numero_pokedex = pt.numero_pokedex
  AND pt.id_tipo = t.id_tipo
  AND t.nombre = 'Electrico';

-- muestra el número de pokemon y su evolucion
SELECT po.nombre, pe.nombre
FROM pokemon AS po,
     evoluciona_de AS ed,
     pokemon AS pe
WHERE po.numero_pokedex = ed.pokemon_origen
  AND pe.numero_pokedex = ed.pokemon_evolucionado;

-- cual es el pokemon que tiene menor ataque de estadistica_base
SELECT p.numero_pokedex, p.nombre
FROM pokemon AS p,
     estadisticas_base AS eb
WHERE p.numero_pokedex = eb.numero_pokedex
ORDER BY eb.ataque
LIMIT 1;

SELECT p.numero_pokedex, p.nombre
FROM pokemon AS p,
     estadisticas_base AS eb
WHERE eb.ataque = (SELECT MIN(ataque) FROM estadisticas_base);

-- pokemon con ataque aprendido a partir de MO
SELECT p.numero_pokedex, p.nombre, tfa.tipo_aprendizaje
FROM pokemon AS p,
     pokemon_movimiento_forma AS pmf,
     forma_aprendizaje AS fa,
     tipo_forma_aprendizaje AS tfa
WHERE p.numero_pokedex = pmf.numero_pokedex
  AND pmf.id_forma_aprendizaje = fa.id_forma_aprendizaje
  AND fa.id_tipo_aprendizaje = tfa.id_tipo_aprendizaje
  AND tfa.tipo_aprendizaje = 'MO';

-- pokemon con ataque veneno
select p.nombre, m.nombre, t.nombre
from pokemon p,
     pokemon_movimiento_forma pmf,
     movimiento m,
     tipo t
where p.numero_pokedex = pmf.numero_pokedex
  and pmf.id_movimiento = m.id_movimiento
  and m.id_tipo = t.id_tipo
  and t.nombre = 'veneno';

-- todos los pokemon que evolucionan con piedra x
SELECT p.numero_pokedex, p.nombre, te.tipo_evolucion
FROM pokemon AS p,
     pokemon_forma_evolucion AS pfe,
     piedra AS pi,
     tipo_piedra AS tp,
     forma_evolucion AS fe,
     tipo_evolucion AS te
WHERE p.numero_pokedex = pfe.numero_pokedex
  AND pfe.id_forma_evolucion = fe.id_forma_evolucion
  AND fe.tipo_evolucion = te.id_tipo_evolucion
  AND fe.id_forma_evolucion = pi.id_forma_evolucion
  AND pi.id_tipo_piedra = tp.id_tipo_piedra
  AND te.tipo_evolucion = 'Piedra';

-- pokemon con ataque tipo especial
SELECT p.numero_pokedex, p.nombre, ta.tipo
FROM pokemon AS p,
     pokemon_tipo AS pt,
     tipo AS t,
     tipo_ataque AS ta
WHERE p.numero_pokedex = pt.numero_pokedex
  AND pt.id_tipo = t.id_tipo
  AND t.id_tipo_ataque = ta.id_tipo_ataque
  AND ta.tipo = 'Especial';

-- calcula imc pokemon
SELECT p.*, p.peso / (p.altura * p.altura) AS IMC
FROM pokemon AS p
ORDER BY IMC DESC;

