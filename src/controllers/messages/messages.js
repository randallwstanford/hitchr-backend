const { pool } = require('../../db/db');
const { getMessagesQuery, postMessageQuery } = require('./messagesQueries');

exports.getMessages = (req, res) => {
  const { recipientId, userId } = req.params;
  pool.query(getMessagesQuery, [userId, recipientId])
    .then((data) => res.status(200).json(data.rows[0].array))
    .catch((err) => console.error(err.stack));
};

exports.postMessage = (req, res) => {
  const { userId, recipientId } = req.params;
  pool.query(postMessageQuery, [req.body.text, userId, recipientId])
    .then(() => res.status(201))
    .catch((err) => console.error(err.stack));
};
