SELECT * FROM empleado;


DECLARE
v_id_emp empleado.id_emp%TYPE;
v_numrun_emp empleado.numrun_emp%TYPE;
v_dvrun_emp empleado.dvrun_emp%TYPE;
v_nombrecompleto_emp VARCHAR2(200);
v_id_comuna empleado.id_comuna%TYPE;
v_sueldo_base empleado.sueldo_base%TYPE;
v_nombre_comuna comuna.id_comuna%type;
v_contador number(10);
v_porc_movil_normal number(2);
v_valor_movil_normal number(7);

BEGIN
SELECT 
em.id_emp,
em.numrun_emp,
em.dvrun_emp,
em.pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp,
em.sueldo_base,
c.nombre_comuna,
bpu.anno_proceso

into v_id_emp, v_numrun_emp,v_dvrun_emp,v_nombrecompleto_emp, v_nombre_comuna
FROM empleado em
join comuna c on em.id_comuna = c.id_comuna
join bonif_por_utilidad bpu on em.id_emp = bpu.id_emp
where em.id_emp = v_id_emp;

while v_id_emp <= 320 loop
v_porc_movil_nomal := (trunc(2,v_sueldo_base));

v_contador := v_contador + 10;

end loop
 
end