-- Q1 - Self Join
-- Compare the Observation table to itseld to find instanced where the same species
-- was recorded multiple times ina single image with different behavior types
SELECT
    A.image_id,
    A.species_id,
    A.behavior_type AS behavior_one,
    B.behavior_type AS behavior_two
FROM
    Observation A
JOIN
    Observation B ON A.image_id = B.image_id
    AND A.species_id = B.species_id
WHERE
    A.observation_id < B.observation_id; -- Avoid self-joining the same record and duplicate pairs


-- Q2 - Join involving four relations
-- Retreives the common name of species, the behavior observed,
-- the model of the camera that cpatured it, and the location of that camera
SELECT
    S.common_name,
    O.behavior_type,
    C.model,
    C.location
FROM
    Species S
JOIN
    Observation O ON S.species_id = O.species_id
JOIN
    Image I ON O.image_id = I.image_id
JOIN
    Camera C ON I.camera_id = C.camera_id;
ORDER BY
    S.common_name; -- Order results by common name of species


-- Q3 - GROUP BY, HAVING, and ORDER BY
-- Shows species that have been observed more than once across all images
-- ordered by the total number of individuals seen
SELECT
    S.common_name,
    SUM(O.species_count) AS total_count,
    COUNT(O.observation_num) AS observation_frequency
FROM
    Species S
JOIN
    Observation O ON S.species_id = O.species_id
GROUP BY
    S.common_name
HAVING
    COUNT(O.observation_num) > 0 -- Only include species observed more than zero times
ORDER BY
    total_count DESC; -- Order by total count of individuals seen, highest first


-- Q4 - Non-correlated subquery
-- Lists all images that contain observations of species classified as "Endangered"
SELECT
    I.image_id,
    capture_timestamp
FROM
    Image
WHERE
    image_id IN (
        SELECT O.image_id
        FROM Observation O
        JOIN Species S ON O.species_id = S.species_id
        WHERE S.conservation_status = 'Endangered'
    );


-- Q5 - UNION
-- Combines a list of species foun in 'Cloud' storage images
-- with those found in 'Local' storage images
SELECT S.common_name
FROM Species S
JOIN Observation O ON S.species_id = O.species_id
JOIN Image I ON O.image_id = I.image_id
WHERE I.storage_type = 'Cloud'
UNION
SELECT S.common_name
FROM Species S
JOIN Observation O ON S.species_id = O.species_id
JOIN Image I ON O.image_id = I.image_id
WHERE I.storage_type = 'Local'


-- Q6 6 - SUM, AVG, MAX, MIN
-- Provides statistics on the number of animals per observation
SELECT
    SUM(species_count) AS total_animals,
    AVG(species_count) AS average_per_obs,
    MAX(species_count) AS largest_group,
    MIN(species_count) AS smallest_group
FROM
    Observation;