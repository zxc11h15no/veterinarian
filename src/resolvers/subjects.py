from sql_base import base_worker
from sql_base import models


def new_subject(subject: models.Subjects, ) -> int:
    new_id = base_worker.insert_data("INSERT INTO Subjects(name) "
                                     "VALUES(?) "
                                     "RETURNING id",
                                     (subject.name,))
    return new_id
