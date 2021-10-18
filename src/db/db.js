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

(async () => {
  const client = await pool.connect();
  const res = await client.query('SELECT $1::text as message', ['Hello world!']);
  console.log(res.rows[0].message);
  client.release();

  pool.end();
})();

module.exports = pool;
