SELECT id ,
  username,
  payment_methods,
  average_rider_rating,
  total_rider_ratings,
  is_driver,
  average_driver_rating,
  total_driver_ratings
FROM users
WHERE id=$1;