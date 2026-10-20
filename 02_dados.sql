-- Inserindo os Nós
INSERT INTO nos (rotulo, propriedades) VALUES ('Alice', '{"idade": 25}');
INSERT INTO nos (rotulo, propriedades) VALUES ('Bruno', '{"idade": 30}');
INSERT INTO nos (rotulo, propriedades) VALUES ('Carla', '{"idade": 28}');
INSERT INTO nos (rotulo, propriedades) VALUES ('Diego', '{"idade": 22}');

-- Inserindo as Arestas (Relacionamentos)
INSERT INTO arestas (origem_id, destino_id, tipo, peso) VALUES 
(1, 2, 'AMIGO_DE', 1.0),
(1, 3, 'SEGUE', 0.5),
(2, 3, 'AMIGO_DE', 1.0),
(2, 4, 'AMIGO_DE', 1.0),
(3, 4, 'AMIGO_DE', 1.0);