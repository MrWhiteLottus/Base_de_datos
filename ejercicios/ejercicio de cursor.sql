declare
cursor cur_vendedores is 
(SELECT id_vendedor,
nombres,
apellidos,
fecnac,
sueldo
FROM vendedor);
v_id_vendedor vendedor.id_vendedor%type;
    v_nombres vendedor.nombres%type;
    v_apellidos vendedor.apellidos%type;
    v_fecnac vendedor.fecnac%type;
    v_sueldo vendedor.sueldo%type;
begin 
open cur_vendedores;
for i in 1..15 loop

    fetch cur_vendedores into v_id_vendedor, v_nombres, v_apellidos, v_fecnac, v_sueldo;
   if v_sueldo <= 354000 then
   dbms_output.put_line('Empleado N°'||' '||v_id_vendedor
   ||'-'||v_nombres||' '||v_apellidos||' Tiene un sueldo de '||v_sueldo);
   end if;
    
end loop;
 
end;

--------------------------------------------------------

declare
    cursor cur_vendedor_catego is 
        SELECT id_vendedor, nombres, apellidos, sueldo
        FROM vendedor;
        v_id_vendedor vendedor.id_vendedor%type;
    v_nombres vendedor.nombres%type;
    v_apellidos vendedor.apellidos%type;
    v_sueldo vendedor.sueldo%type;
begin 
    open cur_vendedor_catego;
    for i in 1..15 loop
        fetch cur_vendedor_catego into v_id_vendedor, v_nombres, v_apellidos, v_sueldo;
        if v_sueldo <= 400000 then
            dbms_output.put_line('Categoria A'||'
            '||v_id_vendedor||'        '||v_nombres||' '||v_apellidos||'        '||v_sueldo);
        else
            dbms_output.put_line('Categoria B'||'
            '||v_id_vendedor||'        '||v_nombres||' '||v_apellidos||'        '||v_sueldo);
        end if;
    end loop;
    close cur_vendedor_catego;
end;



-----------------------------------------------------------------------

declare
cursor cur_vendedores is 
(SELECT id_vendedor,
nombres,
apellidos,
fecnac,
sueldo
FROM vendedor);
TYPE rec_vendedor is RECORD (
    v_id_vendedor vendedor.id_vendedor%type,
    v_nombres vendedor.nombres%type,
    v_apellidos vendedor.apellidos%type,
    v_fecnac vendedor.fecnac%type,
    v_sueldo vendedor.sueldo%type
);
v_vendedor rec_vendedor;
v_contador int := 0;


BEGIN

open cur_vendedores;

loop
    FETCH cur_vendedores INTO v_vendedor;
    v_contador := v_contador+1;
    EXIT WHEN cur_vendedores%notfound;
    
    dbms_output.put_line('['|| v_contador||'] Empleado N°'|| v_vendedor.id_vendedor);
end loop;

end;



