import { Link } from 'react-router-dom';
import './Navbar.css';

const Navbar = () => {
    return (
        <header className="nav-container">
            <h1>Syntax Savants</h1>

            <nav>
                <Link to="/" className="nav-btns">Something</Link>
                <Link to="/" className="nav-btns">Something</Link>
                <Link to="/" className="nav-btns">About Us</Link>
            </nav>
        </header>
    );
};

export default Navbar;