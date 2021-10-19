const getMessage = 'SELECT * FROM messages where sender_id = $1';

module.exports = { getMessage };

exports.getMessagesQuery = `
SELECT array(
  SELECT jsonb_build_object(
    'text', text,
    'message_id', message_id,
    'sender_id', sender_id,
    'recipient_id', recipient_id,
    'timestamp', timestamp
  )
  FROM messages WHERE recipent_id = $1 AND sender_id = $2 UNION ALL SELECT * FROM messages WHERE recipent_id = $2 AND sender_id = $1;
)`;

exports.postMessageQuery = `
  INSERT INTO messages (text, sender_id, recipient_id, timestamp) VALUES ($1, $2, $3, now());
`;
