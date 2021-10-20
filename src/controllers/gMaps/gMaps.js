const axios = require('axios');
const gMapKey = require('./gMapKey');

const gMapBaseUrl = 'https://maps.googleapis.com/maps/api';

const getPlaces = (req, res) => {
  const { place } = req.params;
  axios.get(`${gMapBaseUrl}/place/autocomplete/json`, {
    params: { input: place, key: gMapKey },
  })
    .then(({ data }) => res.status(200).send(data.predictions))
    .catch((err) => console.error(err.stack));
};

module.exports = { getPlaces };
