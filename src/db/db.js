const { Pool } = require('pg');
const env = require('./env');

function dbPool(params) {
  return new Pool(params);
}

const pool = dbPool(env);

module.exports = { dbPool, pool };
