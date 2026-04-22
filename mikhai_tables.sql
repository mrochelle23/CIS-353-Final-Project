CREATE TABLE Species (
    species_id NUMBER PRIMARY KEY,
    common_name VARCHAR2(100) NOT NULL,
    scientific_name VARCHAR2(100) NOT NULL,
    conservation_status VARCHAR2(50)
);

CREATE TABLE Observation (
    image_id NUMBER,
    observation_num NUMBER,
    species_count NUMBER NOT NULL CHECK (species_count > 0),
    behavior_type VARCHAR2(100),
    species_id NUMBER NOT NULL,
    PRIMARY KEY (image_id, observation_num),
    CONSTRAINT fk_obs_image
        FOREIGN KEY (image_id)
        REFERENCES Image(image_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_obs_species
        FOREIGN KEY (species_id)
        REFERENCES Species(species_id)
);


-- Populating Species data
INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES (501, 'White-tailed Deer', 'Odocoileus virginianus', 'Least Concern');

INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES (502, 'Coyote', 'Canis latrans', 'Least Concern');

INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES (503, 'Gray Wolf', 'Canis lupus', 'Endangered');


-- Populating Observation data
-- Multiple observations can exist for a single image
INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (101, 1, 2, 'Foraging', 501);

INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (101, 2, 1, 'Running', 502);

INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (103, 1, 1, 'Resting', 501);

-- adds another observation for the same image and species, but a 
-- different observation num
INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (103, 2, 2, 'Walking', 501);


INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (104, 1, 3, 'Socializing', 503);