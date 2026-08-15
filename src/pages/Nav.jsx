// @ts-check
/// <reference types="vite/client" />

import './css/nav.css';
import { Link } from "react-router-dom";

export default function Nav () {
    return (
        <header>
            <img src="./logo.png" />

            <ul>
                <li><Link to="/dashboard">Dashboard</Link></li>
                <li><Link to="/classes">Classes</Link></li>
                <li><Link to="/quizzes">Quizzes</Link></li>
                <li><Link to="/reports">Reports</Link></li>
                <li><Link to="/lesson_plans">Lesson Plans</Link></li>
                <li><Link to="/settings">Settings</Link></li>
            </ul>
        </header>
    );
}
