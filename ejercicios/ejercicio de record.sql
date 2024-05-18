DECLARE
CURSOR cur_vendedor IS
(SELECT 
    'vendedor',
    v.id_vendedor,
    v.nombres||' '||v.apellidos,
    v.rut_vendedor,
    g.nom_grupo,
    c.nom_categoria
    
FROM vendedor v
join grupo g on v.id_grupo = g.id_grupo
join categoria c on v.id_categoria = c.id_categoria
UNION
SELECT 
    'cliente',
    id_cliente,
    nombre_cliente,
    '',
    '',
    ''
FROM cliente
);

TYPE rec_informe is RECORD 

BEGIN
END;