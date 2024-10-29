from fastapi import FastAPI
from sqlalchemy import create_engine

app = FastAPI()

DATABASE_URL = "postgresql://postgres:password@db:5432/mydatabase"
engine = create_engine(DATABASE_URL)

@app.get("/")
def read_root():
    return {"Hello": "World"}
