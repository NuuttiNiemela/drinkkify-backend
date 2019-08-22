DROP TABLE IF EXISTS drinks;

CREATE TABLE drinks (
                       id SERIAL PRIMARY KEY,
                       drink_name VARCHAR(255) NOT NULL,
                       drink_ingredient1 VARCHAR,
                       drink_ingredient2 VARCHAR,
                       drink_ingredient3 VARCHAR,
                       drink_ingredient4 VARCHAR,
                       drink_instructions VARCHAR(255) NOT NULL
);

INSERT INTO drinks (drink_name, drink_ingredient1, drink_ingredient2, drink_instructions)
VALUES  ('Vodka Martini', 'Vodka', 'Martini', 'Shaken, not stirred');
INSERT INTO drinks (drink_name, drink_ingredient1, drink_instructions)
VALUES  ('Kossu-vissy', 'Kossu', 'Sekoita ja nauti!');
INSERT INTO drinks (drink_name, drink_ingredient1, drink_ingredient2, drink_ingredient3, drink_instructions)
VALUES  ('Kova tee', 'Pontikka', 'Tee', 'Sokeri', 'Ykkösellä huiviin ja irvistä');