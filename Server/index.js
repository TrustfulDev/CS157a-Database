import express from 'express';
import db from './database.js';

const app = express();
const PORT = process.env.PORT | 5000;

async function getData() {
    const [rows] = await db.query("SELECT * FROM SOME_TABLE");
    return rows;
}

// Check App.jsx line 9 to see the GET request
app.get("/api", async (req, res) => {
    // const result = await getData();
    // res.send(result);
    res.send("HELLO");
});

app.listen(PORT, () => {console.log(`Server started on port ${PORT}`)});