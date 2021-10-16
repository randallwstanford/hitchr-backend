const supertest = require('supertest');
const App = require('./app');

describe('Given a blank database', () => {
  let server;
  beforeEach((done) => {
    (async () => {
      server = App(5000);
      done();
    })();
  });
  afterEach(() => {
    server.close();
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
