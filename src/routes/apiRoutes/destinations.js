const express = require('express');
const destinationsController = require('../../controllers/destinations/destinations');

const router = express.Router();

router.get('/start', destinationsController.getStartingDestinations);

router.get('/end', destinationsController.getEndingDestinations);

module.exports = router;
