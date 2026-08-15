// @ts-check
/// <reference types="vite/client" />

import './css/nav.css';
import { NavLink } from "react-router-dom";

export default function Nav () {
    return (
        <header>
            <img src="./logo.png" />

            <ul>
                <li>
                    <NavLink
                        to="/dashboard"
                        className={({ isActive }) => isActive ? "active" : ""}
                    >Dashboard</NavLink>
                </li>

                <li>
                    <NavLink
                        to="/classes"
                        className={({ isActive }) => isActive ? "active" : ""}
                    >Classes</NavLink>
                </li>

                <li>
                    <NavLink
                        to="/quizzes"
                        className={({ isActive }) => isActive ? "active" : ""}
                    >Quizzes</NavLink>
                </li>

                <li>
                    <NavLink
                        to="/reports"
                        className={({ isActive }) => isActive ? "active" : ""}
                    >Reports</NavLink>
                </li>

                <li>
                    <NavLink
                        to="/lesson_plans"
                        className={({ isActive }) => isActive ? "active" : ""}
                    >Lesson Plans</NavLink>
                </li>

                <li>
                    <NavLink
                        to="/settings"
                        className={({ isActive }) => isActive ? "active" : ""}
                    >Settings</NavLink>
                </li>
            </ul>
        </header>
    );
}
