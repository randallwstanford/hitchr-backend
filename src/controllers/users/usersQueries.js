const getUser = 'SELECT * FROM users where id = $1';

const getRides = `
  SELECT 
    id AS ride_id,
    (SELECT json_build_object(
            'id', id,
            'username', username,
            'rating', average_driver_rating
        ) FROM users
        WHERE driver_id=users.id
    ) AS driver,
     price,
     available_seats,
     (SELECT name 
         FROM destinations
         WHERE id=rides.start_dest
        ) AS start_dest,
      (SELECT name
       FROM destinations
       WHERE id=rides.end_dest
      ) AS end_dest,
     completed,
     (SELECT array(
        SELECT user_id
        FROM users_rides
        WHERE ride_id=rides.id
        GROUP BY user_id
        ORDER BY user_id
     ) AS USERS)
  FROM rides
  WHERE driver_id = $1;
  `;

const getRidesAsRider = `
  SELECT 
  users_rides.ride_id,
  (SELECT json_build_object(
        'id', users.id,
        'username', users.username,
        'rating', users.average_driver_rating
    ) FROM users
   WHERE rides.driver_id=users.id
  ) AS driver,
  rides.price,
  rides.available_seats,
  (SELECT name
     FROM destinations
     WHERE id=rides.start_dest
  ) AS start_dest,
  (SELECT name
     FROM destinations
     WHERE id=rides.end_dest
  ) AS end_dest,
  completed,
  (SELECT array(
        SELECT user_id
        FROM users_rides
        WHERE ride_id=rides.id
        GROUP BY user_id
        ORDER BY user_id
     ) AS users)
  FROM users_rides 
  LEFT JOIN rides
  on users_rides.ride_id=rides.id
  WHERE user_id=$1;
  `;

module.exports = { getUser, getRides, getRidesAsRider };
