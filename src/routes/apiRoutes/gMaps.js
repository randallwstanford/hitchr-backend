const express = require('express');
const gMapsCtl = require('../../controllers/gMaps/gMaps');

const router = express.Router();

router.get('/places/:place', gMapsCtl.getPlaces);

module.exports = router;
