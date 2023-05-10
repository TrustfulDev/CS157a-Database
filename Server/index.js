import express from 'express';
import db from './database.js';

const app = express();

async function getData() {
    const [rows] = await db.query("SELECT * FROM SOME_TABLE");
    return rows;
}

app.get("/", async (req, res) => {
    res.send("Server is running!");
});

// Check App.jsx line 9 to see the GET request
app.get("/api", async (req, res) => {
    // const result = await getData();
    // res.send(result);
    res.send([{ "name" : "test" }]);
});

app.listen(process.env.PORT || 3000, () => {console.log(`Server started on port ${process.env.PORT}`)});