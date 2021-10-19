const express = require('express');
const usersController = require('../../controllers/users/users');

const router = express.Router();

// get particular user's information
router.get('/:userId(\\d+)', usersController.getUser);

// getting all rides for the current user
router.get('/:userId(\\d+)/rides', (req, res) => {
  res.send();
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
