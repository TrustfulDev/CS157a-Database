import { useState } from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';

const Navbar = () => {
    const [open, setOpen] = useState(false);
    const [selected, setSelected] = useState(1);
 
    return (
        <header className="nav-container">
            <Link to="/" onClick={() => setSelected(1)}><h1>Syntax Savants</h1></Link>

            <nav className={ open ? "nav-open" : "nav-close"}>
                <Link to="/" className={ selected === 1 ? "nav-btns nav-selected" : "nav-btns"}
                    onClick={() => setSelected(1)}
                >
                    Home
                </Link>

                <Link to="/views" className={ selected === 2 ? "nav-btns nav-selected" : "nav-btns"}
                    onClick={() => setSelected(2)}
                >
                    Views
                </Link>

                <Link to="/about" className={ selected === 3 ? "nav-btns nav-selected" : "nav-btns"}
                    onClick={() => setSelected(3)}
                >
                    About Us
                </Link>
            </nav>

            <div className="hamburger" onClick={() => setOpen(!open)}>
                <div className={ open ? "ham-lines first-line" : "ham-lines"}></div>
                <div className={ open ? "ham-lines sec-line" : "ham-lines"}></div>
                <div className={ open ? "ham-lines third-line" : "ham-lines"}></div>
            </div>
        </header>
    );
};

export default Navbar;