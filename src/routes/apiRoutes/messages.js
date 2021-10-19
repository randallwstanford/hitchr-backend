const express = require('express');
const { getMessages, postMessage } = require('../../controllers/messages/messages');

const router = express.Router();

router.get('/:userId(\\d+)', getMessages);

router.post('/:userId(\\d+)', postMessage);

module.exports = router;
