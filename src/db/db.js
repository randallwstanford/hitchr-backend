const { Pool } = require('pg');
const env = require('./env');

function dbPool(host, user, password) {
  return new Pool({ host, user, password });
}

const pool = dbPool(env);

(async () => {
  const client = await pool.connect();
  const res = await client.query('SELECT $1::text as message', ['Hello world!']);
  console.log(res.rows[0].message);
  client.release();

  pool.end();
})();

module.exports = dbPool;
