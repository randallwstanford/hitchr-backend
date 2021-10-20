const express = require('express');
const messagesRouter = require('./apiRoutes/messages');
const ridesRouter = require('./apiRoutes/rides');
const userRouter = require('./apiRoutes/user');
<<<<<<< HEAD
const authRouter = require('./apiRoutes/auth');
=======
const gMapsRouter = require('./apiRoutes/gMaps');
>>>>>>> 138bda7956ca7d45e069f64219f536f62a5886f3

const router = express.Router();

router.use('/messages', messagesRouter);
router.use('/rides', ridesRouter);
router.use('/user', userRouter);
router.use('/gmaps', gMapsRouter);

router.post('/create', authRouter.create);
router.post('/login', authRouter.login);
router.delete('/logout', authRouter.logout);

router.get('/', (req, res) => {
  res.send('Hello from the apiRouter');
});

module.exports = router;
