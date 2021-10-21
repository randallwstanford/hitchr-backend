const createRide = `
  with updated as
  (
  INSERT INTO rides(
    driver_id,
    start_dest,
    end_dest,
    available_seats,
    completed,
    price
    )
    VALUES($1, $2, $3, $4, $5, $6)
  ) SELECT setval('rides_id_seq',(SELECT MAX(id) from rides))
`;
const getNameStartEndDestination = `
  SELECT
    id,
    (
      SELECT id as start_dest FROM destinations WHERE name = $2 limit 1
    ),
    (
      SELECT id as end_dest FROM destinations WHERE name = $3 limit 1
    )
  FROM users
  WHERE username = $1;
`;

const getRideById = `
  SELECT
    id AS ride_id,
    available_seats,
    completed,
    price,
    (
      SELECT json_build_object(
        'id', id,
        'username', username,
        'rating', average_driver_rating
      ) AS driver
      FROM users
      WHERE id = rides.driver_id
    ),
    (
      SELECT json_agg(user_id) AS riders
      FROM users_rides
      WHERE ride_id = $1
    ),
    (
      SELECT name AS start_dest
      FROM destinations
      WHERE id = rides.start_dest
    ),
    (
      SELECT name AS end_dest
      FROM destinations
      WHERE id = rides.end_dest
    )
  FROM rides
  WHERE id = $1
`;

const getRidesByDestinations = `
SELECT
    id AS ride_id,
    available_seats,
    completed,
    price,
    (
      SELECT json_build_object(
        'id', id,
        'username', username,
        'rating', average_driver_rating
      ) AS driver
      FROM users
      WHERE id = rides.driver_id
    ),
    (
      SELECT json_agg(user_id) AS riders
      FROM users_rides
      WHERE ride_id = rides.id
    ),
    (
      SELECT name AS start_dest
      FROM destinations
      WHERE id = rides.start_dest
    ),
    (
      SELECT name AS end_dest
      FROM destinations
      WHERE id = rides.end_dest
    )
  FROM rides
  WHERE start_dest = $1 AND end_dest = $2
`;

const getRides = `
  SELECT
    id AS ride_id,
    available_seats,
    completed,
    price,
    (
      SELECT json_build_object(
        'id', id,
        'username', username,
        'rating', average_driver_rating
      ) AS driver
      FROM users
      WHERE id = rides.driver_id
    ),
    (
      SELECT json_agg(user_id) AS riders
      FROM users_rides
      WHERE ride_id = rides.id
    ),
    (
      SELECT name AS start_dest
      FROM destinations
      WHERE id = rides.start_dest
    ),
    (
      SELECT name AS end_dest
      FROM destinations
      WHERE id = rides.end_dest
    )
  FROM rides
  LIMIT 10
`;

const completeRide = `
    UPDATE rides SET
    completed = current_timestamp(0)
    WHERE id=$1
    RETURNING id, completed;
`;

const addRider = `
    INSERT INTO users_rides
    (id, user_id, ride_id)
    VALUES
    (((SELECT MAX(id) FROM users_rides) + 1), $1, $2);
`;

module.exports = {
  createRide,
  getRideById,
  getRidesByDestinations,
  getRides,
  completeRide,
  getNameStartEndDestination,
    addRider,
};
