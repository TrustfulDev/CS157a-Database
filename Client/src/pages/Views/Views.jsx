import { useState } from 'react';
import axios from "axios";
import { Table } from "../../components";
import { motion } from "framer-motion";
import './Views.css';

const Views = () => {
    const [data, setData] = useState([{}]);
    const [selected, setSelected] = useState(0);

    const getData = (viewName) => {
        axios.get(`/view/${viewName}`)
        .then(response => { setData(response.data) })
        .catch(err => console.log(err));
    }

    const handleClick = (choice, val) => {
        getData(choice);
        setSelected(val);
    }

    const appearDown = {
        initial: { y: "-2rem", opacity: 0 },
        animate: {
            y: 0,
            opacity: 1,
            transition: { staggerChildren: 0.2, ease: "easeInOut", duration: 0.75 },
        },
    }

    return (
        <div className="views-container">
            <hr/>
            <motion.div className="views-btn-div" variants={ appearDown } initial="initial" animate="animate">
                <motion.button className={ selected === 1 ? "views-btns views-selected" : "views-btns"}
                    onClick={() => handleClick("patient", 1)}
                    anim={ appearDown }
                >
                    Prescription Medicine View
                
                </motion.button>
                <motion.button className={ selected === 2 ? "views-btns views-selected" : "views-btns"}
                    onClick={() => handleClick("staff", 2)}
                    anim={ appearDown }
                >
                    Ward Equipment View
                </motion.button>
                
                <motion.button className={ selected === 3 ? "views-btns views-selected" : "views-btns"}
                    onClick={() => handleClick("equipment", 3)}
                    anim={ appearDown }
                >
                    Staff Patients View
                </motion.button>
            </motion.div>
            <div className="view-info">
                {(
                    typeof data === 'undefined' ? (
                        <p>Fetching your data...</p>
                    ) : (
                        <Table data={data} />
                    )
                )}
            </div>
        </div>
    );
};

export default Views;