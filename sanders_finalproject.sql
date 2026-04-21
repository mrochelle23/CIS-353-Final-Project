-- Create tables
CREATE TABLE Environment (
    environment_id INT PRIMARY KEY,
    description TEXT
);

CREATE TABLE Location (
    location_id INT,
    location_name VARCHAR(100),
    camera_id INT NOT NULL,
    environment_id INT,
    PRIMARY KEY (location_id, location_name),
    FOREIGN KEY (camera_id) REFERENCES Camera(camera_id)
        ON DELETE CASCADE,
    FOREIGN KEY (environment_id) REFERENCES Environment(environment_id)
);

-- Populate tables
--INSERT INTO Environment (environment_id, description), here for reference
INSERT INTO Environment VALUES(201, )
INSERT INTO Environment VALUES(202, )
INSERT INTO Environment VALUES(203, )

-- INSERT INTO Location (location_id, location_name, camera_id, environment_id)
INSERT INTO Location VALUES(301, , ,)
INSERT INTO Location VALUES(302, , ,)
INSERT INTO Location VALUES(303, , ,)
-- Queries
