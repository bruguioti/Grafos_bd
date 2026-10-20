-- Habilitar suporte a chaves estrangeiras no SQLite
PRAGMA foreign_keys = ON;

-- Tabela de Nós (Vértices)
CREATE TABLE IF NOT EXISTS nos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    rotulo TEXT NOT NULL,
    propriedades TEXT
);

-- Tabela de Arestas (Relacionamentos)
CREATE TABLE IF NOT EXISTS arestas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origem_id INTEGER NOT NULL,
    destino_id INTEGER NOT NULL,
    tipo TEXT NOT NULL,
    peso REAL DEFAULT 1.0,
    FOREIGN KEY (origem_id) REFERENCES nos(id) ON DELETE CASCADE,
    FOREIGN KEY (destino_id) REFERENCES nos(id) ON DELETE CASCADE
);

-- Índices de performance
CREATE INDEX IF NOT EXISTS idx_arestas_origem ON arestas(origem_id);
CREATE INDEX IF NOT EXISTS idx_arestas_destino ON arestas(destino_id);