const fs = require('fs').promises;

module.exports.getQuery = async (path) => {
  const query = await fs.readFile(path);
  return query.toString();
};
