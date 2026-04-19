CREATE TABLE Environment (
    environment_id INT PRIMARY KEY,
    description TEXT
);

CREATE TABLE Location (
    location_id INT,
    location_name VARCHAR(100),
    camera_id INT NOT NULL,
    environment_id INT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    PRIMARY KEY (location_id, location_name),
    FOREIGN KEY (camera_id) REFERENCES Camera(camera_id)
        ON DELETE CASCADE,
    FOREIGN KEY (environment_id) REFERENCES Environment(environment_id)
);
