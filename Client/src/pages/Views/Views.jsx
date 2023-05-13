import { useState } from 'react';
import axios from "axios";
import { Table } from "../../components";
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

    console.log(data);

    return (
        <div className="views-container">
            <hr/>
            <div className="views-btn-div">
                <button className={ selected === 1 ? "views-btns views-selected" : "views-btns"}
                    onClick={() => handleClick("patient", 1)}
                >
                    Prescription Medicine View
                
                </button>
                <button className={ selected === 2 ? "views-btns views-selected" : "views-btns"}
                    onClick={() => handleClick("staff", 2)}
                >
                    Ward Equipment View
                </button>
                
                <button className={ selected === 3 ? "views-btns views-selected" : "views-btns"}
                    onClick={() => handleClick("equipment", 3)}
                >
                    Staff Patients View
                </button>
            </div>
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