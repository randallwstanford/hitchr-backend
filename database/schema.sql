DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS rides CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS destination CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS users_rides CASCADE;


CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(30) NOT NULL,
  payment_methods JSON,
  average_rating DECIMAL DEFAULT 0,
  total_ratings INTEGER DEFAULT 0
);
CREATE TABLE destination (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  coordinate point NOT NULL
);

CREATE TABLE rides (
  id SERIAL NOT NULL PRIMARY KEY,
  driver_id INTEGER,
  FOREIGN KEY(driver_id) REFERENCES users(id),
  start_dest INTEGER,
  FOREIGN KEY(start_dest) REFERENCES destination(id),
  end_dest INTEGER,
  FOREIGN KEY(end_dest) REFERENCES destination(id),
  available_seats INTEGER NOT NULL,
  completed timestamp without time zone DEFAULT NULL,
  price INTEGER
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  text VARCHAR(250) NOT NULL,
  sender_id INTEGER,
  FOREIGN KEY (sender_id) REFERENCES users(id),
  recipent_id INTEGER,
  FOREIGN KEY (recipent_id) REFERENCES users(id),
  timestamp timestamp without time zone NOT NULL
);

CREATE TABLE payment (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  icon VARCHAR(300)
);

CREATE TABLE users_rides (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  ride_id INTEGER,
  FOREIGN KEY (ride_id) REFERENCES rides(id)
);


/* COPY users from '/home/gaoy11/hackreactor/hitchr-backend/csv/users.csv' DELIMITER ',' CSV HEADER;
COPY destination from '/home/gaoy11/hackreactor/hitchr-backend/csv/destination.csv' DELIMITER ',' CSV HEADER;
COPY rides from '/home/gaoy11/hackreactor/hitchr-backend/csv/rides.csv' DELIMITER ',' CSV HEADER;
COPY messages from '/home/gaoy11/hackreactor/hitchr-backend/csv/messages.csv' DELIMITER ',' CSV HEADER;
COPY payment from '/home/gaoy11/hackreactor/hitchr-backend/csv/payment.csv' DELIMITER ',' CSV HEADER;
COPY users_rides from '/home/gaoy11/hackreactor/hitchr-backend/csv/users_rides.csv' DELIMITER ',' CSV HEADER; */