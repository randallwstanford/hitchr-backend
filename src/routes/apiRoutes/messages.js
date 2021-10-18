const express = require('express');

const router = express.Router();

router.get('/:userId(\\d+)', (req, res) => {
  res.send('getting messages');
});

router.post('/:userId(\\d+)', (req, res) => {
  res.send('posting a message');
});

module.exports = router;
