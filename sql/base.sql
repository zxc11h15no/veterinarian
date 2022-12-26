CREATE TABLE IF NOT EXISTS animals(
    id            INTEGER PRIMARY KEY,
    species       VARCHAR(100) NOT NULL,
    breed         VARCHAR(100) NOT NULL,
    moniker       VARCHAR(20)  NOT NULL,
    owner         VARCHAR(100) NOT NULL,
    gender        VARCHAR(100) NOT NULL,
    date_of_birth DATE         NOT NULL,
    coloring      VARCHAR(100) NOT NULL,
    information   VARCHAR(100) NOT NULL,
    FOREIGN KEY (species)
        REFERENCES species_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (breed)
        REFERENCES breed_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (owner)
        REFERENCES client_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS types_of_animals(
    id           INTEGER PRIMARY KEY,
    species_code INTEGER NOT NULL,
    species_name VARCHAR(100));


CREATE TABLE IF NOT EXISTS breeds(
    id              INTEGER PRIMARY KEY,
    breed_code      VARCHAR(100) NOT NULL,
    types_of_animal VARCHAR(100) NOT NULL,
    breed_name      VARCHAR(100) NOT NULL,
    FOREIGN KEY (types_of_animal)
        REFERENCES species_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS client(
    id           INTEGER PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    address      VARCHAR(100) NOT NULL,
    phone_number INTEGER      NOT NULL,
    email        VARCHAR(100) NOT NULL);

CREATE TABLE IF NOT EXISTS visit_log(
    id          INTEGER PRIMARY KEY,
    the_date    DATE         NOT NULL,
    client      VARCHAR(100) NOT NULL,
    animal_code INTEGER      NOT NULL,
    FOREIGN KEY (animal_code)
        REFERENCES types_of_animals (id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (client)
        REFERENCES client_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS medicines(
    id          INTEGER PRIMARY KEY,
    name        VARCHAR(15)  NOT NULL,
    description VARCHAR(100) NOT NULL);


CREATE TABLE IF NOT EXISTS used_medicines(
    id               INTEGER PRIMARY KEY,
    in_the_visit_log VARCHAR(100) NOT NULL,
    medication_code  INTEGER      NOT NULL,
    price            INTEGER      NOT NULL,
    amount           INTEGER,
    FOREIGN KEY (medication_code)
        REFERENCES medication_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (in_the_visit_log)
        REFERENCES in_the_log (id)
        ON DELETE SET NULL ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS service(
    id               INTEGER PRIMARY KEY,
    in_the_visit_log VARCHAR(100) NOT NULL,
    employee         VARCHAR(100) NOT NULL,
    servise_code     INTEGER      NOT NULL,
    quantity         VARCHAR(100) NOT NULL,
    FOREIGN KEY (in_the_visit_log)
        REFERENCES in_the_log (id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (servise_code)
        REFERENCES service_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION,
    FOREIGN KEY (employee)
        REFERENCES employees_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS services(
    id    INTEGER PRIMARY KEY,
    name  VARCHAR(15) NOT NULL,
    price INTEGER     NOT NULL);


CREATE TABLE IF NOT EXISTS employees(
    id           INTEGER PRIMARY KEY,
    full_name    VARCHAR(100) NOT NULL,
    address      VARCHAR(100) NOT NULL,
    phone_number INTEGER      NOT NULL,
    email        VARCHAR(100) NOT NULL,
    job_title    VARCHAR(100) NOT NULL,
    FOREIGN KEY (job_title)
        REFERENCES job_title_code (id)
        ON DELETE SET NULL ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS job_title(
    id    INTEGER PRIMARY KEY,
    named VARCHAR(15) NOT NULL);

INSERT INTO animals(species, breed, moniker, owner, gender, date_of_birth, coloring, information)
VALUES ('species', 'breed', 'moniker', 'owner', 'gender', 'date_of_birth', 'coloring', 'information'),
       ('species1', 'breed1', 'moniker1', 'owner1', 'gender1', 'date_of_birth1', 'coloring1', 'information1');

INSERT INTO types_of_animals(species_code, species_name)
VALUES ('species_code', 'species_name'),
       ('species_code1', 'species_name1');

INSERT INTO breeds(breed_code, types_of_animal, breed_name)
VALUES ('breed_code', 'types_of_animal', 'breed_code'),
       ('breed_code1', 'types_of_animal1', 'breed_code1');

INSERT INTO client(full_name, address, phone_number, email)
VALUES ('full_name', 'address', 'phone_number', 'email'),
       ('full_name1', 'address1', 'phone_number1', 'email1');

INSERT INTO visit_log(the_date, client, animal_code)
VALUES ('the_date', 'client', 'animal_code'),
       ('the_date1', 'client1', 'animal_code1');

INSERT INTO medicines(name, description)
VALUES ('name', 'description'),
       ('name1', 'description1');

INSERT INTO used_medicines(in_the_visit_log, medication_code, price, amount)
VALUES ('in_the_visit_log', 'medication_code', 'price', 'amount'),
       ('in_the_visit_log1', 'medication_code1', 'price1', 'amount1');

INSERT INTO service(in_the_visit_log, employee, servise_code, quantity)
VALUES ('in_the_visit_log', 'employee', 'servise_code', 'quantity'),
       ('in_the_visit_log1', 'employee1', 'servise_code1', 'quantity1');

INSERT INTO services(name, price)
VALUES ('name', 'price'),
       ('name1', 'price1');

INSERT INTO employees(full_name, address, phone_number, email, job_title)
VALUES ('full_name', 'address', 'phone_number', 'email', 'job_title'),
       ('full_name1', 'address1', 'phone_number1', 'email1', 'job_title1');

INSERT INTO job_title(named)
VALUES ('named'),
       ('named1');





















