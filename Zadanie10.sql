--1
CREATE OR REPLACE TRIGGER add_row
    BEFORE INSERT
    ON EMPLOYEES
BEGIN
DBMS_OUTPUT.PUT_LINE('Dodano nowego pracownika do tabeli employees');
END;

--2
create or replace trigger boss_check
after update of salary on employees
for each row
declare
wyplata number(4);
begin
select salary into wyplata from employees
where employee_id=:old.manager_id;
if :new.salary>wyplata
then raise_application_error(
-20020,'pensja pracownika > pensja szefa - kto to widzial?!');
end if;
end;

--3
create or replace trigger slary
after update of min_salary on jobs
for each row
declare
min_wyplata number(4);
begin
select min_salary into min_wyplata from jobs;
if :new.min_salary>min_wyplata
then raise_application_error(
-20020,'salary');
end if;
end;

