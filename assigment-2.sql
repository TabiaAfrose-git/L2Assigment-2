-- Active: 1747857111152@@127.0.0.1@5432@conservation_db
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
SELECT * FROM sightings;