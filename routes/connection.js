require ('dotenv').config();
const pg = require('pg');
const {PGUSER, PGHOST, PGPORT} = process.env;

if (process.env.NODE_ENV === 'development')
    console.log(`Connecting to ${PGUSER} @ ${PGHOST}:${PGHOST}`);

module.exports = new pg.Pool();

