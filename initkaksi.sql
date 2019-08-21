DROP TABLE IF EXISTS drinks;
DROP TABLE IF EXISTS drinks_recipes;
DROP TABLE IF EXISTS drinks_ingredients;

-- drinkin nimi ja reseptikuvaus
CREATE TABLE drinks (
                       id SERIAL PRIMARY KEY,
                       drink_name VARCHAR(255) NOT NULL,
                       drink_instructions VARCHAR(255) NOT NULL
);

-- reseptin ainekset, cocktailin nimi on drinks-taulun ID:n lapsi.
-- ainesosan nimi on drinks_ingredients-taulun ID:n lapsi.
CREATE TABLE drinks_recipes (
                       id SERIAL PRIMARY KEY,
                       drinks_id int,
                       ingredients_id int,
                       ingredients_amount int,
                       ingredients_unit VARCHAR(255)
);

-- vodka id 1, gin id 2, rommi id 3
CREATE TABLE drinks_ingredients (id SERIAL PRIMARY KEY, ingredient_name VARCHAR(255) NOT NULL);

-- Tallenna alkoholit yms raaka-aineet.
INSERT INTO drinks_ingredients (ingredient_name) VALUES ('Vodka'), ('Gin'), ('Rhum'), ('Sugar'), ('Tonic');

-- Tallenna cocktailien nimi ja ohje.
INSERT INTO drinks (drink_name, drink_instructions)
VALUES ('Vodka Martini', 'Shaken, not stirred'),
('Gin Tonic', 'Mix n Match!'),
('Tom Collins', 'Serve chilled!'),
('Vodka-vissy', 'Sekoita ja nauti!');

-- Tallenna reseptit.
INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES  ((SELECT id from drinks WHERE drink_name='Vodka Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl');

INSERT INTO bar (description, foo_id) VALUES
    ( 'testing',     (SELECT id from foo WHERE type='blue') ),
    ( 'another row', (SELECT id from foo WHERE type='red' ) );

    CREATE TABLE drinks_recipes (
                       id SERIAL PRIMARY KEY,
                       drinks_id int REFERENCES drinks(id),
                       ingredients_id int REFERENCES drinks_ingredients(id),
                       ingredients_amount int,
                       ingredients_unit VARCHAR(255)
);
