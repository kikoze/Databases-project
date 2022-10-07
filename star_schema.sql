----------------------------------------------------------------------------------------------------
-- Project Assignment - Part 3 - star_schema.sql file
-- Contains the Multidimensional Star Schema implemented in SQL for the part 3 of the Project
----------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS d_reporter cascade;
DROP TABLE IF EXISTS d_time cascade;
DROP TABLE IF EXISTS d_location cascade;
DROP TABLE IF EXISTS d_element  cascade;
DROP TABLE IF EXISTS f_incident  cascade;

CREATE TABLE d_reporter(
    id_reporter VARCHAR(10),
    name VARCHAR(80) NOT NULL,
    address VARCHAR(80) NOT NULL,
    PRIMARY KEY(id_reporter)
);

CREATE TABLE d_time(
    id_time VARCHAR(10),
    day INT NOT NULL,
    week_day INT NOT NULL,
    week INT NOT NULL,
    month INT NOT NULL,
    trimester INT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id_time)
);

CREATE TABLE d_location(
    id_location VARCHAR(10),
    latitude NUMERIC(9,6) NOT NULL,
    longitude NUMERIC(8,6) NOT NULL,
    locality VARCHAR(80) NOT NULL,
    PRIMARY KEY(id_location)
);

CREATE TABLE d_element(
    id_element VARCHAR(10),
    element_id VARCHAR(10) NOT NULL,
    element_type VARCHAR(80) NOT NULL,
    PRIMARY KEY(id_element)
);

CREATE TABLE f_incident(
    id_reporter VARCHAR(10),
    id_time VARCHAR(10),
    id_location VARCHAR(10),
    id_element VARCHAR(10),
    severity VARCHAR(20),
    PRIMARY KEY(id_reporter, id_time, id_location, id_element),
    FOREIGN KEY(id_reporter) REFERENCES d_reporter(id_reporter),
    FOREIGN KEY(id_time) REFERENCES d_time(id_time),
    FOREIGN KEY(id_location) REFERENCES d_location(id_location),
    FOREIGN KEY(id_element) REFERENCES d_element(id_element)
);