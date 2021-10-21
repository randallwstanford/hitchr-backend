const express = require('express');
const ridesController = require('../../controllers/rides/rides');

const router = express.Router();

router.get('/:rideId(\\d+)', ridesController.getRide);

router.patch('/:rideId(\\d+)', (req, res) => {
  res.send('add a user to a specific ride');
});

router.patch('/:rideId(\\d+)/complete', (req, res) => {
  res.send('set the completed timestamp for a ride given its id');
});

router.get('/', ridesController.getRidesByDestinations);

router.post('/', ridesController.postNewRide);

module.exports = router;
