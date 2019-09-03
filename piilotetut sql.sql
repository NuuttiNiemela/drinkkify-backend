DROP TABLE IF EXISTS cabinet CASCADE;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
                       uid SERIAL PRIMARY KEY,
                       user_email VARCHAR(255) NOT NULL
);
CREATE TABLE cabinet (
                         users_id INTEGER NOT NULL,
                         ingredients_id INTEGER NOT NULL,
                         FOREIGN KEY (users_id) REFERENCES users(uid) ON DELETE CASCADE,
                         FOREIGN KEY (ingredients_id) REFERENCES drinks_ingredients(id) ON DELETE CASCADE
);

INSERT INTO cabinet (users_id, ingredients_id) VALUES (1,63);
INSERT INTO cabinet (users_id, ingredients_id) VALUES (1,161);