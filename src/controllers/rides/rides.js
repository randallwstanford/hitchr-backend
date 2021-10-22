const camelcaseKeys = require('camelcase-keys');
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

/* const postNewRide = (req, res) => {
  console.log('here');
  const {
    driverId, startDestName, endDestName, availableSeats, completed, price,
  } = req.body;
  console.log('req.body:', req.body);
  pool.query(queries.getStartEndDestination, [startDestName, endDestName])
    .then((data) => {
      console.log('data.rows[0]', data.rows[0]);
      const values = [
        driverId, data.rows[0].start_dest,
        data.rows[0].end_dest, availableSeats, completed, price,
      ];
      return values;
    }).then((values) => {
      pool.query(queries.createRide, values)
        .then(() => { res.sendStatus(201); })
        .catch(() => res.status(404).send('fail to create ride'));
    })
    .catch(() => res.status(404).send('invalid entry'));
}; */

const postNewRide = async (req, res) => {
  const {
    driverId, startDestName, endDestName, availableSeats, completed, price,
  } = req.body;
  const results = await pool.query(queries.getStartEndDestination, [startDestName, endDestName])
    .then((data) => {
      const values = [
        driverId, data.rows[0].start_dest,
        data.rows[0].end_dest, availableSeats, completed, price,
      ];
      return values;
    }).catch(() => res.status(404).send('invalid entry'));

  const newSid = results[1] === null ? await pool.query(
    queries.createDestination, [startDestName, '(0.01, 0.01)'],
  )
    .then((data) => parseInt(data.rows[0].setval, 10) + 1)
    .catch((error) => { console.log(error); res.status(404).send('unable to create a new start destination'); }) : null;

  const newEid = results[2] === null ? await pool.query(queries.createDestination, [endDestName, '(0.01, 0.01)'])
    .then((data) => parseInt(data.rows[0].setval, 10) + 1)
    .catch((error) => { console.log(error); res.status(404).send('unable to create a new end destination'); }) : null;

  if (newEid !== null && newSid !== null) {
    const finalvalues = [
      results[0], newSid,
      newEid, results[3], results[4], results[5],
    ];
    await pool.query(queries.createRide, finalvalues)
      .then(() => { res.status(201).send('create new ride successfully, with new start and end des added'); })
      .catch((error) => { console.log(error); res.status(404).send('fail to create ride'); });
  } else if (newEid === null && newSid !== null) {
    const finalvalues = [
      results[0], newSid,
      parseInt(results[2], 10), results[3], results[4], results[5],
    ];
    await pool.query(queries.createRide, finalvalues)
      .then(() => { res.status(201).send('create new ride successfully, with new start destiation added'); })
      .catch((error) => { console.log(error); res.status(404).send('fail to create ride'); });
  } else if (newEid !== null && newSid === null) {
    const finalvalues = [
      results[0], parseInt(results[1], 10),
      newEid, results[3], results[4], results[5],
    ];
    await pool.query(queries.createRide, finalvalues)
      .then(() => { res.status(201).send('create new ride successfully, with new end destination added'); })
      .catch((error) => { console.log(error); res.status(404).send('fail to create ride'); });
  } else if (newEid === null && newSid === null) {
    const finalvalues = [
      results[0], parseInt(results[1], 10),
      parseInt(results[2], 10), results[3], results[4], results[5],
    ];
    await pool.query(queries.createRide, finalvalues)
      .then(() => { res.status(201).send('create new ride successfully, without destinations added'); })
      .catch((error) => { console.log(error); res.status(404).send('fail to create ride'); });
  }
};

const completeRide = (req, res) => {
  const { rideId } = req.params;
  pool.query(queries.completeRide, [rideId])
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
  // searchRides,
};
