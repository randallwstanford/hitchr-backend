const App = require('./app');
const Context = require('./dependencies/context');
const { pool } = require('./db/db');

App(Context(pool, 5000));
