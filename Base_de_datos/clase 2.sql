insert into Persona VALUES(1,'benjamin','tapia',22);
insert into persona VALUES(2,'juan','hernandez',25);

SELECT * FROM persona;

--Imprimir el nombre completo de un persona por id

DECLARE
--variables aca
v_id_persona int := :x_id_persona;
v_nombre_completo varchar2(100);

BEGIN
SELECT NOMBRE|| ' ' || APELLIDO
INTO V_NOMBRE_COMPLETO
FROM PERSONA
WHERE ID_PERSONA = v_id_persona
;
dbms_output.put_line('El id del usuario es :' || v_id_persona);
dbms_output.put_line('El nombre del usuario es :' || v_nombre_completo);

END;






