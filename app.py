import sqlite3

# Criar/conectar ao banco de dados SQLite local
conn = sqlite3.connect("grafo.db")
cursor = conn.cursor()

# Executar scripts externos para montar o banco
with open("01_schema.sql", "r", encoding="utf-8") as f:
  cursor.executescript(f.read())

with open("02_dados.sql", "r", encoding="utf-8") as f:
  cursor.executescript(f.read())

print("Banco de dados de grafos criado e populado com sucesso!\n")

# Exemplo de execução de query via Python
query = """
    SELECT n.rotulo, a.tipo 
    FROM arestas a
    JOIN nos n ON a.destino_id = n.id
    WHERE a.origem_id = ?
"""

cursor.execute(query, (1,))
print("Conexões diretas a partir do nó 1 (Alice):")
for row in cursor.fetchall():
  print(f"- Conectado a {row[0]} via {row[1]}")

conn.close()