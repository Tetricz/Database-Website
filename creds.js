// you can also use the online posrgres database: elephantSQL
//https://www.youtube.com/watch?v=BuJj4LCWP_4
//#postgres://username:password@hostname:port/database

const { Pool } = require('pg');

const pool = new Pool({
  host: "fanny.db.elephantsql.com",
  user: "dbqbdkgv",
  password: "SZwJ4LWOJ-pWOjpGt0S0z214wUfmdkwq",
  database: "dbqbdkgv",
});

module.exports = pool;

