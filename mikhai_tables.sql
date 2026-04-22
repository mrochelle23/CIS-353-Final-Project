-- Prerequisite: Camera and Image must already exist before this script runs.
-- Observation connects to Camera indirectly through Image:
-- Observation.image_id -> Image.image_id -> Image.camera_id -> Camera.camera_id

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Observation CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Species CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create Species table
CREATE TABLE Species (
    species_id NUMBER PRIMARY KEY,
    common_name VARCHAR2(100) NOT NULL,
    scientific_name VARCHAR2(100) NOT NULL,
    conservation_status VARCHAR2(50)
);

-- Create Observation table
-- Observation depends on Image and Species
CREATE TABLE Observation (
    image_id NUMBER NOT NULL,
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

-- Populate Species with data
INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES (501, 'White-tailed Deer', 'Odocoileus virginianus', 'Least Concern');

INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES (502, 'Coyote', 'Canis latrans', 'Least Concern');

INSERT INTO Species (species_id, common_name, scientific_name, conservation_status)
VALUES (503, 'Gray Wolf', 'Canis lupus', 'Endangered');

-- Populate Observation with data
-- image_id values must already exist in the Image table
INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (101, 1, 2, 'Foraging', 501);

INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (101, 2, 1, 'Running', 502);

INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (103, 1, 1, 'Resting', 501);

INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (104, 1, 3, 'Socializing', 503);

-- Verify loaded data
SELECT * FROM Species;
SELECT * FROM Observation;
