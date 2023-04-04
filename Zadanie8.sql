SET SERVEROUTPUT ON
DECLARE
TYPE dane IS RECORD
(
liczb1 INT,
liczb2 INT
);
r_dane dane;
BEGIN
r_dane.liczb1 :=5;
r_dane.liczb2 :=3;
IF(r_dane.liczb1>r_dane_liczb2) THEN
r_dane.liczb1:= r_dane.liczb1-r_dane.liczb2;
ELSE
r_dane.liczb2:=r_dane.liczb2-r_dane.liczb1;
END IF;
DBMS_OUTPUT.PUT_LINE('NWD='||r_dane.liczb1);
END;