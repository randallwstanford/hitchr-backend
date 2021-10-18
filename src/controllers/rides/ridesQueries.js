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

const getRide = 'SELECT * FROM rides WHERE id = $1';

module.exports = { createRide, getRide };
