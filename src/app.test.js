const supertest = require('supertest');

const env = require('./db/env');
const { dbPool } = require('./db/db');
const App = require('./app');

describe('Given a blank database', () => {
  let server;
  let pool;
  let client;
  beforeAll(() => {
    pool = dbPool(env);
  });

  beforeEach((done) => {
    (async () => {
      client = await pool.connect();

      server = App(
        5000,
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
});
