CREATE OR REPLACE FUNCTION FN_SUMAR(NUM1 NUMBER, NUM2 NUMBER)
RETURN NUMBER 
IS 

    V_TOTAL NUMBER;

BEGIN 
     v_total := num1+num2;
    RETURN V_TOTAL;
END FN_SUMAR;

--Para usar funciones, El dual es una tabla que crea el sistema para pruebas
SELECT FN_SUMAR(4,7) FROM dual;


CREATE OR REPLACE TRIGGER TRG_REGISTROEMPLEADO
BEFORE INSERT OR UPDATE OR DELETE 
ON EJ_EMPLEADO
FOR EACH ROW
DECLARE

BEGIN
    
END TRG_REGISTROEMPLEADO ;