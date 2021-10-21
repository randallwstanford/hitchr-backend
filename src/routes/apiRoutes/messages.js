const express = require('express');
const { getMessages, postMessage } = require('../../controllers/messages/messages');

const router = express.Router();

router.get('/:userId(\\d+)/:recipientId(\\d+)', getMessages);

router.post('/:recipientId(\\d+)/:userId(\\d+)', postMessage);

module.exports = router;
