const { pool } = require('../../db/db');
const { getMessagesQuery, postMessageQuery } = require('./messagesQueries');

exports.getMessages = (req, res) => {
  const { recipientId, senderId } = req.params;
  pool.query(getMessagesQuery, [recipientId, senderId])
    .then((data) => res.status(200).json(data))
    .catch((err) => console.error(err.stack));
};

exports.postMessage = (req, res) => {
  const { text, senderId, recipientId } = req.params;
  pool.query(postMessageQuery, [text, senderId, recipientId])
    .then(() => res.status(201))
    .catch((err) => console.error(err.stack));
};
