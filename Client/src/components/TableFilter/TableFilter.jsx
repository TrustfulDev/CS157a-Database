/* eslint-disable react/prop-types */
import { useState } from "react";
import './TableFilter.css';

const TableFilter = ({ text, id, value, handleCheck }) => {
    const [selected, setSelected] = useState(false);

    const handleClick = (e) => {
        let isSelected = !selected;
        setSelected(isSelected); 
        handleCheck(e.target.value, isSelected);
    }

    return (
        <label htmlFor={id} className={ selected ? "table-filter table-filter-selected" : "table-filter"}>
            {text}
            <input type="checkbox" id={id} name={id} value={value} onChange={handleClick}/>
        </label>
    )
}

export default TableFilter;