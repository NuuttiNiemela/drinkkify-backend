DROP TABLE IF EXISTS drinks;

CREATE TABLE drinks (
                       id SERIAL PRIMARY KEY,
                       drink_name VARCHAR(255) NOT NULL,
                       drink_instructions VARCHAR(255) NOT NULL
);

INSERT INTO drinks (drink_name, drink_instructions)
VALUES  ('Vodka Martini', 'Shaken, not stirred');