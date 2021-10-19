const createRide = `
  INSERT INTO rides(
    driver_id,
    start_dest,
    end_dest,
    available_set,
    price
    )
    VALUES($1, $2, $3, $4, $5)
`;

const getRideById = 'SELECT * FROM rides WHERE id = $1';

const getRides = 'SELECT * FROM rides LIMIT 10';

module.exports = { createRide, getRideById, getRides };
