const path = require('path');
const { pool } = require('../../db/db');
const { getQuery } = require('../utils/getQuery');

// TODO: change this function to take in a client
module.exports.createUser = async (username, passHash, isDriver, paymentMethods) => {
  const query = await getQuery(path.join(__dirname, 'createUser.sql'));
  const result = await pool.query(query, [username, passHash, isDriver, paymentMethods]);
  return result.rows.length === 1;
};

module.exports.login = async (username, passHash) => {
  const query = await getQuery(path.join(__dirname, 'userExists.sql'));
  const result = await pool.query(query, [username, passHash]);
  console.log('count', (await pool.query('SELECT id FROM users;')).rowCount);
  return result.rowCount >= 1;
};
