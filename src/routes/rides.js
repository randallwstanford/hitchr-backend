const express = require('express');

const router = express.Router();

router.get('/', (req, res) => {
  res.send('from the rides route');
});

module.exports = router;
