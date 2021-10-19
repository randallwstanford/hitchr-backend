const fs = require('fs').promises;
const { pool } = require('../../db/db');

module.exports.createUser = async (username, password, payment, isDriver) => {
  const query = await fs.readFile('./userExists.sql');
  const result = await pool.query(query.toString(), [username, password, payment, isDriver]);
  return result.rows.length === 1;
};

module.exports.login = async (username, password) => {
  const query = await fs.readFile('./userExists.sql');
  const result = await pool.query(query.toString(), [username, password]);
  return result.rows.length === 1;
};
