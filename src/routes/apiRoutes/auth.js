const bcrypt = require('bcrypt');
const login = require('../../controllers/auth/login');

module.exports.create = async (req, res) => {
  const {
    username, password, isDriver, paymentMethods,
  } = req.body;
  if (username && password && isDriver !== undefined && paymentMethods) {
    let passHash;
    try {
      passHash = await bcrypt.hash(password, 10);
    } catch (e) {
      console.error(e);
      res.status(500).send();
      return;
    }
    try {
      await login.createUser(username, passHash, isDriver, paymentMethods);
    } catch (e) {
      console.error(e);
      res.status(500).send();
      return;
    }
    res.status(201).send();
  } else {
    res.status(400).send();
  }
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
