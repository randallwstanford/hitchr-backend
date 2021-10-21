const express = require('express');
const destinationsRouter = require('./apiRoutes/destinations');
const gMapsRouter = require('./apiRoutes/gMaps');
const messagesRouter = require('./apiRoutes/messages');
const ridesRouter = require('./apiRoutes/rides');
const userRouter = require('./apiRoutes/user');
<<<<<<< HEAD
=======
const AuthRouter = require('./apiRoutes/auth');
const gMapsRouter = require('./apiRoutes/gMaps');
>>>>>>> 44b40f7b8c64e0e120bc061eb04946dc500e1acb

const apiRouter = (context) => {
  const router = express.Router();

<<<<<<< HEAD
router.use('/destinations', destinationsRouter);
router.use('/gmaps', gMapsRouter);
router.use('/messages', messagesRouter);
router.use('/rides', ridesRouter);
router.use('/user', userRouter);
=======
  router.use('/messages', messagesRouter);
  router.use('/rides', ridesRouter);
  router.use('/user', userRouter);
  router.use('/gmaps', gMapsRouter);
>>>>>>> 44b40f7b8c64e0e120bc061eb04946dc500e1acb

  const authRouter = AuthRouter(context);

  router.post('/create', authRouter.create);
  router.post('/login', authRouter.login);
  router.delete('/logout', authRouter.logout);

  router.get('/', (req, res) => {
    res.send('Hello from the apiRouter');
  });

  return router;
};

module.exports = apiRouter;
