CREATE DATABASE wildLife

CREATE TABLE rangers (
    ranger_id SERIAL,
    ranger_name VARCHAR(255),
    region VARCHAR(255)
);

CREATE TABLE species (
    species_id SERIAL,
    common_name VARCHAR(255),
    scientific_name VARCHAR(255),
    discovery_date DATE,
    conservation_status VARCHAR(255)
);

CREATE TABLE sightings (
    sighting_id SERIAL,
    ranger_id INT,
    species_id INT,
    sighting_time TIMESTAMP,
    location VARCHAR(255),
    notes VARCHAR(255)
);

INSERT INTO
    rangers (ranger_name, region)
VALUES (
        'Alice Green',
        'Northern Hills'
    ),
    ('Bob White', 'River Delta'),
    (
        'Carol King',
        'Mountain Range'
    );

INSERT INTO
    species (
        common_name,
        scientific_name,
        discovery_date,
        conservation_status
    )
VALUES (
        'Snow Leopard',
        'Panthera uncia',
        '1775-01-01',
        'Endangered'
    ),
    (
        'Bengal Tiger',
        'Panthera tigris',
        '1758-01-01',
        'Endangered'
    ),
    (
        'Red Panda',
        'Ailurus fulgens',
        '1825-01-01',
        'Endangered'
    ),
    (
        'Asiatic Elephant',
        'Elephas maximus indicus',
        '1758-01-01',
        'Endangered'
    );

INSERT INTO
    sightings (
        sighting_id,
        species_id,
        ranger_id,
        location,
        sighting_time,
        notes
    )
VALUES (
        1,
        1,
        1,
        'Peak Ridge',
        '2024-05-10 07:45:00',
        'Camera trap image captured'
    ),
    (
        2,
        2,
        2,
        'Bankwood Area',
        '2024-05-12 16:20:00',
        'Juvenile seen'
    ),
    (
        3,
        3,
        3,
        'Bamboo Grove East',
        '2024-05-15 09:10:00',
        'Feeding observed'
    ),
    (
        4,
        1,
        2,
        'Snowfall Pass',
        '2024-05-18 18:30:00',
        NULL
    );

SELECT * FROM rangers;

SELECT * FROM sightings;

SELECT * FROM species;

INSERT INTO
    rangers (ranger_name, region)
VALUES ('Derek Fox', 'Coastal Plains');

SELECT count(DISTINCT species_id) FROM sightings;

SELECT * FROM sightings WHERE location ILIKE '%pass%';

SELECT ranger_name, count(sighting_id)
FROM sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY
    ranger_name;

SELECT common_name
FROM species
    LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE
    sightings.species_id IS NULL;


SELECT common_name , sighting_time,ranger_name FROM sightings JOIN species ON sightings.species_id = species.species_id JOIN rangers ON sightings.ranger_id = rangers.ranger_id ORDER BY sighting_time DESC LIMIT 2;


UPDATE 