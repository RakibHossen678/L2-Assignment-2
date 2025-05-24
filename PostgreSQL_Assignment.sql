CREATE DATABASE wildLife

CREATE TABLE rangers (
    ranger_id SERIAL,
    ranger_name VARCHAR(255),
    region VARCHAR(255)
);

CREATE TABLE species (
    species_id SERIAL,
    common_name TEXT,
    scientific_name TEXT,
    dicovery_date DATE,
    conservation_status TEXT
);

CREATE TABLE sightings (
    sighting_id SERIAL,
    ranger_id INT,
    species_id INT,
    sighting_time TIMESTAMP,
    location TEXT,
    notes TEXT
);