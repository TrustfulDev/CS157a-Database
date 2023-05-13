import express from "express";
import db from "../database.js";
const viewRouter = express.Router();

async function getView(viewName) {
    const [rows] = await db.query(`SELECT * FROM ${viewName}`);
    return rows;
}

viewRouter.get("/patient", async (req, res) => {
    const result = await getView("prescription_view_medicine");
    res.send(result);
});

viewRouter.get("/staff", async (req, res) => {
    const result = await getView("staff_patient");
    res.send(result);
});

viewRouter.get("/equipment", async (req, res) => {
    const result = await getView("ward_equipment");
    res.send(result);
});

export default viewRouter;