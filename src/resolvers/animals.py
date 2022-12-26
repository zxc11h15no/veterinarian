from sql_base import base_worker
from sql_base import models


def new_animals(animals: models.animals) -> int:
    new_id = base_worker.insert_data(
        "INSERT INTO animals(species, breed, moniker, owner, gender, date_of_birth, coloring, information)"
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        "RETURNING id",
        (animals.species, animals.breed, animals.moniker, animals.owner, animals.gender, animals.date_of_birth,
         animals.coloring, animals.information))
    return new_id
