DECLARE
    CURSOR cur_pokemon IS(
        SELECT 
        p.id AS "ID",
        p.name AS "NAME",
        p.type_id AS "TYPE_ID",
        p.hp AS "HP",
        p.speed AS "SPEED",
        t.type_name AS "TYPE NAME"
        FROM pokemon p
        JOIN types t on p.type_id = t.id
    );

    TYPE r_pokemon IS RECORD(
        ID pokemon.id%TYPE,
        NAME pokemon.name%TYPE,
        TYPE_ID pokemon.type_id%TYPE,
        HP pokemon.hp%TYPE,
        SPEED pokemon.speed%TYPE,
        TYPE_NAME types.type_name%TYPE
    );
    v_pokemon r_pokemon;
    TYPE varray_pokemon IS VARRAY(8) OF VARCHAR2(1500);
BEGIN
    FOR v_pokemon in cur_pokemon LOOP
       CASE     
            WHEN v_pokemon.type_id = 1 THEN v_pokemon.type_name := 'Electric';
            WHEN v_pokemon.type_id = 2 THEN v_pokemon.type_name := 'Water';
            WHEN v_pokemon.type_id = 3 THEN v_pokemon.type_name := 'Fire';
            WHEN v_pokemon.type_id = 4 THEN v_pokemon.type_name := 'Grass';
            WHEN v_pokemon.type_id =5 THEN  v_pokemon.type_name := 'Normal';      
       END CASE;
       
       IF v_pokemon.hp < 80 THEN DBMS_OUTPUT.PUT_LINE('Tiene mucha vida');
       ELSIF v_pokemon.speed < 70 THEN DBMS_OUTPUT.PUT_LINE('Es un pokemon muy rapido');
       END IF;
       

            
    END LOOP;
END;

