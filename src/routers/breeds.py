from fastapi import APIRouter
from sql_base.models import breeds
import resolvers.breeds

breeds_router = APIRouter()


@breeds_router.get('/')
def get_breeds():
    return f'Response:{{text:Страница со списком пород}}'


@breeds_router.post("/create")
def new_breeds(breeds: breeds, ):
    new_id = resolvers.breeds.new_breeds(breeds)
    return f"{{code: 201, id: {new_id}}}"


@breeds_router.delete("/delete/{breeds_id}")
def delete_breeds(breeds_id: int):
    return f'delete breeds {breeds_id}'
