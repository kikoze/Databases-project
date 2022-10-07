----------------------------------------------------------------------------------------------------
-- Project Assignment - Part 3 - RI.sql file
-- Contains the Integrity Constraints implemented in SQL for the part 3 of the Project
----------------------------------------------------------------------------------------------------
-- (IC1) For every transformer, pv must correspond to the voltage of the busbar identified by pbbid
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION p_voltage()
RETURNS TRIGGER
AS $$
    BEGIN
        IF NEW.pv NOT IN(
            SELECT b.voltage
            FROM busbar b
            WHERE b.id = NEW.pbbid)
            THEN
            RAISE EXCEPTION 'A voltagem do primário deve corresponder à voltagem do busbar correspondente';
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS p_voltage ON transformer;

CREATE TRIGGER p_voltage
BEFORE INSERT ON transformer
FOR EACH ROW EXECUTE PROCEDURE p_voltage();

----------------------------------------------------------------------------------------------------
-- (IC2) For every transformer, sv must correspond to the voltage of the busbar identified by sbbid
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION s_voltage()
RETURNS TRIGGER
AS $$
    BEGIN
        IF NEW.sv NOT IN(
            SELECT b.voltage
            FROM busbar b
            WHERE b.id = NEW.sbbid)
            THEN
            RAISE EXCEPTION 'A voltagem do secundário deve corresponder à voltagem do busbar correspondente';
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS s_voltage ON transformer;

CREATE TRIGGER s_voltage
BEFORE INSERT ON transformer
FOR EACH ROW EXECUTE PROCEDURE s_voltage();

----------------------------------------------------------------------------------------------------
-- (IC5) For every analysis concerning a transformer, the name, address values cannot coincide with
-- sname, saddress values of the substation where the transformer is located
----------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION analyst_supervisor()
RETURNS TRIGGER
AS $$
    BEGIN
        IF(EXISTS(
            SELECT DISTINCT temp.sname, temp.saddress
            FROM(
                substation s INNER JOIN transformer t
                ON s.gpslat=t.gpslat
                AND s.gpslong=t.gpslong
                ) AS temp
            WHERE temp.id = NEW.id
            AND temp.sname = NEW.name
            AND temp.saddress = NEW.address))
            THEN
            RAISE EXCEPTION 'Um analista não pode analisar um elemento que esteja na subestação que supervisiona';
        END IF;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS analyst_supervisor ON analyses;

CREATE TRIGGER analyst_supervisor
BEFORE INSERT ON analyses
FOR EACH ROW EXECUTE PROCEDURE analyst_supervisor();