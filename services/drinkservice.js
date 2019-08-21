const Pool = require('pg').Pool;
require('dotenv').config();

const conopts = {
    user: process.env.PG_USER,
    password: process.env.PG_PASSWORD,
    host: process.env.PG_HOST,
    database: process.env.PG_DATABASE
    // port: 5432
};

const pool = new Pool(conopts);

function getAllDrinks() {
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


module.exports = {getAllDrinks, addDrink};
