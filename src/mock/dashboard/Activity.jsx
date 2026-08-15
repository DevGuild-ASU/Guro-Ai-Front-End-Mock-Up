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

import './css/activity.css';
import { IconFilePencil } from "@tabler/icons-react";

export default function Activity () {
    return (
        <section className="activity">
            <h2>Recent Activity</h2>
            <div className="activity-container">
                <h3>Upcoming Quizzes</h3>

                <div className="quiz-group">
                    <div className="quiz-information">
                        <div className="quiz-icon">
                            <IconFilePencil />
                        </div>
                        <h4>Grade 9: Section 5</h4>
                    </div>

                    <p>n/a</p>
                </div>

                <div className="quiz-group">
                    <div className="quiz-information">
                        <div className="quiz-icon">
                            <IconFilePencil />
                        </div>
                        <h4>Grade 9: Section 3</h4>
                    </div>

                    <p>n/a</p>
                </div>

                <div className="quiz-group">
                    <div className="quiz-information">
                        <div className="quiz-icon">
                            <IconFilePencil />
                        </div>
                        <h4>Grade 9: Section 2</h4>
                    </div>

                    <p>n/a</p>
                </div>

                <h3>Completed Quizzes</h3>

                <div className="quiz-group">
                    <div className="quiz-information">
                        <div className="quiz-icon">
                            <IconFilePencil />
                        </div>
                        <h4>Grade 9: Section 4</h4>
                    </div>

                    <p>76.0</p>
                </div>

                <div className="quiz-group">
                    <div className="quiz-information">
                        <div className="quiz-icon">
                            <IconFilePencil />
                        </div>
                        <h4>Grade 9: Section 2</h4>
                    </div>

                    <p>63.0</p>
                </div>
            </div>
        </section>
    );
}

