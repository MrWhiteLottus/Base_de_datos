DECLARE
    CURSOR cur_hp is
    SELECT 
    hp
    FROM pokemon
    FOR UPDATE;

v_hp pokemon.hp%TYPE;
v_incrementar_20 number(2) := 20 ;
v_incrementar_10 number(2):= 10;
BEGIN
OPEN cur_hp;
LOOP 
    FETCH cur_hp INTO v_hp;
    EXIT WHEN cur_hp%NOTFOUND;
        IF v_hp < 50 THEN
            UPDATE pokemon
            SET hp = hp + v_incrementar_20
            WHERE CURRENT OF cur_hp;
            
        ELSE
            UPDATE pokemon
            SET hp = hp + v_incrementar_10
            WHERE CURRENT OF cur_hp;
            
        END IF;
END LOOP;
COMMIT;
END;

SELECT * FROM pokemon;
-------------------------------------------------------------------------
DECLARE
CURSOR cur_type IS
SELECT
t.type_name
FROM pokemon p
join types t on p.type_id = t.id
FOR UPDATE;
v_speed_electric NUMBER(2) := 15;
v_speed_water NUMBER(2) := 10;
v_speed NUMBER(2) := 5;
v_type types.type_name%TYPE;
BEGIN
OPEN cur_type;
LOOP
    FETCH cur_type INTO v_type;
    EXIT WHEN cur_type%NOTFOUND;
        CASE
            WHEN v_type = 'Electric' THEN
            UPDATE pokemon
            SET pokemon.speed = pokemon.speed + v_speed_electric
            WHERE CURRENT OF cur_type;
            
            WHEN v_type = 'water' THEN
            UPDATE pokemon
            SET pokemon.speed = pokemon.speed + v_speed_water
            WHERE CURRENT OF cur_type;
            
            ELSE
                UPDATE pokemon
                SET pokemon.speed = pokemon.speed + v_speed
                WHERE CURRENT OF cur_type;
        END CASE;
END LOOP;
END;
SELECT * FROM pokemon;