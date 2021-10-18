const express = require('express');

const router = express.Router();

router.get('/:userId(\\d+)', (req, res) => {
  res.send('getting user info');
});

router.get('/:userId(\\d+)/rides', (req, res) => {
  res.send('getting all rides for the current user');
});

router.patch('/:userId(\\d+)/driverRating', (req, res) => {
  res.send('add a rating to the given userId');
});

router.patch('/:userId(\\d+)/riderRating', (req, res) => {
  res.send('add a rating to the given userId');
});

router.post('/', (req, res) => {
  res.send('creating a new user');
});

module.exports = router;
