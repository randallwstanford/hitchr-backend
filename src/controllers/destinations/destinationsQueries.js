exports.getStartingDestQuery = `
  SELECT DISTINCT ON (d.name) d.id, d.name
  FROM destinations d, rides r
  WHERE d.id = r.start_dest
  ORDER BY d.name
`;

exports.getEndingDestQuery = `
  SELECT DISTINCT ON (d.name) d.id, d.name
  FROM destinations d, rides r
  WHERE d.id = r.end_dest
  ORDER BY d.name
`;

exports.getDestinationFromStartQuery = `
  SELECT destinations.name 
  FROM rides
  INNER JOIN destinations
  ON rides.end_dest = destinations.id
  WHERE start_dest = $1
  GROUP BY destinations.name;
`;
