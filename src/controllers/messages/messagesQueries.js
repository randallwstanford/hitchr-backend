exports.getMessagesQuery = `
SELECT array(
  SELECT jsonb_build_object(
    'username', username,
    'text', text,
    'message_id', messages.id,
    'sender_id', sender_id,
    'recipient_id', recipient_id,
    'timestamp', timestamp
  )
  FROM messages
  INNER JOIN users
  ON sender_id = users.id
  WHERE recipient_id = 49
  AND sender_id = 34
  OR recipient_id = 34
  AND sender_id = 49
  ORDER BY timestamp ASC
);`;

// `SELECT *  FROM messages INNER JOIN users on sender_id = users.id WHERE
// recipient_id = 49 AND sender_id = 34 OR
// recipient_id = 34 AND sender_id = 49 ORDER BY timestamp ASC;`

exports.postMessageQuery = `
  INSERT INTO messages (text, sender_id, recipient_id, timestamp) VALUES ($1, $2, $3, now());
`;
