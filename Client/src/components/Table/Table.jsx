/* eslint-disable react/prop-types */
import './Table.css';

const Table = ({ title, data }) => {
    var values = Object.values(data);
    var keys = Object.keys(values[0]);

    return (
        <div>
            <h1 className="table-header">{title}</h1>
            <table className="table-container">
                <thead>
                    <tr>
                        { keys.map((key, index) => {
                            return (
                                <th key={index}>{key}</th>
                            )
                        })}
                    </tr>
                </thead>

                <tbody>
                    { values.map((obj, index) => {
                        return(
                            <tr key={index}>
                                { Object.entries(obj).map(([key, val]) => {
                                    // console.log(val);
                                    return (
                                        <td key={key}>{val}</td>
                                    )
                                })}
                            </tr>
                        )
                    })}
                </tbody>
            </table>
        </div>
    );
};

export default Table;