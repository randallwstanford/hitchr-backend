const { Pool } = require('pg');

const pool = new Pool({
  host: 'localhost',
  user: 'dev',
  password: 'develop',
});

(async () => {
  const client = await pool.connect();
  const res = await client.query('SELECT $1::text as message', ['Hello world!']);
  console.log(res.rows[0].message);
  client.release();

  pool.end();
})();
