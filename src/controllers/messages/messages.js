const { pool } = require('../../db/db');
const queries = require('./messagesQueries');

const getMessage = (req, res) => {
  const userId = parseInt(req.params.userId, 10);
  pool.query(queries.getMessage, [userId])
    .then((data) => { res.status(200).json(data.rows); })
    .catch((err) => console.error(err.stack));
};

module.exports = { getMessage };
