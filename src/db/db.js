const { Pool } = require('pg');
const env = require('./env');

function dbPool({
  host, user, password, database, port,
}) {
  return new Pool({
    host,
    user,
    password,
    database,
    port,
  });
}

const pool = dbPool(env);

module.exports = { dbPool, pool };
