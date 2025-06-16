CREATE TABLE rangers (
    ranger_id SERIAL,
    name VARCHAR(255),
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
    rangers (name, region)
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

-- Problem - 1
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');

-- Problem - 2
SELECT count(DISTINCT species_id) FROM sightings;

-- Problem - 3
SELECT * FROM sightings WHERE location ILIKE '%pass%';

-- Problem - 4
SELECT name, count(sighting_id)
FROM sightings
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY
    name;

-- Problem - 5
SELECT common_name
FROM species
    LEFT JOIN sightings ON species.species_id = sightings.species_id
WHERE
    sightings.species_id IS NULL;

-- Problem - 6
SELECT common_name, sighting_time, name
FROM
    sightings
    JOIN species ON sightings.species_id = species.species_id
    JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sighting_time DESC
LIMIT 2;

-- Problem - 7
UPDATE species
SET
    conservation_status = 'Historic'
WHERE
    extract(
        year
        FROM discovery_date
    ) < 1800;

-- Problem - 8
SELECT
    sighting_id,
    sighting_time,
    case
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) <= 12 THEN 'Morning'
        WHEN EXTRACT(
            HOUR
            FROM sighting_time
        ) <= 15 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings

-- Problem - 9
DELETE From rangers
WHERE
    ranger_id IN (
        SELECT rangers.ranger_id
        FROM rangers
            LEFT JOIN sightings ON rangers.ranger_id = sightings.ranger_id
        WHERE
            sightings.ranger_id IS NULL
    )