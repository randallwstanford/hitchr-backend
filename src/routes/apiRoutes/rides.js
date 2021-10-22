const express = require('express');
const ridesController = require('../../controllers/rides/rides');

const router = express.Router();

router.get('/:rideId(\\d+)', ridesController.getRide);

router.patch('/:rideId(\\d+)', ridesController.addRider);

router.patch('/:rideId(\\d+)/complete', ridesController.completeRide);

router.get('/', ridesController.getRidesByDestinations);

router.post('/', ridesController.postNewRide);

module.exports = router;
