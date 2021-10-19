const supertest = require('supertest');
const fs = require('fs');
const path = require('path');

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
  describe('When a command is sent to the DB', () => {
    beforeEach((done) => {
      fs.readFile(path.join(__dirname, '..', 'database', 'schema.sql'), (err, result) => {
        if (err) {
          console.error(err);
          done();
        } else {
          // client.query(result.toString()).finally(done);
          done();
        }
      });
    });
    test('Then a command can run', async () => {
      const users = await client.query('SELECT * FROM users');
      expect(users.rows).toHaveLength(0);
    });
  });
});
