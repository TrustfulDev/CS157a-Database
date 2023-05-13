import './App.css';

import { Navbar } from './components';

// Import Routing and Pages
import { Routes, Route } from 'react-router-dom';
import { Home, Views, About } from './pages';

function App() {
  // Below is straight up just simple html
  return (
    <div>
      <Navbar />
      <Routes>
        <Route path='/' element={<Home />} />
        <Route path='/views' element={<Views />} />
        <Route path='/about' element={<About />} />
      </Routes>
    </div>
  )
}

export default App
