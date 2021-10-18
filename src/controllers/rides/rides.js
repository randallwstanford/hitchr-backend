const pool = require('../../db/db');
const queries = require('./ridesQueries');

const getRide = (req, res) => {
  const { rideId } = req.params.rideId;
  pool.query(queries.getRide, [rideId])
    .then((data) => res.status(200).json(data.rows[0]))
    .catch((err) => console.error(err.stack));
};

const postNewRide = (req, res) => {
  const values = [];
  pool.query(queries.createRide, values)
    .then(() => res.status(201))
    .catch((err) => console.error(err.stack));
};

module.exports = { getRide, postNewRide };
