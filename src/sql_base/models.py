from typing import Optional
from pydantic import BaseModel


class animals(BaseModel):
    id: Optional[int]
    species: Optional[str]
    breed: Optional[str]
    moniker: Optional[int]
    owner: Optional[str]
    gender: Optional[str]
    date_of_birth: Optional[str]
    coloring: Optional[str]
    information: Optional[str]


class breeds(BaseModel):
    id: Optional[int]
    breed_code: Optional[int]
    types_of_animal: Optional[int]
    breed_name: Optional[int]


class User(BaseModel):
    login: str
    password: str


class Subjects(BaseModel):
    id: Optional[int]
    name: str
