const express = require('express');
const { getMessages, postMessage } = require('../../controllers/users/users');

const router = express.Router();

router.get('/:userId(\\d+)', getMessages);

router.post('/:userId(\\d+)', postMessage);

module.exports = router;
