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
  WHERE recipient_id = $2
  AND sender_id = $1
  OR recipient_id = $1
  AND sender_id = $2
  ORDER BY timestamp ASC
);`;

exports.postMessageQuery = `
  INSERT INTO messages (text, sender_id, recipient_id, timestamp) VALUES ($1, $2, $3, now());
`;
