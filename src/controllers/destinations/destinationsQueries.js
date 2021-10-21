exports.getStartingDestQuery = `
  SELECT DISTINCT ON (d.name) d.id, d.name
  FROM destinations d, rides r
  WHERE d.id = r.start_dest
  ORDER BY d.name
`;

exports.getEndingDestQuery = `

`;
