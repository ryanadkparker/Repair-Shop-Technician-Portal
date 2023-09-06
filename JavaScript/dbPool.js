const mysql = require('mysql');

const pool  = mysql.createPool({
    connectionLimit: 10,
    host: "REDACTED",
    user: "REDACTED",
    password: "REDACTED",
    database: "REDACTED"
});

module.exports = pool;
