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

TYPE rec_informe is RECORD(
    v_tipo varchar2(20),
    v_id_vendedor vendedor.id_vendedor%type,
    v_nombre_completo varchar2(150),
    v_rut_vendedor vendedor.rut_vendedor%type,
    v_nom_grupo grupo.nom_grupo%type,
    v_nom_categoria categoria.nom_categoria%type
);

BEGIN
OPEN cur_vendedor;

    
    FOR rec_informe IN cur_vendedor LOOP
        
        DBMS_OUTPUT.PUT_LINE('Tipo: ' || rec_informe.v_tipo);
        DBMS_OUTPUT.PUT_LINE('ID Vendedor: ' || rec_informe.v_id_vendedor);
        DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || rec_informe.v_nombre_completo);
        DBMS_OUTPUT.PUT_LINE('RUT Vendedor: ' || rec_informe.v_rut_vendedor);
        DBMS_OUTPUT.PUT_LINE('Nombre Grupo: ' || rec_informe.v_nom_grupo);
        DBMS_OUTPUT.PUT_LINE('Nombre Categoria: ' || rec_informe.v_nom_categoria);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
    END LOOP;



END;