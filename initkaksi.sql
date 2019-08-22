DROP TABLE IF EXISTS drinks CASCADE;
DROP TABLE IF EXISTS drinks_recipes;
DROP TABLE IF EXISTS drinks_ingredients CASCADE;

-- drinkin nimi ja reseptikuvaus.
CREATE TABLE drinks (
                       id SERIAL PRIMARY KEY,
                       drink_name VARCHAR(255) NOT NULL,
                       drink_instructions VARCHAR(255) NOT NULL
);

-- raaka-aineet, jossa aine ja id. Eli vodka id 1, gin id 2, rommi id 3 jne...
CREATE TABLE drinks_ingredients (id SERIAL PRIMARY KEY, ingredient_name VARCHAR(255) NOT NULL);

-- reseptin ainekset, cocktailin nimi on drinks-taulun ID:n lapsi.
-- ainesosan nimi on drinks_ingredients-taulun ID:n lapsi.
CREATE TABLE drinks_recipes (
                       id SERIAL PRIMARY KEY,
                       drinks_id INTEGER NOT NULL,
                       ingredients_id INTEGER NOT NULL,
                       ingredients_amount int,
                       ingredients_unit VARCHAR(255),
                       FOREIGN KEY (drinks_id) REFERENCES drinks(id) ON DELETE CASCADE,
                       FOREIGN KEY (ingredients_id) REFERENCES drinks_ingredients(id) ON DELETE CASCADE
);

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
VALUES
((SELECT id from drinks WHERE drink_name='Vodka Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Vodka Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gin Tonic'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Tonic'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tonic'), 12, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Tom Collins'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Tom Collins'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Tom Collins'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tonic'), 12, 'cl');


