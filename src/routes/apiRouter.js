const express = require('express');
const messagesRouter = require('./apiRoutes/messages');
const ridesRouter = require('./apiRoutes/rides');
const userRouter = require('./apiRoutes/user');
const gMapsRouter = require('./apiRoutes/gMaps');

const router = express.Router();

router.use('/messages', messagesRouter);
router.use('/rides', ridesRouter);
router.use('/user', userRouter);
router.use('/gmaps', gMapsRouter);

router.post('/login', (req, res) => {
  res.send('given a username and password, request a session token');
});

router.delete('/logout', (req, res) => {
  res.send('logout by deleting current session token');
});

router.get('/', (req, res) => {
  res.send('Hello from the apiRouter');
});

module.exports = router;
