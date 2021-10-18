const { Pool } = require('pg');
const env = require('./env');

function dbPool(host, user, password, database) {
  return new Pool({
    host,
    user,
    password,
    database,
  });
}

const pool = dbPool(env);

module.exports = { dbPool, pool };
