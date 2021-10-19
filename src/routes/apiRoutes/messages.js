const express = require('express');
const messagesController = require('../../controllers/messages/messages');

const router = express.Router();

router.get('/:userId(\\d+)', messagesController.getMessage);

router.post('/:userId(\\d+)', (req, res) => {
  res.send('posting a message');
});

module.exports = router;
