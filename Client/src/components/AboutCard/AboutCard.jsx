/* eslint-disable react/prop-types */
import { motion } from 'framer-motion';
import './AboutCard.css';

const AboutCard = ({pic, name, desc, anim}) => {
    return (
        <motion.div className="about-card" variants={ anim }>
            <div className="about-card-pic">
                <div className="about-card-circle"></div>
                <img src={pic} alt={`${name}'s picture`} />
            </div>

            <hr />

            <div className="about-card-info">
                <h1>{name}</h1>
                <p>{desc}</p>
            </div>
        </motion.div>
    );
};

export default AboutCard;