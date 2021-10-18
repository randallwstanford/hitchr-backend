const { Pool } = require('pg');

function dbPool(host, user, password) {
  return new Pool({ host, user, password });
}

module.exports = dbPool;
