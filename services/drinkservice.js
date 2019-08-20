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

module.exports = {getAllDrinks};
