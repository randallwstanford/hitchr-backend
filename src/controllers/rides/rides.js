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
    .then((data) => res.status(200).json(data.rows))
    .catch((err) => console.error(err.stack));
};

const postNewRide = (req, res) => {
  const {
    driverId, startDest, endDest, availableSeats, completed, price,
  } = req.body;
  const values = [driverId, startDest, endDest, availableSeats, completed, price];
  pool.query(queries.createRide, values)
    .then(() => res.sendStatus(201))
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
  // searchRides,
};
