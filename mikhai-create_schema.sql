-- Creating the SPECIES table
CREATE TABLE Species {
    species_id INT PRIMARY KEY,
    common_name VARCHAR2(100) NOT NULL,
    scientific_name VARCHAR2(100) NOT NULL,
    conservation_status VARCHAR2(50)
}

-- Creating the OBSERVATION table
-- Weak entity dependet on Image and Species
CREATE TABLE Observation {
    image_id INT,
    observation_num INT,
    species_count INT NOT NULL CHECK (scpecies_count > 0),
    behavior_type VARCHAR2(100),
    species_id INT NOT NULL,
    PRIMARY KEY (image_id, observation_num),
    CONSTRAINT fk_obs_image
        FOREIGN KEY (image_id)
        REFERENCES Image(image_id),
        ON DELETE CASCADE,
    CONSTRAINT fk_obs_species
        FOREIGN KEY (species_id)
        REFERENCES Species(species_id)
}
