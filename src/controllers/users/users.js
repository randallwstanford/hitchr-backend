const { pool } = require('../../db/db');
const queries = require('./usersQueries');

const getUser = (req, res) => {
  const userId = parseInt(req.params.userId, 10);
  pool.query(queries.getUser, [userId])
    .then((data) => { res.status(200).json(data.rows); })
    .catch((err) => console.error(err.stack));
};

module.exports = { getUser };
