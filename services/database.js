const pg = require('pg');
require('dotenv').config();

const conopts = {
    user: process.env.PG_USER,
    password: process.env.PG_PASSWORD,
    host: process.env.PG_HOST,
    database: process.env.PG_DATABASE,
};

const pool = new pg.Pool(conopts)

pool.on('connect', () => {
    console.log('connected to database');
});


const createTables = () => {

    const createDrinkTable = `DROP TABLE IF EXISTS drinks; 

        CREATE TABLE drinks(
        id SERIAL PRIMARY KEY NOT NULL,
        drink_name VARCHAR(128) NOT NULL,
        drink_instructions VARCHAR
      )`;

    pool.query(createDrinkTable)
        .then((res) => {
            console.log(res);
            pool.end();
        })
        .catch((err) => {
            console.log(err);
            pool.end();
        });
};

pool.on('remove', () => {
    console.log('client removed');
    process.exit(0);
});


//export pool and createTables to be accessible  from an where within the application
module.exports = {
    createTables,
    pool,
};

