const { pool } = require('../../db/db');
const getQuery = require('../utils/getQuery');

module.exports.createUser = async (username, password, payment, isDriver) => {
  const query = await getQuery('./userExists.sql');
  const result = await pool.query(query, [username, password, payment, isDriver]);
  return result.rows.length === 1;
};

module.exports.login = async (username, password) => {
  const query = await getQuery('./userExists.sql');
  const result = await pool.query(query, [username, password]);
  return result.rows.length === 1;
};
