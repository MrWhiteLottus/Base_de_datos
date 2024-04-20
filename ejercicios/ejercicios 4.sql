DECLARE
v_id_emp empleado.id_emp%TYPE;
v_numrun_emp empleado.numrun_emp%TYPE;
v_dvrun_emp empleado.dvrun_emp%TYPE;
v_nombrecompleto_emp VARCHAR2(200);
v_id_comuna empleado.id_comuna%TYPE;
v_sueldo_base empleado.sueldo_base%TYPE;

BEGIN
SELECT 
em.id_emp,
em.numrun_emp,
em.dvrun_emp,
em.pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp,
em.sueldo_base,
c.nombre_comuna
into v_id_emp, v_numrun_emp,v_dvrun_emp,v_nombrecompleto_emp
FROM empleado em
join comuna c on em.id_comuna = c.id_comuna

end