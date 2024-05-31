DECLARE
    CURSOR cur_pokemon IS(
        SELECT 
        p.name as "nombre",
        t.type_name as "tipo",
        p.hp as "hp"
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
-------------------------------------------------------------
DECLARE
CURSOR cur_poke_entrenador is(
    SELECT 
        t.name as "Entrenador",
        p.name as "Pokemon"
    
    FROM pokemon_trainers pt
    join pokemon p on pt.pokemon_id = p.id
    join trainers t on pt.trainer_id = t.id
);

v_entrenador_poke VARCHAR2(150);
BEGIN
OPEN cur_poke_entrenador;
    LOOP
        FETCH cur_poke_entrenador INTO v_entrenador_poke;
        EXIT WHEN cur_poke_entrenador%NOTFOUND;
        dbms_output.put_line(v_entrenador_poke);
    
    END LOOP;
END;

--------------------------------------

-- chat gpt
DECLARE
    CURSOR cur_poke_entrenador IS
        SELECT 
            t.name as entrenador,
            p.name as pokemon
        FROM pokemon_trainers pt
        JOIN pokemon p ON pt.pokemon_id = p.id
        JOIN trainers t ON pt.trainer_id = t.id;
    
    v_entrenador_poke cur_poke_entrenador%ROWTYPE;
BEGIN
    OPEN cur_poke_entrenador;
    
    LOOP
        FETCH cur_poke_entrenador INTO v_entrenador_poke;
        EXIT WHEN cur_poke_entrenador%NOTFOUND;
        
        dbms_output.put_line('Entrenador: ' || v_entrenador_poke.entrenador || ', Pokemon: ' || v_entrenador_poke.pokemon);
    END LOOP;
    
    CLOSE cur_poke_entrenador;
END;

