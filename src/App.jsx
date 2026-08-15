// @ts-check
/// <reference types="vite/client" />

import './index.css';
import { Route, Routes } from 'react-router-dom';

import Dashboard from './mock/dashboard/Dashboard.jsx';
import Classes from './pages/Classes.jsx';
import Quizzes from './pages/Quizzes.jsx';
import Reports from './pages/Reports.jsx';
import LessonPlans from './pages/LessonPlans.jsx';
import Settings from './pages/Settings.jsx';

export default function App () {
    return (
        <main>
            <Routes>
                <Route path="/dashboard" element={<Dashboard />} />
                <Route path="/classes" element={<Classes />} />
                <Route path="/quizzes" element={<Quizzes />} />
                <Route path="/reports" element={<Reports />} />
                <Route path="/lesson_plans" element={<LessonPlans />} />
                <Route path="/settings" element={<Settings />} />
            </Routes>
        </main>
    );
}
