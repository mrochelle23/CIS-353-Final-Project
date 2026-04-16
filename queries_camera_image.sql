CREATE TABLE Camera ( 
    camera_id NUMBER PRIMARY KEY,
    location VARCHAR2(100) NOT NULL,
    deployment_date DATE NOT NULL,
    operational_status VARCHAR(20) CHECK (operational_status IN ('Active', 'Inactive', 'Maintenance')),
    model_type VARCHAR2(50) NOT NULL
);

CREATE TABLE Image (
    image_id NUMBER PRIMARY KEY,
    camera_id NUMBER NOT NULL, 
    capture_timestamp DATE NOT NULL,
    storage_location varchar2(255), 
    storage_type VARCHAR2(20) CHECK (storage_type IN ('Cloud', 'Local', 'Database')),
    CONSTRAINT fk_camera
        FOREIGN KEY (camera_id)
        REFERENCES Camera(camera_id)
);

-- populate Camera with data 
INSERT INTO Camera VALUES (1, 'Michigan Dry Northern Forest', DATE '2025-01-10', 'Active', 'Bushnell X');
INSERT INTO Camera VALUES (2, 'Ohio Laker Erie Marsh Region', DATE '2025-02-15', 'Inactive', 'Reconyx HyperFire');
INSERT INTO Camera VALUES (3, 'Indiana Great Lakes Plain', DATE '2025-03-01', 'Active', 'Bushnell X');

-- populate Image with data
INSERT INTO Image VALUES (101, 1, TO_DATE('2025-03-10 14:30','YYYY-MM-DD HH24:MI'), '/cloud/img101.jpg', 'Cloud');
INSERT INTO Image VALUES (102, 1, TO_DATE('2025-03-11 09:15','YYYY-MM-DD HH24:MI'), '/local/img102.jpg', 'Local');
INSERT INTO Image VALUES (103, 2, TO_DATE('2025-03-12 20:45','YYYY-MM-DD HH24:MI'), '/cloud/img103.jpg', 'Cloud');
INSERT INTO Image VALUES (104, 3, TO_DATE('2025-03-13 06:10','YYYY-MM-DD HH24:MI'), '/db/img104.jpg', 'Database');
INSERT INTO Image VALUES (105, 3, TO_DATE('2025-03-14 08:00','YYYY-MM-DD HH24:MI'), '/cloud/img105.jpg', 'Cloud');

