function Context(client, port) {
  return ({
    client,
    port,
    loggedInUser: [],
  });
}

module.exports = Context;
