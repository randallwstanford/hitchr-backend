const express = require('express');
const cors = require('cors');

const apiRouter = require('./routes/apiRouter');

function App(context) {
  const app = express();

  app.use(express.json());
  app.use(cors());

  app.use('/api', apiRouter(context));

  return app.listen(context.port, () => {
    if (process.env.NODE_ENV !== 'test') {
      console.log(`Listening on http://localhost:${context.port}`);
    }
  });
}

module.exports = App;
