const express = require('express');
const apiRouter = require('./routes/apiRouter');

function App(port) {
  const app = express();

  app.use(express.json());

  app.use('/api', apiRouter);

  app.get('/test', (req, res) => {
    res.send({ foo: 'test' });
  });

  return app.listen(port, () => {
    console.log(`Listening on http://localhost:${port}`);
  });
}

module.exports = App;
