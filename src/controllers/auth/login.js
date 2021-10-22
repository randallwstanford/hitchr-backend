const path = require('path');
const { getQuery } = require('../utils/getQuery');

module.exports.createUser = async (client, username, passHash, isDriver, paymentMethods) => {
  const query = await getQuery(path.join(__dirname, 'createUser.sql'));
  return client.query(query, [username, passHash, isDriver, paymentMethods]);
};

module.exports.login = async (client, username, passHash) => {
  const query = await getQuery(path.join(__dirname, 'userExists.sql'));
  const result = await client.query(query, [username, passHash]);
  return result.rowCount >= 1;
};

module.exports.getUser = async (client, username, passHash) => {
  const query = await getQuery(path.join(__dirname, 'getUser.sql'));
  const result = await client.query(query, [username, passHash]);
  return result.rows[0];
};
