const { pool } = require('./config');

// Hakee drinkin nimen ja reseptin taulusta drinks.
function getDrinks() {
    return pool.connect()
        .then(client => {
                return client.query('SELECT d.id, d.drink_name, d.drink_instructions, \n' +
                    'json_agg(json_build_object(\'id\', di.id, \'ingredient_name\', di.ingredient_name, \'amount\', dr.ingredients_amount, \'unit\', dr.ingredients_unit)) \n' +
                    'AS ingredients \n' +
                    'FROM drinks_recipes dr \n' +
                    'INNER JOIN drinks_ingredients di ON di.id = dr.ingredients_id \n' +
                    'INNER JOIN drinks d ON d.id = dr.drinks_id \n' +
                    'GROUP BY \n' +
                    'd.id, d.drink_name, d.drink_instructions ORDER BY d.drink_name')
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
// function getDrinksWithJoin(cabinet_ingredients) {
//     const insertStmt = 'SELECT d.id, d.drink_name, d.drink_instructions, \n' +
//         'json_agg(json_build_object(\'id\', di.id, \'ingredient_name\', di.ingredient_name, \'amount\', dr.ingredients_amount, \'unit\', dr.ingredients_unit)) \n' +
//         'AS ingredients \n' +
//         'FROM drinks_recipes dr \n' +
//         'INNER JOIN drinks_ingredients di ON di.id = dr.ingredients_id \n' +
//         'INNER JOIN drinks d ON d.id = dr.drinks_id \n' +
//         'WHERE d.drink_name ILIKE $1 GROUP BY \n' +
//         'd.id, d.drink_name, d.drink_instructions';
//     return pool.connect()
//         .then(client => {
//                 return client.query(query)
//                     .then((data) => {
//                             client.release();
//                             return data.rows;
//                         }
//                     )
//                     .catch(e => {
//                         throw new Error(e.message)
//                     })
//             }
//         );
// }

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

function getDrinkByName (drinkName){
    const insertStmt = 'SELECT d.id, d.drink_name, d.drink_instructions, \n' +
        'json_agg(json_build_object(\'id\', di.id, \'ingredient_name\', di.ingredient_name, \'amount\', dr.ingredients_amount, \'unit\', dr.ingredients_unit)) \n' +
        'AS ingredients \n' +
        'FROM drinks_recipes dr \n' +
        'INNER JOIN drinks_ingredients di ON di.id = dr.ingredients_id \n' +
        'INNER JOIN drinks d ON d.id = dr.drinks_id \n' +
        'WHERE d.drink_name ILIKE $1 GROUP BY \n' +
        'd.id, d.drink_name, d.drink_instructions';

    return pool.connect()
        .then(client => {
            return client.query(insertStmt, ['%' + drinkName + '%'])
                .then((data) => {
                    client.release();
                    console.log(data);
                    return data.rows;
                })
                .catch(e => {
                    throw new Error(e.message)
                })
        })
}

function addDrink(newdrink) {

    const insertStmt = "INSERT INTO drinks(drink_name, drink_instructions) VALUES($1, $2) RETURNING id";

    return pool.connect()
        .then(client => {
                return client.query(insertStmt, [newdrink.drink_name, newdrink.drink_instructions])
                    .then((data) => {
                            client.release();
                            console.log("data rows: ", data.rows[0]);
                            return data.rows[0];
                        }
                    )
                    .catch(e => {
                        console.log(newdrink)
                        console.log("queries:post virhe", e.message);
                        throw new Error(e.message)
                    })
            }
        );
}

async function addDrinkRecipe(newDrink) {
    let drinkId = -1
    console.log("ingredientin osa: " + newDrink.drink_ingredient);
    await addDrink(newDrink)
        .then(response => {
            drinkId = response.id;
        })
        .catch(e=>{
            throw new Error('Virhe drinkin luonnissa: nimi, resepti..' + e.message)
        })

    const insertStmt = 'INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit) VALUES ((SELECT id from drinks WHERE id = $1), (SELECT id from drinks_ingredients WHERE ingredient_name ILIKE $2), 4, \'cl\') RETURNING id';

    return pool.connect()
        .then(client => {
            return client.query(insertStmt, [drinkId, '%' + newDrink.drink_ingredient + '%'])
                .then((data) => {
                    client.release();
                    console.log("Created new drink recipe", data.rows);
                    return data.rows[0];
                })
                .catch(e=> {
                    console.log("Creating new drink recipe failed", e.message);
                    throw new Error(e.message);
                })
        })
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
            return client.query('SELECT * FROM drinks_ingredients WHERE ingredient_name ILIKE $1', ['%' + ingredientName + '%'])
                .then((data) => {
                    client.release();
                    return data.rows;
                })
                .catch(e => {
                    throw new Error(e.message)
                })
        })

}

// Lisää aineksen tauluun drinks_ingredients.
function addIngredient(newIngredient) {
// id poistettu, koska serial primary key
    const insertStmt = "INSERT INTO drinks_ingredients(ingredient_name) VALUES($1) RETURNING id";
    return pool.connect()
        .then(client => {
                return client.query(insertStmt, [newIngderient.ingredient_name])
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

// ----- CABINET - KAMAA: -----

// hae tietyn käyttäjän cabinetin sisältö
function getDrinkByCabinet (uid){
    return pool.connect()
        .then(client => {
            return client.query('SELECT * FROM cabinet WHERE users_id = $1', [uid])
                .then((data) => {
                    client.release();
                    return data.rows[0];
                })
                .catch(e => {
                    throw new Error(e.message)
                })
        })
}

// Lisää aineksen tauluun cabinet - ID asioita pitää vielä säätää.
function addIngredientToCabinet(userID, newIngredient) {
    const insertStmt =
        "INSERT INTO cabinet(users_id, ingredients_id) VALUES($1, (SELECT id from drinks_ingredients WHERE ingredient_name = $2), [userID, newIngredient]) " +
        "RETURNING ingredients_id";
    return pool.connect()
        .then(client => {
                return client.query(insertStmt, [newIngderient.ingredients_id])
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


module.exports = {
    getDrinks,
    addDrink,
    getDrinkById,
    updateDrink,
    deleteDrink,
    getDrinkByName,
    //getDrinksWithJoin,
    addDrinkRecipe,
    getIngredients,
    getIngredientByName,
    addIngredient,
    getDrinkByCabinet,
    addIngredientToCabinet
};
