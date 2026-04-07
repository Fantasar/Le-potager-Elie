from fastapi import FastAPI
from database.database import connection_pool

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}