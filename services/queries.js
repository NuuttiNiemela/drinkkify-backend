const { pool } = require('./config')


function getDrinks() {
    return pool.connect()
        .then(client => {
                return client.query('SELECT * FROM drinks_recipes')
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

module.exports = {
    getDrinks,
    addDrink,
    getDrinkById,
    updateDrink,
    deleteDrink,
    getIngredients
}




