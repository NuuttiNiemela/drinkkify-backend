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

CREATE TABLE users (
                       uid SERIAL PRIMARY KEY,
                       user_name VARCHAR(255) NOT NULL
);
CREATE TABLE cabinet (
                        cid SERIAL PRIMARY KEY,
                        users_id INTEGER NOT NULL,
                        ingredients_id INTEGER NOT NULL,
                        FOREIGN KEY (users_id) REFERENCES users(uid) ON DELETE CASCADE,
                        FOREIGN KEY (ingredients_id) REFERENCES drinks_ingredients(id) ON DELETE CASCADE
);

-- Tallenna alkoholit yms raaka-aineet.
INSERT INTO drinks_ingredients (ingredient_name) VALUES ('Vodka'), ('Gin'), ('Rum'), ('Tequila'), ('Koskenkorva'),
                                                        ('Red wine'), ('White wine'), ('Rose wine'), ('Champagne'), ('Prosecco'),
                                                        ('Sugar'), ('Salt'), ('Lime'), ('Lemon'), ('Pepper'), ('Peach pure'),
                                                        ('Soda'), ('Coke'), ('Lemon soda'), ('Orange juice'), ('Tonic');

-- Tallenna cocktailien nimi ja ohje.
INSERT INTO drinks (drink_name, drink_instructions)
VALUES ('Vodka Martini', 'Shaken, not stirred. Find your inner Daniel Craig.'),
       ('Gin Tonic', 'Mix n Match! Hipster points for the innovative use of cucumber, cranberries and other garnish.'),
       ('Tom Collins', 'Serve chilled! What could go wrong?'),
       ('Bellini', 'Ruin your champagne with a splash of peach pure. Use white ones when available, preferably from Italy.'),
       ('Screwdriver', 'Take some vodka, mix with orange juice, add some ice, enjoy and think of the 1990s.'),
       ('Kossu-Kola', 'Mikä voisi mennä pieleen? Nyt erikoismerkkien kanssa!'),
       ('Vodka-vissy', 'Sekoita ja nauti!'),
       ('Long Island Iced Tea, so much fun, ka-boom!!!', 'Mix everything. Make a pitcher, once youre at it. Look at the catastrophy unravel before you, with you, by you. Cry cry cry.');

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

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 12, 'cl'),
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach pure'), 4, 'spoonfuls');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Screwdriver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Screwdriver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 10, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Kossu-Kola'), (SELECT id from drinks_ingredients WHERE ingredient_name='Koskenkorva'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Kossu-Kola'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 20, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Vodka-vissy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Vodka-vissy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 10, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon'), 2, 'pieces'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime'), 3, 'pieces, cut to pretty shapes.'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coke'), 2, 'dl, or according to taste.');

