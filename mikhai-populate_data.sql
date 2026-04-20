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

INSERT INTO Observation (image_id, observation_num, species_count, behavior_type, species_id)
VALUES (104, 1, 3, 'Socializing', 503);