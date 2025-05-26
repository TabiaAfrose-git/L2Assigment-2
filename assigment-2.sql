-- Active: 1747857111152@@127.0.0.1@5432@conservation_db

--CREATE DATABASE conservation_db;
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name TEXT,
    region TEXT
);
CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name TEXT,
    scientific_name TEXT,
    discovery_date VARCHAR(20),
    conservation_status TEXT
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    species_id INT,
    Foreign Key(species_id) REFERENCES species (species_id),
    ranger_id INT,
    Foreign Key (ranger_id) REFERENCES rangers (ranger_id),
    location VARCHAR(20),
    sighting_time VARCHAR(30),
    notes TEXT
);
INSERT INTO rangers( name,region )
VALUES  ('Alice Green','Northern Hills'),
        ('Bob White', 'River Delta'),
        ('Carol King', 'Mountain Range');

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES  ('Snow Leopard', 'Panthera uncia', '1775-01-01','Endangered'),
        ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01','Endangered'),
        ('Red Panda', 'Ailurus fulgens', '1825-01-01','Vulnerable'),
        ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01','Endangered');

INSERT INTO sightings( species_id, ranger_id, location, sighting_time, notes)
VALUES (1, 1, 'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'),
     (2, 2, 'Bankwood Area','2024-05-12 16:20:00','Juvenile seen'),
     (3, 3, 'Bamboo Grove East','2024-05-15 09:10:00',' Feeding observed'),
     (1, 2, 'Snowfall Pass','2024-05-18 18:30:00',NULL);

--problem: 1
INSERT INTO rangers(name, region)
    VALUES ('Derek Fox', 'Coastal Plains');

--problem:2
SELECT COUNT(*) AS unique_species_count
    FROM (SELECT species_id FROM sightings GROUP BY species_id);

--problem: 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%' ;

--problem: 4
SELECT r.name, COUNT(s3.sighting_id) AS total_sightings FROM rangers r
    LEFT JOIN sightings s3 ON r.ranger_id = s3.ranger_id
    GROUP BY r.name;

--problem: 5
SELECT s2.common_name FROM species s2
    LEFT JOIN sightings s3
    ON s2.species_id = s3.species_id
    WHERE s3.sighting_id IS NULL;

--problem: 6
SELECT s3.common_name, s2.sighting_time, r.name FROM sightings s2
    JOIN species s3 ON s2.species_id = s3.species_id
    JOIN rangers r ON s2.ranger_id = r.ranger_id
    ORDER BY s2.sighting_time DESC
    LIMIT 2;

-- problem: 7
UPDATE species SET conservation_status = 'Historic'
    WHERE discovery_date < '1800-01-01';

--problem: 8
SELECT sighting_id,CASE
    WHEN EXTRACT(HOUR FROM sighting_time::timestamp) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time::timestamp) < 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;

--problem: 9
DELETE FROM rangers
    WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);


-------- show the table -----------
--SELECT * FROM rangers;
--SELECT * FROM species;
--SELECT * FROM sightings;

-------- Delete the table -----------
--DROP TABLE sightings;
--DROP TABLE species;
--DROP TABLE rangers;