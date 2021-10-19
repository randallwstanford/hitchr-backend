const bcrypt = require('bcrypt');
const login = require('../../controllers/auth/login');

module.exports.create = async (req, res) => {
  const { username } = req.body;
  const passHash = req.body.password;
  res.status(201).send();
};

module.exports.login = async (req, res) => {
  if (login(req.body.username, await bcrypt.hash(req.body.password, 10))) {
    res.send();
  } else {
    res.status(401).send();
  }
};

module.exports.logout = (req, res) => {
  console.log(req, res);
};
