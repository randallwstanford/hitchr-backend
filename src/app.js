const express = require('express');

function App(port) {
  const app = express();

  app.get('/test', (req, res) => {
    res.send({ foo: 'test' });
  });

  return app.listen(port, () => {
    console.log(`Listening on http://localhost:${port}`);
  });
}

module.exports = App;
