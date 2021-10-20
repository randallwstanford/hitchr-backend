const express = require('express');
const gMapsController = require('../../controllers/gMaps/gMaps');

const router = express.Router();

router.get('/places/:place', gMapsController.getPlaces);

module.exports = router;
