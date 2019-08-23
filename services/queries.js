const { pool } = require('./config');

const fs = require('fs');
const tablesql = fs.readFileSync('initkaksi.sql').toString();


// Hakee drinkin nimen ja reseptin taulusta drinks.
function getDrinks() {
    return pool.connect()
        .then(client => {
                return client.query('SELECT * FROM drinks')
                    .then((data) => {
                            client.release();
                            return data.rows;
                        }
                    )
                    .catch(e => {
                        throw new Error(e.message)
                    })
            }
        );
}

// Hakee drinkin nimen, reseptin ja raaka-aineet käyttäen useampia tauluja. Sekavassa tilassa.
function getDrinksWithJoin() {
    const query1 = 'SELECT * FROM drinks';
    const query2 = 'SELECT * FROM drinks NATURAL JOIN drinks_ingredients';
    const query3 = 'SELECT drinks.drink_name, drinks_recipes.ingredients_id FROM drinks JOIN drinks_recipes ON drinks.id = drinks_recipes.drinks_id';
    const query4 = 'SELECT drinks.drink_name, drinks_recipes.ingredients_id FROM drinks LEFT JOIN drinks_recipes ON drinks.id = drinks_recipes.drinks_id';
    const query5 = 'SELECT * FROM drinks_recipes WHERE drinks_id IN (SELECT id FROM drinks WHERE drink_name = "Gin Tonic")';


    return pool.connect()
        .then(client => {
                return client.query(query5)
                    .then((data) => {
                            client.release();
                            return data.rows;
                        }
                    )
                    .catch(e => {
                        throw new Error(e.message)
                    })
            }
        );
}

function getDrinkById (id){
    return pool.connect()
        .then(client => {
                return client.query('SELECT * FROM drinks WHERE id = $1', [id])
                    .then((data) => {
                        client.release();
                        return data.rows[0];
                    })
                    .catch(e => {
                        throw new Error(e.message)
                    })
            })
}
function addDrink(newdrink) {
    const insertStmt = "INSERT INTO drinks(drink_name, drink_instructions) VALUES($1, $2)  RETURNING id";
    return pool.connect()
        .then(client => {
                return client.query(insertStmt, [newdrink.drink_name, newdrink.drink_instructions])
                    .then((vastaus) => {
                            client.release();
                            console.log("Insertoitu vastaus", vastaus.rows);
                            return vastaus.rows[0].id;
                        }
                    )
                    .catch(e => {
                        console.log("queries:post virhe", e.message);
                        throw new Error(e.message)
                    })
            }
        );
}

function updateDrink(id, drinkData) {
    return pool.connect()
        .then(client => {
            return client.query('UPDATE drinks SET drink_name = $1, drink_instructions = $2 WHERE id = $3',
                [drinkData.drink_name, drinkData.drink_instructions, id])
                .then((data) => {
                    client.release();
                    console.log("Updated:", data.rows);
                    return drinkData;
                })
                .catch( e => {
                    console.log("queries: put virhe");
                    throw new Error(e.message);
                })
        })

}

function deleteDrink(id) {
    return pool.connect()
        .then(client => {
            return client.query('DELETE FROM drinks WHERE id = $1', [id])
                .then((data) => {
                    client.release();
                    return `"Deleted drink with id" ${id}`;
                })
                .catch( e => {
                    throw new Error(e.message)
                });
        })
}

function getIngredients() {
    return pool.connect()
        .then(client => {
                return client.query('SELECT * FROM drinks_ingredients')
                    .then((data) => {
                            client.release();
                            return data.rows;
                        }
                    )
                    .catch(e => {
                        throw new Error(e.message)
                    })
            }
        );
}
function getIngredientByName (ingredientName){
    return pool.connect()
        .then(client => {
            return client.query('SELECT * FROM drinks_ingredients WHERE ingredient_name ILIKE $1', [ingredientName + '%'])
                .then((data) => {
                    client.release();
                    return data.rows[0];
                })
                .catch(e => {
                    throw new Error(e.message)
                })
        })
}

module.exports = {
    getDrinks,
    addDrink,
    getDrinkById,
    updateDrink,
    deleteDrink,
    getDrinksWithJoin,
    getIngredients,
    getIngredientByName
};




