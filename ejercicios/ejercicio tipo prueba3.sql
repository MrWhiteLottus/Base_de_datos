DECLARE
    CURSOR cur_pokemon IS(
        SELECT 
        p.name,
        t.type_name,
        p.hp
        FROM pokemon p
        join types t on p.type_id = t.id);
    
    TYPE r_pokemon IS RECORD(
        nombre pokemon.name%TYPE,
        tipo types.type_name%TYPE,
        hp pokemon.hp%TYPE
    );
    v_pokemon r_pokemon;
BEGIN
    FOR v_pokemon IN cur_pokemon
    LOOP
        dbms_output.put_line('nombre: '|| v_pokemon.nombre||' '||'tipo: '|| v_pokemon.tipo||' '||
        'hp: '||v_pokemon.hp);
    END LOOP;
END;