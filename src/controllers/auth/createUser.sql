INSERT INTO users (username, password, is_driver, payment_methods)
VALUES ($1, $2, $3, $4)
RETURNING id;
