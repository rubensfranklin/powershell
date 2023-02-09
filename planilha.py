import pandas as pd
import json

# Leitura da planilha
df = pd.read_excel('planilha.xlsx', usecols=[0, 1])

# Criação de uma lista de dicionários com cada valor da coluna A como chave "host" e valor da coluna B como chave "ip"
data = [{"host": hostname, "ip": ip, "Labels": [{"dc": "ctmm2", "environment": "prod"}, {"public_ip": ip}]} for hostname, ip in zip(df.iloc[:, 0], df.iloc[:, 1])]

# Escrita da lista de dicionários no arquivo .json com uma quebra de linha para cada conjunto de chave e valor
with open('file.json', 'w') as json_file:
    json.dump(data, json_file, indent=2)
