const { pool } = require('../../db/db');
const queries = require('./ridesQueries');

const getRide = (req, res) => {
  const rideId = parseInt(req.params.rideId, 10);
  pool.query(queries.getRideById, [rideId])
    .then((data) => {
      const alteredData = data;
      let priceData = alteredData.rows[0].price / 100;
      priceData = priceData.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
      alteredData.rows[0].price = priceData;
      return alteredData;
    })
    .then((data) => res.status(200).json(data.rows[0]))
    .catch((err) => console.error(err.stack));
};

const getRides = (req, res) => {
  pool.query(queries.getRides)
    .then((data) => {
      const alteredData = data;
      for (let i = 0; i < alteredData.rows.length; i += 1) {
        let priceData = alteredData.rows[i].price / 100;
        priceData = priceData.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
        alteredData.rows[i].price = priceData;
      }
      console.log(alteredData.rows);
      return alteredData;
    })
    .then((data) => res.status(200).json(data.rows))
    .catch((err) => console.error(err.stack));
};

const postNewRide = (req, res) => {
  const values = [];
  pool.query(queries.createRide, values)
    .then(() => res.status(201))
    .catch((err) => console.error(err.stack));
};

module.exports = { getRide, getRides, postNewRide };
