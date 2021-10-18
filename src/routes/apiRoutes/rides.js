const express = require('express');

const router = express.Router();

router.get('/rideId(\\d+)', (req, res) => {
  res.send('get info about a specific ride');
});

router.patch('/rideId(\\d+)', (req, res) => {
  res.send('add a user to a specific ride');
});

router.patch('/rideId(\\d+)/complete', (req, res) => {
  res.send('set the completed timestamp for a ride given its id');
});

router.get('/', (req, res) => {
  res.send('get a list of rides');
});

router.post('/', (req, res) => {
  res.send('post a new ride');
});

module.exports = router;
