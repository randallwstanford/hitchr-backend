const express = require('express');
const loginRouter = require('./login');
const messagesRouter = require('./messages');
const ridesRouter = require('./rides');
const usersRouter = require('./users');

const router = express.Router();

router.use('/login', loginRouter);
router.use('/messages', messagesRouter);
router.use('/rides', ridesRouter);
router.use('/users', usersRouter);

router.get('/', (req, res) => {
  res.send('Hello from the apiRouter');
});

module.exports = router;
