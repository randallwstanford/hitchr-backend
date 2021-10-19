const fs = require('fs').promises;
const { pool } = require('../../db/db');

exports.login = async (username, password) => {
  const query = (await fs.readFile('./createUser.sql')).toString();
  pool.query(query, [username, password]);
};
