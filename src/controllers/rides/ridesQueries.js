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

const getRideById = 'SELECT * FROM rides WHERE id = $1';

const getRides = 'SELECT * FROM rides LIMIT 10';

module.exports = { createRide, getRideById, getRides };
