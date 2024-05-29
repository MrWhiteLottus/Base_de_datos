DECLARE
CURSOR cur_pokemon is(
    SELECT 
    p.name
    FROM pokemon p
    where type_id = 1     
);

v_pokemon_elect pokemon.name%TYPE;

BEGIN
OPEN cur_pokemon;
    LOOP
        FETCH cur_pokemon INTO v_pokemon_elect;
          dbms_output.put_line(v_pokemon_elect);
        EXIT WHEN cur_pokemon%NOTFOUND;
    END LOOP;    
END;

-----------------------------------------------------
DECLARE
v_incrementar_power int := 10;
BEGIN
    FOR moves in (SELECT * FROM moves WHERE type_id = 3) LOOP
        UPDATE moves
        SET power = moves.power + v_incrementar_power
        WHERE id = moves.id;
        
    END LOOP
END;
SELECT power FROM moves;
-----------------------------------------------------------------------

