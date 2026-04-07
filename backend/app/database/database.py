# database.py
import os
from psycopg2.pool import ThreadedConnectionPool
from dotenv import load_dotenv

# Charger les variables d'environnement depuis le fichier .env
load_dotenv()

# Créer le pool de connexions
connection_pool = ThreadedConnectionPool(
    1, 10,
    database=os.getenv("DB_NAME"),
    user=os.getenv("DB_USER"),
    host=os.getenv("DB_HOST"),
    password=os.getenv("DB_PASSWORD"),
    port=os.getenv("DB_PORT")
)