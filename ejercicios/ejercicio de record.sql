DECLARE
    CURSOR cur_vendedor IS
    (SELECT 
        'vendedor' as Tipo,
        v.id_vendedor as v_ID,
        v.nombres||' '||v.apellidos as Nombre_Completo,
        v.rut_vendedor as Rut,
        g.nom_grupo as Equipo,
        c.nom_categoria as Categoria,
        to_char(v.sueldo,'$999g999g999') as Sueldo
    FROM vendedor v
    JOIN grupo g ON v.id_grupo = g.id_grupo
    JOIN categoria c ON v.id_categoria = c.id_categoria
    UNION
    SELECT 
        'cliente' as Tipo,
        id_cliente as v_ID,
        nombre_cliente as Nombre_Completo,
        '' as Rut,
        '' as Equipo,
        '' as Categoria,
        '' as Sueldo
    FROM cliente);

BEGIN
    FOR rec_informe IN cur_vendedor LOOP
        
        DBMS_OUTPUT.PUT_LINE('Tipo: ' || rec_informe.Tipo);
        DBMS_OUTPUT.PUT_LINE('ID Vendedor: ' || rec_informe.v_ID);
        DBMS_OUTPUT.PUT_LINE('Nombre Completo: ' || rec_informe.Nombre_Completo);
        DBMS_OUTPUT.PUT_LINE('RUT Vendedor: ' || rec_informe.Rut);
        DBMS_OUTPUT.PUT_LINE('Nombre Grupo: ' || rec_informe.Equipo);
        DBMS_OUTPUT.PUT_LINE('Nombre Categoria: ' || rec_informe.Categoria);
        DBMS_OUTPUT.PUT_LINE('Sueldo: ' || rec_informe.Sueldo);
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        
    END LOOP;
END;
