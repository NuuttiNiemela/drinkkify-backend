const { pool } = require('./config')
const fs = require('fs');

const tablesql = fs.readFileSync('init.sql').toString();

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
function getDrinkById (id){
    return pool.connect()
        .then(client => {
                return client.query('SELECT * FROM drinks WHERE id = $1', [id])
                    .then((data) => {
                        client.release();
                        return data.rows[0];
                    }
                    )
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
                        console.log("dbuserservice:post virhe", e.message);
                        throw new Error(e.message)
                    })
            }
        );
}

function create_tables() {
    pool.query(tablesql, (error, results) => {
        if (error) {
            console.log(error)
            throw error;
        }
        console.log(results);
    });
}



const updateDrink = (request, response) => {
    const id = parseInt(request.params.id)
    const { drink_name, drink_instructions } = request.body

    pool.query(
        'UPDATE drinks SET drink_name = $1, drink_instructions = $2 WHERE id = $3',
        [drink_name, drink_instructions, id],
        (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).send(`Drink modified with ID: ${id}`)
        }
    )};


    const deleteDrink = (request, response) => {
    const id = parseInt(request.params.id)

    pool.query('DELETE FROM drinks WHERE id = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).send(`Drink deleted with ID: ${id}`)
    })
}

create_tables();

module.exports = {
    getDrinks,
    addDrink,
    getDrinkById,
    updateDrink,
    deleteDrink
}




