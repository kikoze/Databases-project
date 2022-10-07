----------------------------------------------------------------------------------------------------
-- Project Assignment - Part 3 - olap.sql file
-- Contains the asked Data Analytics Queries for the part 3 of the Project
----------------------------------------------------------------------------------------------------
-- using Grouping Sets
SELECT severity, locality, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY GROUPING SETS (severity, locality, week_day);

-- using Rollup
SELECT severity, locality, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY ROLLUP (severity, locality, week_day);

-- using Cube
SELECT severity, locality, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY CUBE (severity, locality, week_day);

-- using Union of Group By clauses
SELECT severity, locality, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY severity, locality, week_day
UNION
SELECT severity, locality, NULL, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY severity, locality
UNION
SELECT severity, NULL, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY severity, week_day
UNION
SELECT NULL, locality, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY locality, week_day
UNION
SELECT NULL, NULL, week_day, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY week_day
UNION
SELECT NULL, locality, NULL, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY locality
UNION
SELECT severity, NULL, NULL, COUNT(*)
FROM f_incident i
INNER JOIN d_location l
ON i.id_location = l.id_location
INNER JOIN d_time t
ON i.id_time = t.id_time
GROUP BY severity;
