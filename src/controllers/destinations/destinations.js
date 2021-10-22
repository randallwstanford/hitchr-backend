const { pool } = require('../../db/db');
const { getStartingDestQuery, getEndingDestQuery, getDestinationFromStartQuery } = require('./destinationsQueries');

exports.getStartingDestinations = (req, res) => {
  pool.query(getStartingDestQuery)
    .then((data) => res.status(200).json(data.rows))
    .catch((err) => console.error(err.stack));
};

exports.getEndingDestinations = (req, res) => {
  pool.query(getEndingDestQuery)
    .then((data) => res.status(200).json(data.rows))
    .catch((err) => console.error(err.stack));
};

exports.getDestinationsFromStart = (req, res) => {
  pool.query(getDestinationFromStartQuery, req.params.startId)
    .then((data) => res.status(200).json(data.rows))
    .catch((err) => console.error(err.stack));
};
