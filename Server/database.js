import mysql from 'mysql2';

// Express doesn't load .env files automatically 
import * as dotenv from 'dotenv';
dotenv.config();

/* Connects to the MySQL connection
*  Use the Database URL given by the hosting service (HEROKU)
*  Good practice to put all the values in the env file
*/
const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_DATABASE,
}).promise();

export default db;