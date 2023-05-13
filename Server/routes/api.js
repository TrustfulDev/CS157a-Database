import express from "express";
import db from "../database.js";
const apiRouter = express.Router();

async function getData(tableName) {
    const [rows] = await db.query(`SELECT * FROM ${tableName}`);
    return rows;
}

// Query for the tables patient & medical_condition
apiRouter.get("/patient", async (req, res) => {
    const result = await getData("patient");
    res.send(result);
});

apiRouter.get("/condition", async (req, res) => {
    const result = await getData("medical_condition");
    res.send(result);
});

// Query for medical_staff
apiRouter.get("/staff", async (req, res) => {
    const result = await getData("medical_staff");
    res.send(result);
});

// Query for hospital_ward
apiRouter.get("/ward", async (req, res) => {
    const result = await getData("hospital_ward");
    res.send(result);
});

// Query for medical_equipment
apiRouter.get("/equipment", async (req, res) => {
    const result = await getData("medical_equipment");
    res.send(result);
});

// Query for the tables prescription & prescribed_medicine
apiRouter.get("/prescription", async (req, res) => {
    const result = await getData("prescription");
    res.send(result);
});

apiRouter.get("/prescribed", async (req, res) => {
    const result = await getData("prescribed_medicine");
    res.send(result);
});

// Query for medicine
apiRouter.get("/medicine", async (req, res) => {
    const result = await getData("medicine");
    res.send(result);
});

// Query for pharmacy
apiRouter.get("/pharmacy", async (req, res) => {
    const result = await getData("pharmacy");
    res.send(result);
});

// Query for medicine_inventory
apiRouter.get("/inventory", async (req, res) => {
    const result = await getData("medicine_inventory");
    res.send(result);
});

export default apiRouter;