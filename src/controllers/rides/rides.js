const camelcaseKeys = require('camelcase-keys');
const snakecaseKeys = require('snakecase-keys');
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

const getRidesByDestinations = (req, res) => {
  const { start, end } = req.query;
  console.log(start, end);
  const values = [start, end];
  pool.query(queries.getRidesByDestinations, values)
    .then((data) => {
      const alteredData = data;
      for (let i = 0; i < alteredData.rows.length; i += 1) {
        let priceData = alteredData.rows[i].price / 100;
        priceData = priceData.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
        alteredData.rows[i].price = priceData;
      }
      return alteredData;
    })
    .then((data) => res.status(200).json(camelcaseKeys(data.rows)))
    .catch((err) => console.error(err.stack));
};

const postNewRide = (req, res) => {
  console.log('here');
  const {
    usernameToDriverId, startDestName, endDestName, availableSeats, completed, price,
  } = req.body;
  console.log(req.body);
  pool.query(queries.getNameStartEndDestination, [usernameToDriverId, startDestName, endDestName])
    .then((data) => {
      console.log(data.rows[0]);
      const values = [
        data.rows[0].id, data.rows[0].start_dest,
        data.rows[0].end_dest, availableSeats, completed, price,
      ];
      return values;
    }).then((values) => {
      pool.query(queries.createRide, values)
        .then(() => { res.sendStatus(201); })
        .catch(() => res.status(404).send('fail to create ride'));
    })
    .catch(() => res.status(404).send('invalid entry'));
};

const completeRide = (req, res) => {
  const { rideId } = req.params;
  pool.query(queries.completeRide, [rideId])
    .then((data) => res.status(200).json(data.rows[0]))
    .catch((err) => console.error(err.stack));
};

const addRider = (req, res) => {
  const { userId, rideId } = req.body;
  pool.query(queries.addRider, snakecaseKeys([userId, rideId]))
    .then((data) => res.status(200).json(data.rows[0]))
    .catch((err) => console.error(err.stack));
};

// const searchRides = (req, res) => {
//   const { start, end } = req.query;
//   const values = [start, end];
//   pool.query(queries.searchRides)
//     .then((data) => {
//       const alteredData = data;
//       for (let i = 0; i < alteredData.rows.length; i += 1) {
//         let priceData = alteredData.rows[i].price / 100;
//         priceData = priceData.toLocaleString('en-US', { style: 'currency', currency: 'USD' });
//         alteredData.rows[i].price = priceData;
//       }
//       return alteredData;
//     })
//     .then((data) => res.status(200).json(data.rows))
//     .catch((err) => console.error(err.stack));
// };

module.exports = {
  getRide,
  getRidesByDestinations,
  postNewRide,
  completeRide,
  addRider,
  // searchRides,
};
