// @ts-check
/// <reference types="vite/client" />

/**
 * MOCK COMPONENT
 * ----------------
 * Static dashboard prototype. Contains hardcoded layout and data.
 * Intended for UI review and design validation only.
 * See: src/mock/README.md
 */
// @ts-check
/// <reference types="vite/client" />

import './css/dashboard.css';

import ClassPerformance from './ClassPerformance.jsx';
import Activity from './Activity.jsx';
import TeacherReview from './TeacherReview.jsx';
import DepEd from './DepEd.jsx';



export default function Dashboard () {
    return (
        <>
            <div className="summary-top">
                <ClassPerformance />
                <Activity />
            </div>
            <div className="summary-bottom">
                <TeacherReview />
                <DepEd />
            </div>
        </>
    );
}

