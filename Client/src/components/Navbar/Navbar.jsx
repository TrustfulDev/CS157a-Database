import { useState } from 'react';
import { Link } from 'react-router-dom';
import './Navbar.css';

const Navbar = () => {
    const [open, setOpen] = useState(false);

    return (
        <header className="nav-container">
            <h1>Syntax Savants</h1>

            <nav className={ open ? "nav-open" : "nav-close"}>
                <Link to="/" className="nav-btns">Something</Link>
                <Link to="/" className="nav-btns">Something</Link>
                <Link to="/" className="nav-btns">About Us</Link>
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