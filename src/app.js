const express = require('express');

function App(port, client) {
  const app = express();

  app.get('/test', async (req, res) => {
    const result = await client.query('SELECT $1::text as message', ['test']);

    res.send({ foo: result.rows[0].message });
  });

  return app.listen(port, () => {
    console.log(`Listening on http://localhost:${port}`);
  });
}

module.exports = App;
