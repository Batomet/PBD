SELECT LOWER(FIRST_NAME), UPPER(LAST_NAME) FROM employees;
SELECT LOWER(LAST_NAME), INITCAP(LAST_NAME) FROM employees;
SELECT SUBSTR(LAST_NAME, 3,6) FROM employees;
SELECT TO_NUMBER(SALARY, '99999.00') FROM employees;
SELECT LAST_NAME, LENGTH(LAST_NAME) FROM employees;
SELECT MONTHS_BETWEEN
       (TO_DATE('30-09-2015','DD-MM-YYYY'),
        TO_DATE('01-01-2013','DD-MM-YYYY') )"Months" FROM DUAL;
SELECT LAST_DAY(TO_DATE('2024-02-01', 'YYYY-MM-DD')) "Last day" FROM DUAL;
SELECT ROUND(TO_DATE(ADD_MONTHS(SYSDATE,175)), 'YEAR') "New Date" FROM DUAL;
SELECT manager_id, MAX(SALARY) FROM employees GROUP BY manager_id;
SELECT department_id, MAX(SALARY) FROM employees GROUP BY department_id ORDER BY department_id ASC;
SELECT DISTINCT AVG(SALARY), department_id FROM employees GROUP BY department_id;
SELECT department_id, MAX(SALARY) FROM employees WHERE department_id IN(50, 60, 70) GROUP BY department_id;
SELECT department_id, MIN(SALARY) FROM employees WHERE LAST_NAME LIKE '%e%' GROUP BY department_id;
SELECT manager_id, department_id, AVG(SALARY), SUM(SALARY) FROM employees GROUP BY manager_id, department_id;
SELECT manager_id, department_id, AVG(SALARY), SUM(SALARY) FROM employees WHERE department_id IN(50,60,70) GROUP BY manager_id, department_id;