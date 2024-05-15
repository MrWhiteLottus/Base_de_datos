var b_annio number;
EXECUTE :b_annio := 2023;

DECLARE
v_annio2 NUMBER;
CURSOR cur_clientes is 
SELECT  
cli.numrun as "run",
cli.dvrun as "dv",
tci.nro_tarjeta as "nro tarjeta",
ttc.nro_transaccion as "nro transaccion",
ttc.fecha_transaccion as "fecha transaccion",
ttc.monto_total_transaccion as "monto_total_transaccion",
ttc.monto_total_transaccion/100000 as "puntos"
FROM cliente cli
join tarjeta_cliente tci on cli.numrun = tci.numrun
JOIN TRANSACCION_TARJETA_CLIENTE TTC ON TCI.NRO_TARJETA = TTC.NRO_TARJETA
;

TYPE v_array_puntos is varray (4) of number;
array_puntos v_array_puntos := v_array_puntos(250,300,550,700);

BEGIN
v_annio2 := 2024;
EXECUTE IMMEDIATE 'truncate'


for rec_clientes in cur_clientes
loop
case 
when rec_clientes.monto_total_transaccion >= 500000 and monto_total_transaccion <= 700000
then rec_clientes.puntos * (array_puntos(1) + array_puntos(2))
when rec_clientes.monto_total_transaccion > 700000 and monto_total_transaccion <= 900000
then rec_clientes.puntos * (array_puntos(1) + array_puntos(3))
when rec_clientes.monto_total_transaccion > 900000 
then rec_clientes.puntos * (array_puntos(1) + array_puntos(4))
end loop;



end;