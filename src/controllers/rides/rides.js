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
      return alteredData;
    })
    .then((data) => res.status(200).json(data.rows))
    .catch((err) => console.error(err.stack));
};

const postNewRide = (req, res) => {
  console.log('here');
  const {
    usernametodriverId, startDestName, endDestName, availableSeats, completed, price,
  } = req.body;
  console.log(req.body);
  pool.query(queries.getNameStartEndDestination, [usernametodriverId, startDestName, endDestName])
    .then((data) => {
      console.log(data.rows[0]);
      const values = [
        data.rows[0].id, data.rows[0].startd,
        data.rows[0].endd, availableSeats, completed, price,
      ];
      return values;
    }).then((values) => {
      pool.query(queries.createRide, values)
        .then(() => { res.sendStatus(201); })
        .catch(() => res.status(404).send('fail to create ride'));
    })
    .catch(() => res.status(404).send('invalid entry'));
};

module.exports = { getRide, getRides, postNewRide };
