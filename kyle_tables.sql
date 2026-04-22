-- Prerequisite: Camera must already exist before this script runs.
-- Location connects to Camera through camera_id.

CREATE TABLE Environment (
    environment_id NUMBER PRIMARY KEY,
    description VARCHAR2(200)
);

CREATE TABLE Location (
    location_id NUMBER PRIMARY KEY,
    location_name VARCHAR2(100) NOT NULL,
    camera_id NUMBER NOT NULL,
    environment_id NUMBER NOT NULL,
    CONSTRAINT fk_location_camera
        FOREIGN KEY (camera_id)
        REFERENCES Camera(camera_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_location_environment
        FOREIGN KEY (environment_id)
        REFERENCES Environment(environment_id)
);

-- Populate Environment
INSERT INTO Environment (environment_id, description)
VALUES (201, 'Dry northern forest habitat with dense tree cover.');

INSERT INTO Environment (environment_id, description)
VALUES (202, 'Marsh region with wetland vegetation and shallow water.');

INSERT INTO Environment (environment_id, description)
VALUES (203, 'Great Lakes plain habitat with mixed open and wooded areas.');

-- Populate Location
INSERT INTO Location (location_id, location_name, camera_id, environment_id)
VALUES (301, 'Michigan Dry Northern Forest', 1, 201);

INSERT INTO Location (location_id, location_name, camera_id, environment_id)
VALUES (302, 'Ohio Lake Erie Marsh Region', 2, 202);

INSERT INTO Location (location_id, location_name, camera_id, environment_id)
VALUES (303, 'Indiana Great Lakes Plain', 3, 203);
