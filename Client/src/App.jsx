import { useState, useEffect } from 'react';
import axios from 'axios';
import './App.css';

function App() {
  // Variable for the api data
  const [data, setData] = useState([{}]);

  // useEffect automatically runs the code inside of it on page load
  useEffect(() => {
    axios.get("/api")
      .then(response => setData(response.data))
      .catch(err => console.log(err));
  }, [])

  console.log(data);

  // Below is straight up just simple html
  return (
    <div>
      {(
        typeof data === 'undefined' ? (
          <p>Loading...</p>
        ) : (
          data.map((element, i) => (
            <div key={i}>
              <p>{element.textvalue}</p>
              <p >{element.numValue}</p>
            </div>
          ))
        )
      )}
    </div>
  )
}

export default App
