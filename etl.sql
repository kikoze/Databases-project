----------------------------------------------------------------------------------------------------
-- Project Assignment - Part 3 - etl.sql file
-- Script used to populate the star schema database from the part 3 of the Project
----------------------------------------------------------------------------------------------------
-- erase data
TRUNCATE d_reporter CASCADE;
TRUNCATE d_time CASCADE;
TRUNCATE d_location CASCADE;
TRUNCATE d_element CASCADE;
TRUNCATE f_incident CASCADE;

-- insert d_reporter
DROP FUNCTION load_reporter_dim();

CREATE OR REPLACE FUNCTION load_reporter_dim()
RETURNS VOID AS
$$
DECLARE reporter_id INTEGER;
DECLARE t_row analyst%rowtype;
BEGIN
    reporter_id := 1;
    FOR t_row in SELECT * FROM analyst LOOP
        INSERT INTO d_reporter(
            id_reporter,
            name,
            address
        )VALUES(
            reporter_id,
            t_row.name,
            t_row.address
        );
        reporter_id := reporter_id + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT load_reporter_dim();

-- insert d_time
DROP FUNCTION load_time_dim();

CREATE OR REPLACE FUNCTION load_time_dim()
RETURNS VOID AS
$$
DECLARE instant TIMESTAMP;
BEGIN
    instant := '2019-12-01 00:00:00';
    WHILE instant < '2021-01-01 00:00:00' LOOP
        INSERT INTO d_time(
            id_time,
            day,
            week_day,
            week,
            month,
            trimester,
            year
        )VALUES(
            EXTRACT(YEAR FROM instant)*10000
                + EXTRACT(MONTH FROM instant)*100
                + EXTRACT(DAY FROM instant),
            CAST(EXTRACT(DAY FROM instant) AS INTEGER),
            EXTRACT(isodow FROM instant),
            CAST(EXTRACT(WEEK FROM instant) AS INTEGER),
            CAST(EXTRACT(MONTH FROM instant) AS INTEGER),
            CASE WHEN EXTRACT(MONTH FROM instant) <= 3 THEN 1
                WHEN EXTRACT(MONTH FROM instant) <= 6 THEN 2
                WHEN EXTRACT(MONTH FROM instant) <= 9 THEN 3
                ELSE 4 END,
            CAST(EXTRACT(YEAR FROM instant) AS INTEGER)
        );
        instant := instant + INTERVAL '1 DAY';
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT load_time_dim();

-- insert d_location
DROP FUNCTION load_location_dim();

CREATE OR REPLACE FUNCTION load_location_dim()
RETURNS VOID AS
$$
DECLARE location_id INTEGER;
DECLARE t_row substation%rowtype;
BEGIN
    location_id := 1;
    FOR t_row in SELECT * FROM substation LOOP
        INSERT INTO d_location(
            id_location,
            latitude,
            longitude,
            locality
        )VALUES(
            location_id,
            t_row.gpslat,
            t_row.gpslong,
            t_row.locality
        );
        location_id := location_id + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT load_location_dim();

-- insert d_element
DROP FUNCTION load_element_dim();

CREATE OR REPLACE FUNCTION load_element_dim()
RETURNS VOID AS
$$
DECLARE element_id INTEGER;
DECLARE t_row element%rowtype;
BEGIN
    element_id := 1;
    FOR t_row in SELECT * FROM element LOOP
        INSERT INTO d_element(
            id_element,
            element_id,
            element_type
        )VALUES(
            element_id,
            t_row.id,
            CASE WHEN SUBSTRING(t_row.id, 1, 1) LIKE 'T' THEN 'Transformer'
                WHEN SUBSTRING(t_row.id, 1, 1) LIKE 'L' THEN 'Line'
                WHEN SUBSTRING(t_row.id, 1, 1) LIKE 'B' THEN 'Bus Bar'
            END
        );
        element_id := element_id + 1;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT load_element_dim();

-- insert f_incident
INSERT INTO f_incident
SELECT DISTINCT id_reporter, id_time, id_location, id_element, severity
FROM incident I
    INNER JOIN analyses A
        ON I.id = A.id
    INNER JOIN transformer T
        ON I.id = T.id
        OR I.id = T.sbbid
        OR I.id = T.pbbid
    LEFT OUTER JOIN d_reporter D1
        ON D1.name = A.name
    LEFT OUTER JOIN d_time D2
        ON D2.day = CAST(EXTRACT(DAY FROM I.instant) AS INTEGER)
        AND D2.month = CAST(EXTRACT(MONTH FROM I.instant) AS INTEGER)
        AND D2.year = CAST(EXTRACT(YEAR FROM I.instant) AS INTEGER)
    LEFT OUTER JOIN d_location D3
        ON D3.latitude = T.gpslat
        AND D3.longitude = T.gpslong
    LEFT OUTER JOIN d_element D4
        ON D4.element_id = I.id
UNION
SELECT DISTINCT id_reporter, id_time, id_location, id_element, severity
FROM incident I
    INNER JOIN analyses A
        ON I.id = A.id
    INNER JOIN line L
        ON I.id = L.id
    INNER JOIN transformer T
        ON L.pbbid = T.sbbid
    LEFT OUTER JOIN d_reporter D1
        ON D1.name = A.name
    LEFT OUTER JOIN d_time D2
        ON D2.day = CAST(EXTRACT(DAY FROM I.instant) AS INTEGER)
        AND D2.month = CAST(EXTRACT(MONTH FROM I.instant) AS INTEGER)
        AND D2.year = CAST(EXTRACT(YEAR FROM I.instant) AS INTEGER)
    LEFT OUTER JOIN d_location D3
        ON D3.latitude = T.gpslat
        AND D3.longitude = T.gpslong
    LEFT OUTER JOIN d_element D4
        ON D4.element_id = I.id;