const supertest = require('supertest');
const path = require('path');

const env = require('../../db/env');
const { dbPool } = require('../../db/db');
const App = require('../../app');
const { getQuery } = require('../../controllers/utils/getQuery');

describe('Given a blank database', () => {
  let server;
  let pool;
  let client;
  let dropQuery;
  let createQuery;

  beforeAll(async () => {
    pool = dbPool({ ...env, database: 'hitchr_test' });

    dropQuery = await getQuery(path.join(__dirname, '..', '..', '..', 'database', 'drop.sql'));
    createQuery = await getQuery(path.join(__dirname, '..', '..', '..', 'database', 'schema.sql'));
  });

  beforeEach((done) => {
    (async () => {
      client = await pool.connect();

      await client.query(dropQuery);
      await client.query(createQuery);

      server = App(
        5001,
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

  describe('When a POST missing fields is made to /create', () => {
    let createResponse;
    beforeEach(async () => {
      createResponse = await supertest(server).post('/api/create');
    });
    test('Then the server responds with 400', () => {
      expect(createResponse.statusCode).toBe(400);
    });
  });

  describe('When a valid POST is made to /create', () => {
    let createResponse;
    beforeEach(async () => {
      createResponse = await supertest(server).post('/api/create').send({
        username: 'user',
        password: 'StrongPassword1234',
        isDriver: false,
        paymentMethods: [{ vendor: 'PayPal', url: 'http://paypal.com/u' }],
      });
    });
    test('Then the server responds with 201', () => {
      expect(createResponse.statusCode).toBe(201);
    });
    describe('When the same user tries to log in', () => {
      let loginResponse;
      beforeEach(async () => {
        loginResponse = await supertest(server).post('/api/login').send({
          username: 'user',
          password: 'StrongPassword1234',
        });
      });
      test('Then the server should respond with 201', () => {
        expect(loginResponse.statusCode).toBe(201);
      });
    });
  });

  describe('when a POST is made to /login', () => {
    let loginResponse;
    beforeEach(async () => {
      loginResponse = await supertest(server).post('/api/login').send({
        username: 'user',
        password: 'StrongPassword1234',
      });
    });
    test('Then the server should respond with 401', () => {
      expect(loginResponse.statusCode).toBe(401);
    });
  });
});
