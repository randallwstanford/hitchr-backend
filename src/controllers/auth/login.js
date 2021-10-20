const path = require('path');
const { pool } = require('../../db/db');
const { getQuery } = require('../utils/getQuery');

module.exports.createUser = async (username, passHash, isDriver, paymentMethods) => {
  const query = await getQuery(path.join(__dirname, 'createUser.sql'));
  const result = await pool.query(query, [username, passHash, isDriver, paymentMethods]);
  return result.rows.length === 1;
};

module.exports.login = async (username, password) => {
  const query = await getQuery(path.join(__dirname, 'userExists.sql'));
  const result = await pool.query(query, [username, password]);
  return result.rows.length === 1;
};
