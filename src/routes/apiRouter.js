const express = require('express');
const messagesRouter = require('./apiRoutes/messages');
const ridesRouter = require('./apiRoutes/rides');
const userRouter = require('./apiRoutes/user');
const authRouter = require('./apiRoutes/auth');

const router = express.Router();

router.use('/messages', messagesRouter);
router.use('/rides', ridesRouter);
router.use('/user', userRouter);

router.post('/create', authRouter.create);
router.post('/login', authRouter.login);
router.delete('/logout', authRouter.logout);

router.get('/', (req, res) => {
  res.send('Hello from the apiRouter');
});

module.exports = router;
