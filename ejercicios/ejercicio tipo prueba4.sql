SELECT * FROM battles;
SELECT * FROM pokemon;
SELECT * FROM trainers;
 DECLARE
 CURSOR cur_batalla IS(
    SELECT 
    p.name,
    p.hp
    FROM pokemon_trainers pt
    JOIN pokemon p on pt.pokemon_id = p.id
    JOIN trainers t on pt.trainer_id = t.id
    WHERE p.id = 141 
 UNION
     SELECT 
        p.name,
        p.hp
        FROM pokemon_trainers pt
        JOIN pokemon p on pt.pokemon_id = p.id
        JOIN trainers t on pt.trainer_id = t.id
        WHERE p.id = 74 
     
 );
 BEGIN
 END;
 