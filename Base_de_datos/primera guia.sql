SELECT * FROM EMPLEADO;

DECLARE
V_NOMBRE_EMP VARCHAR2(150);
V_RUT_EMP INT := :X_RUT_EMP;
V_DVRUT_EMP INT ;
V_SUELDO_EMP INT ;
V_BONIFICACION_EMP INT;

BEGIN
SELECT NOMBRE_EMP ||' '|| APPATERNO_EMP ||' '||APMATERNO_EMP,
dvrut_emp,
sueldo_emp,
sueldo_emp*0.40
INTO V_NOMBRE_EMP, V_DVRUT_EMP, V_SUELDO_EMP, V_BONIFICACION_EMP

FROM empleado
WHERE numrut_emp = V_RUT_EMP ; 
dbms_output.put_line('El nombre del usuario es :' || v_nombre_emp );
dbms_output.put_line('El nombre del usuario es :' || v_rut_emp ||'-'||v_dvrut_emp  );
dbms_output.put_line('El nombre del usuario es :' || v_sueldo_emp );
dbms_output.put_line('El nombre del usuario es :' || v_bonificacion_emp );

END;