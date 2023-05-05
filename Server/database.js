import mysql from 'mysql2';

// Express doesn't load .env files automatically 
import * as dotenv from 'dotenv';
dotenv.config();

/* Connects to the MySQL connection
*  Use the Database URL given by the hosting service (HEROKU)
*  Good practice to put all the values in the env file
*/
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: process.env.DB_PASSWORD,
    database: "test_db",
}).promise();

export default db;