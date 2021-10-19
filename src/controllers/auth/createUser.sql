INSERT (username, password, payment_methods, is_driver)
INTO users
VALUES ($1, $1, $3, $4);
