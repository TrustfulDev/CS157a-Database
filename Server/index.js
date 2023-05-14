import express from 'express';
import apiRouter from "./routes/api.js";
import viewRouter from "./routes/views.js";
import cors from 'cors';

const app = express();

app.use(cors());

app.use("/api", apiRouter);
app.use("/view", viewRouter);

app.listen(process.env.PORT || 3000, () => {console.log(`Server started on port ${process.env.PORT}`)});