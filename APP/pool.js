const mysql = require('mysql')
const pool = mysql.createPool({
  // host: '127.0.0.1',
  host: 'localhost',
  port: 3307,
  user: 'root',
  password: '@Zyj02141016',
  database: 'vue_admin',
  connectionLimit: 15,
  // dateStrings: true,
})
module.exports = pool
