const path = require('path');
const { getQuery } = require('../utils/getQuery');

module.exports.createUser = async (client, username, passHash, isDriver, paymentMethods) => {
  const query = await getQuery(path.join(__dirname, 'createUser.sql'));
  return client.query(query, [username, passHash, isDriver, paymentMethods]);
};

module.exports.login = async (client, username, passHash) => {
  const query = await getQuery(path.join(__dirname, 'userExists.sql'));
  const result = await client.query(query, [username, passHash]);
  console.log('count', (await client.query('SELECT id FROM users;')).rowCount);
  return result.rowCount >= 1;
};
