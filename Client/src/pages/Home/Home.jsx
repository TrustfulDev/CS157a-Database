import { motion } from "framer-motion";
import './Home.css';

const Home = () => {
    const handleChange = (e) => {
        console.log(e.target.checked);
    }

    return (
        <div className="home-container">
            <motion.section className="home-search-bar"
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
                    <li>Add/Edit/Delete data</li>
                </ol>

                <motion.div className="home-hint"
                    animate={{ y:[0, 10, 0] }}
                    transition={{ ease: "linear", duration: 1, repeat: Infinity }}
                >
                    <p>Start Querying Below</p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="56" height="56" fill="currentColor" viewBox="0 0 16 16"> <path fillRule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/> </svg> 
                </motion.div>
            </motion.section>

            <form className="home-form">
                    <label htmlFor="Patients">
                        Patients
                        <input type="checkbox" id="Patients" name="Patients" value="Patients" onChange={handleChange}/>
                    </label>

                    <label htmlFor="MedicalStaff">
                        Medical Staff
                        <input type="checkbox" id="MedicalStaff" name="MedicalStaff" value="MedicalStaff" onChange={handleChange}/>
                    </label>

                    <label htmlFor="HospitalWard">
                        Hospital Ward
                        <input type="checkbox" id="HospitalWard" name="HospitalWard" value="HospitalWard" onChange={handleChange}/>
                    </label>

                    <label htmlFor="MedicalEquipment">
                        Equipment
                        <input type="checkbox" id="MedicalEquipment" name="MedicalEquipment" value="MedicalEquipment" onChange={handleChange}/>
                    </label>

                    <label htmlFor="Prescription">
                        Prescription
                        <input type="checkbox" id="Prescription" name="Prescription" value="Prescription" onChange={handleChange}/>
                    </label>

                    <label htmlFor="Medicine">
                        Medicine
                        <input type="checkbox" id="Medicine" name="Medicine" value="Medicine" onChange={handleChange}/>
                    </label>

                    <label htmlFor="Pharmacy">
                        Pharmacy
                        <input type="checkbox" id="Pharmacy" name="Pharmacy" value="Pharmacy" onChange={handleChange}/>
                    </label>

                    <label htmlFor="MedicineInventory">
                        Inventory
                        <input type="checkbox" id="MedicineInventory" name="MedicineInventory" value="MedicineInventory" onChange={handleChange}/>
                    </label>

                    <button type="submit">Fetch Data</button>
                </form>
        </div>
    );
};

export default Home;