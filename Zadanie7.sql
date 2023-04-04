
CREATE OR REPLACE VIEW GET_EMPLOYEES_BY_DEP AS
SELECT e.*,d.department_name as DEP_NAME FROM employees e
JOIN departments d ON e.department_id = d.department_id;

SELECT * FROM GET_EMPLOYEES_BY_DEP WHERE DEP_NAME = 'Marketing';


CREATE OR REPLACE VIEW INSERT_NEW_ROW_REGIONS AS
SELECT region_id, region_name FROM regions;

INSERT INTO INSERT_NEW_ROW_REGIONS (region_id, region_name)
VALUES(5, 'Antarctica'); 

SAVEPOINT ROWS_INSERTING;

CREATE SEQUENCE GET_UNIQUE_INDEX
Minvalue 0
Maxvalue 99999
Start with 1
Increment by 1;

DROP SEQUENCE GET_UNIQUE_INDEX;

CREATE OR REPLACE VIEW DUPLICATE_DATA_REGIONS AS
SELECT (SELECT COUNT(*)FROM regions)
AS ROW_COUNT, region_name AS RN FROM regions;

INSERT INTO regions
SELECT (ROW_COUNT + GET_UNIQUE_INDEX.nextval),
RN FROM DUPLICATE_DATA_REGIONS;

ROLLBACK TO ROWS_INSERTING;


CREATE OR REPLACE VIEW MANAGERS_DEPARTMENTS AS
SELECT e1.employee_id, e1.first_name, e1.last_name, 
d.department_name FROM employees e1 JOIN departments d 
ON (e1.department_id = d.department_id) WHERE e1.employee_id IN
(SELECT DISTINCT e2.manager_id FROM employees e2);


CREATE OR REPLACE VIEW JOBS_WITH_EMPLOYEES AS
SELECT * FROM jobs WHERE job_id IN 
SELECT DISTINCT job_id FROM employees));


CREATE OR REPLACE VIEW SH_CLERKS_BETWEEN_91_06 AS
(SELECT  e.last_name, e.hire_date, e.job_id FROM employees e
WHERE (e.hire_date >= TO_DATE('01.01.1991', 'DD.MM.YYYY')) AND
(e.hire_date <= TO_DATE('01.01.2006', 'DD.MM.YYYY')) AND
(e.job_id = 'SH_CLERK'));


CREATE OR REPLACE VIEW EMP_INCREASED_SALARIES AS
(SELECT e.last_name, ROUND((e.salary + (e.salary / 100) * 20), 0)
"Salary + 20%" FROM employees e);  


CREATE OR REPLACE VIEW MANAGERS_EMPLOYEES AS
(SELECT manager_id, employee_id, first_name, last_name FROM employees)
ORDER BY (manager_id);


CREATE SEQUENCE SEQ_FROM_1_TO_4000
Minvalue 0
Maxvalue 4000
Start with 1
Increment by 1;


CREATE SEQUENCE SEQ_FROM_4000_TO_1
Minvalue 1
Maxvalue 99995
Start with 4000
Increment by 5;


CREATE TABLE CITIES(
   CITY_ID NUMBER,
   CITY_NAME VARCHAR2(25 BYTE),
   REGION_ID NUMBER,
CONSTRAINT CITY_FK FOREIGN KEY (REGION_ID)
REFERENCES REGIONS(REGION_ID)
);


ALTER TABLE CITIES ADD 
CONSTRAINT CITY_PK PRIMARY KEY (CITY_ID);


ALTER TABLE CITIES ADD
CONSTRAINT CITY_UK UNIQUE (CITY_NAME);


ALTER TABLE CITIES ADD
(DISTRICT VARCHAR2(25 BYTE));

CREATE INDEX CITY_DISTRICT_INDEX ON CITIES (DISTRICT);