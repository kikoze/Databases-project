----------------------------------------------------------------------------------------------------
-- Project Assignment - Part 3 - queries.sql file
-- Contains the asked SQL Queries for the part 3 of the Project
----------------------------------------------------------------------------------------------------
-- 3. View
----------------------------------------------------------------------------------------------------
-- Create a view to get the supervisors and the number of substations that each one of them
-- supervises, without including supervisors that do not supervise any substation.
DROP VIEW IF EXISTS subs_supervised;

CREATE VIEW subs_supervised
AS SELECT sub.sname, sub.saddress, COUNT(sub.sname)
FROM substation sub INNER JOIN supervisor sup
ON sup.name=sub.sname
AND sup.address=sub.saddress
GROUP BY sub.sname, sub.saddress;

------------------------------------------------------------------------------------------------------
-- 4. SQL
------------------------------------------------------------------------------------------------------
-- 4.1. Who are the analysts that have analyzed every incident of element ‘B-789’?
SELECT DISTINCT temp.name
FROM(
    SELECT a.name, COUNT(a.name) AS count
    FROM analyses a
    GROUP BY a.id, a.name
    HAVING a.id LIKE 'B-789'
    ) AS temp
WHERE temp.count =(
    SELECT COUNT(i.id)
    FROM incident i
    GROUP BY i.id
    HAVING i.id LIKE 'B-789'
    );

-- 4.2. Who are the supervisors that do not supervise substations south of Rio Maior (Portugal) (Rio
-- Maior coordinates: 39.336775, -8.936379?
SELECT DISTINCT s.sname, s.saddress
FROM substation s
EXCEPT
SELECT s.sname, s.saddress
FROM substation s
WHERE s.gpslat < 39.336775;

-- 4.3. What are the elements with the smallest amount of incidents?
SELECT id
FROM incident
GROUP BY id
HAVING COUNT(*) <= ALL(
    SELECT COUNT(id)
    FROM incident
    GROUP BY id
    );

-- 4.4. How many substations does each supervisor supervise?
SELECT DISTINCT s.name, s.address, coalesce(subs.count, 0) AS count
FROM supervisor s
LEFT JOIN subs_supervised subs
ON subs.sname = s.name
AND subs.saddress = s.address
ORDER BY s.name ASC;

------------------------------------------------------------------------------------------------------
-- 6. Indexes
------------------------------------------------------------------------------------------------------
-- 6.1 Return the number of transformers with a given primary voltage by locality:
DROP INDEX IF EXISTS substation_locality_idx;

CREATE INDEX substation_locality_idx
ON substation(locality);

DROP INDEX IF EXISTS transformer_pv_idx;

CREATE INDEX transformer_pv_idx
ON transformer USING HASH(pv);

EXPLAIN
SELECT locality, COUNT(*)
FROM transformer
NATURAL JOIN substation
WHERE pv = 500
GROUP BY locality;

-- 6.2 List all descriptions of line incidents that start with a given prefix within two points in
-- time:
DROP INDEX IF EXISTS line_incident_description_instant_idx;

CREATE INDEX line_incident_description_instant_idx
ON incident(instant);

EXPLAIN
SELECT id, description
FROM incident
WHERE instant BETWEEN '2019-01-01 00:00:00' AND '2020-12-31 23:59:59'
AND description LIKE '%danificado%';
