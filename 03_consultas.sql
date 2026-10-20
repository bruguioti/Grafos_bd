-- Consulta 1: Vizinhos diretos da Alice (ID 1)
SELECT 
    n.rotulo AS vizinho,
    a.tipo AS relacionamento
FROM arestas a
JOIN nos n ON a.destino_id = n.id
WHERE a.origem_id = 1;

-- Consulta 2: Rede social expandida (CTE Recursiva - Amigos e amigos de amigos)
WITH RECURSIVE rede_social(id, rotulo, nivel, caminho) AS (
    SELECT id, rotulo, 0, '/' || rotulo
    FROM nos
    WHERE id = 1
    UNION
    SELECT n.id, n.rotulo, r.nivel + 1, r.caminho || ' -> ' || n.rotulo
    FROM rede_social r
    JOIN arestas a ON r.id = a.origem_id
    JOIN nos n ON a.destino_id = n.id
    WHERE r.nivel < 2
)
SELECT DISTINCT id, rotulo, nivel, caminho 
FROM rede_social;