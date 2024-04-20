SELECT numrun, dvrun FROM cliente;


DECLARE
v_nro_cliente INT;
v_numrun int;
v_dvrun int;
v_nombre_cliente VARCHAR2(200) := :x_nombre_cliente;
v_cod_tipo_cliente int;
BEGIN
SELECT 
nro_cliente,
numrum ||'-'|| dvrun,
cod_tipo_cliente
into v_nro_cliente, v_numrun,v_cod_tipo_cliente
FROM CLIENTE
WHERE pnombre||' '||snombre||' '||appaterno||' '||apmaterno = v_nombre_cliente;

dbsm_output.put_line('se encontro');

END;