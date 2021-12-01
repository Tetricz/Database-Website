// you can also use the online posrgres database: elephantSQL
//https://www.youtube.com/watch?v=BuJj4LCWP_4
//#postgres://username:password@hostname:port/database

const { Pool } = require('pg');

const pool = new Pool({
  host: "3380db.cs.uh.edu",
  user: "dbs024",
  password: "tiapw4dbs",
  database: "COSC3380",
});

module.exports = pool;

