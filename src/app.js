const express = require('express');

const apiRouter = require('./routes/apiRouter');

function App(context) {
  const app = express();
  // line 7-13 tempary solution for local testing between front to backend-servers
  const allowCrossDomain = (req, res, next) => {
    res.header('Access-Control-Allow-Origin', 'http://localhost:3000');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
  };
  app.use(allowCrossDomain);
  app.use(express.json());
  // app.use(express.urlencoded({ extended: false }));

  app.use('/api', apiRouter(context));

  return app.listen(context.port, () => {
    if (process.env.NODE_ENV !== 'test') {
      console.log(`Listening on http://localhost:${context.port}`);
    }
  });
}

module.exports = App;
