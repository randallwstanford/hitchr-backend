CREATE TABLE users (
  id SERIAL NOT NULL PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  password VARCHAR(30) NOT NULL,
  payment_methods JSON,
  average_rider_rating DECIMAL DEFAULT 0,
  total_rider_ratings INTEGER DEFAULT 0,
  is_driver BOOLEAN DEFAULT false,
  average_driver_rating DECIMAL DEFAULT 0,
  total_driver_ratings INTEGER DEFAULT 0
);

CREATE TABLE destinations (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  coordinate point NOT NULL
);

CREATE TABLE rides (
  id SERIAL NOT NULL PRIMARY KEY,
  driver_id INTEGER,
  FOREIGN KEY(driver_id) REFERENCES users(id),
  start_dest INTEGER,
  FOREIGN KEY(start_dest) REFERENCES destinations(id),
  end_dest INTEGER,
  FOREIGN KEY(end_dest) REFERENCES destinations(id),
  available_seats INTEGER NOT NULL,
  completed timestamp without time zone DEFAULT NULL,
  price INTEGER
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  text VARCHAR(250) NOT NULL,
  sender_id INTEGER,
  FOREIGN KEY (sender_id) REFERENCES users(id),
  recipient_id INTEGER,
  FOREIGN KEY (recipient_id) REFERENCES users(id),
  timestamp timestamp without time zone NOT NULL
);

CREATE TABLE users_rides (
  id SERIAL PRIMARY KEY,
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  ride_id INTEGER,
  FOREIGN KEY (ride_id) REFERENCES rides(id)
);

/* COPY users from '/home/gaoy11/hackreactor/hitchr-backend/csv/users.csv' DELIMITER ',' CSV HEADER;
COPY destinations from '/home/gaoy11/hackreactor/hitchr-backend/csv/destinations.csv' DELIMITER ',' CSV HEADER;
COPY rides from '/home/gaoy11/hackreactor/hitchr-backend/csv/rides.csv' DELIMITER ',' CSV HEADER;
COPY messages from '/home/gaoy11/hackreactor/hitchr-backend/csv/messages.csv' DELIMITER ',' CSV HEADER;
COPY users_rides from '/home/gaoy11/hackreactor/hitchr-backend/csv/users_rides.csv' DELIMITER ',' CSV HEADER; */