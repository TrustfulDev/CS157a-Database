import { useState, useRef } from "react";
import axios from "axios";
import { motion } from "framer-motion";
import { TableFilter, Table } from "../../components";
import './Home.css';

const Home = () => {
    const [valid, setValid] = useState(true);
    const [search, setSearch] = useState(false);
    const [data, setData] = useState([{}]);

    const [state, setState] = useState({
        "Patients": false,
        "MedicalStaff": false,
        "HospitalWard": false,
        "MedicalEquipment": false,
        "Prescription": false,
        "Medicine": false,
        "Pharmacy": false,
        "MedicineInventory": false
    });

    const handleCheck = (e, isSelected) => {
        setState((prevValues) => ({...prevValues, [e]: isSelected}));
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        if (Object.values(state).indexOf(true) <= -1) {
            setValid(false);
            setSearch(false);
        } else {
            setValid(true);
            axios.get("/api")
            .then(response => setData(response.data))
            .catch(err => console.log(err));
            setSearch(true);

            setTimeout(() => {
                formRef.current.scrollIntoView();
            }, 150);
        }
    }

    const formRef = useRef(null);

    return (
        <>
            <div className="home-container">
                <motion.section className="home-hero"
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    transition={{ ease: "easeOut", duration: 0.150 }}
                >
                    <h3>Say Goodbye To Paperwork</h3>
                    <h1>Databases Are Here To Save You!</h1>

                    <ol>
                        <li>Select the tables/entities you would like to query</li>
                        <li>Click on Fetch Data to begin the query</li>
                        <li>Narrow down your search with specfic queries</li>
                    </ol>

                    <motion.div className="home-hint"
                        animate={{ y:[0, 10, 0] }}
                        transition={{ ease: "linear", duration: 1, repeat: Infinity }}
                    >
                        <p>Start Querying Below</p>
                        <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor" viewBox="0 0 16 16"> <path fillRule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/> </svg> 
                    </motion.div>
                </motion.section>

                <form ref={formRef} className="home-form" onSubmit={handleSubmit}>
                    <TableFilter text="Patients" id="Patients" value="Patients" handleCheck={handleCheck} />
                    
                    <TableFilter text="Medical Staff" id="MedicalStaff" value="MedicalStaff" handleCheck={handleCheck} />

                    <TableFilter text="Hospital Ward" id="HospitalWard" value="HospitalWard" handleCheck={handleCheck} />

                    <TableFilter text="Equipment" id="MedicalEquipment" value="MedicalEquipment" handleCheck={handleCheck} />

                    <TableFilter text="Prescription" id="Prescription" value="Prescription" handleCheck={handleCheck} />

                    <TableFilter text="Medicine" id="Medicine" value="Medicine" handleCheck={handleCheck} />

                    <TableFilter text="Pharmacy" id="Pharmacy" value="Pharmacy" handleCheck={handleCheck} />

                    <TableFilter text="Inventory" id="MedicineInventory" value="MedicineInventory" handleCheck={handleCheck} />

                    <button type="submit"></button>
                </form>

                <motion.div
                    initial={{ opacity: 0, y: 10 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ ease: "easeOut", duration: 0.350 }}
                    className={ valid ? "fetch-valid" : "fetch-invalid"}
                >
                    <h1>Please Select At Least ONE Table</h1>
                </motion.div>
            </div>
            
            <div className={ search ? "search-container" : "fetch-valid"}>
                {(
                    typeof data === 'undefined' ? (
                        <p>Loading...</p>
                    ) : (
                        <Table title="Test" data={data} />
                    )
                )}
            </div>
        </>
    );
};

export default Home;