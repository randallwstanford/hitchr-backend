const supertest = require('supertest');
const fs = require('fs').promises;
const path = require('path');

const env = require('./db/env');
const { dbPool } = require('./db/db');
const App = require('./app');

describe('Given a blank database', () => {
  let server;
  let pool;
  let client;
  beforeAll(() => {
    pool = dbPool({ ...env, database: 'hitchr_test' });
  });

  beforeEach((done) => {
    (async () => {
      client = await pool.connect();

      server = App(
        5050,
        client,
      );
      done();
    })();
  });
  afterEach(() => {
    server.close();
    client.release();
  });
  afterAll(() => {
    pool.end();
  });
  describe('When a valid GET is made to /test', () => {
    let getResponse;
    beforeEach(async () => {
      getResponse = await supertest(server).get('/test');
    });
    test('Then the server responds with 200', () => {
      expect(getResponse.statusCode).toBe(200);
    });
    test('The the server responds with test', () => {
      expect(getResponse.body.foo).toBe('test');
    });
  });
  describe('When a command is sent to the DB', () => {
    beforeAll(async () => {
      const drop = await fs.readFile(path.join(__dirname, '..', 'database', 'drop.sql'));
      const dropQuery = drop.toString();
      await client.query(dropQuery);
      const load = await fs.readFile(path.join(__dirname, '..', 'database', 'schema.sql'));
      const loadQuery = load.toString();
      await client.query(loadQuery);
    });
    test('Then a command can run', async () => {
      const users = await client.query('SELECT * FROM users');
      expect(users.rows).toHaveLength(0);
    });
  });
});
