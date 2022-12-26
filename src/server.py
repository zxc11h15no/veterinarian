from fastapi import FastAPI
from sql_base import base_worker
from settings import BASE_PATH
from routers.animals import animals_router
from routers.subjects import subj_router

base_worker.set_base_path(BASE_PATH)

if not base_worker.check_base():
    base_worker.create_base('../sql/base.sql')

app = FastAPI()

app.include_router(animals_router, prefix='/animals')
app.include_router(subj_router, prefix='/subjects')
