from sql_base import base_worker
from sql_base import models


def get_breeds(breeds_id: int):
    return base_worker.insert_data(
        "SELECT id, breed_code, types_of_animal, breed_name FROM breeds WHERE id =?",
        (breeds_id,))


def new_breeds(breeds: models.breeds) -> int:
    new_id = base_worker.insert_data(
        "INSERT INTO breeds(id, breed_code, types_of_animal, breed_name)"
        "VALUES (?, ?, ?, ?)"
        "RETURNING id",
        (breeds.id, breeds.breed_code, breeds.types_of_animal, breeds.breed_name))
    return new_id


def delete_breeds(breeds_id: int):
    return base_worker.execute(query="DELETE FROM breeds WHERE id=? ",
                               args=(breeds_id,))
