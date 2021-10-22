const camelcaseKeys = require('camelcase-keys');
const { pool } = require('../../db/db');
const queries = require('./usersQueries');

const getUser = (req, res) => {
  const userId = parseInt(req.params.userId, 10);
  pool.query(queries.getUser, [userId])
    .then((data) => { res.status(200).json(data.rows); })
    .catch((err) => console.error(err.stack));
};

const getRides = (req, res) => {
  const userId = parseInt(req.params.userId, 10);
  const ridesPromises = [
    pool.query(queries.getRides, [userId]),
    pool.query(queries.getRidesAsRider, [userId]),
  ];
  Promise.all(ridesPromises)
    .then((values) => {
      const [driverRides, riderRides] = values;
      const rideData = camelcaseKeys(
        {
          driver: driverRides.rows,
          rider: riderRides.rows,
        }, { deep: true },
      );
      console.log(rideData);
      res.status(200).json(rideData);
    });
};

/*
  pool.query(queries.getRides, [userId])
    .then((data) => { res.status(200).json(camelcaseKeys(data.rows)); })
    .catch((err) => console.error(err.stack));
 */
module.exports = { getUser, getRides };
