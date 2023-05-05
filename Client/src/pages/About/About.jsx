import { motion } from 'framer-motion';
import './About.css';

import { AboutCard } from "../../components";
import { Hasnain, StevenVu, TommyVu } from "../../assets";

const appearUp = {
    initial: { y: "2rem", opacity: 0 },
    animate: {
        y: 0,
        opacity: 1,
        transition: { staggerChildren: 0.2, ease: "easeInOut", duration: 0.75 },
    },
}

const About = () => {
    return (
        <motion.div className="about-container" variants={ appearUp } initial="initial" animate="animate">
            <AboutCard pic={ Hasnain } name="Hasnain Mucklai" desc="Software Engineer" anim={ appearUp }/>
            <AboutCard pic={ StevenVu } name="Steven Vu" desc="Full-Stack Software Engineer" anim={ appearUp }/>
            <AboutCard pic={ TommyVu } name="Tommy Vu" desc="Computer Science" anim={ appearUp }/>
        </motion.div>
    );
};

export default About;