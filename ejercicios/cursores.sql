DROP table persona;

CREATE TABLE persona(
id_random VARCHAR2(1) not null,
nombre_random varchar2(50) not null
);

INSERT INTO persona(id_random, nombre_random)
VALUES('0', 'pedro');
INSERT INTO persona(id_random, nombre_random)
VALUES('1', 'juan');
INSERT INTO persona(id_random, nombre_random)
VALUES('2', 'ignacio');
INSERT INTO persona(id_random, nombre_random)
VALUES('3', 'jorge');
INSERT INTO persona(id_random, nombre_random)
VALUES('4', 'agustin');
INSERT INTO persona(id_random, nombre_random)
VALUES('5', 'jordan');
INSERT INTO persona(id_random, nombre_random)
VALUES('6', 'nicolas');
INSERT INTO persona(id_random, nombre_random)
VALUES('7', 'michael');
INSERT INTO persona(id_random, nombre_random)
VALUES('8', 'ramon');
INSERT INTO persona(id_random, nombre_random)
VALUES('9', 'humberto');

DECLARE
cursor cur_micursor is (select id_random, nombre_random from persona);
v_id_random persona.id_random%type;
v_nombre_random persona.nombre_random%type;
begin
open cur_micursor;

for i in 1..10 loop
    fetch cur_micursor into v_id_random, v_nombre_random;
    dbms_output.put_line(v_id_random ||' '|| v_nombre_random);
end loop;


end;
