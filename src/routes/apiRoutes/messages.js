const express = require('express');
const messagesCtl = require('../../controllers/messages/messages');

const router = express.Router();

router.get('/:userId(\\d+)', messagesCtl.getMessage);

router.post('/:userId(\\d+)', (req, res) => {
  res.send('posting a message');
});

module.exports = router;
