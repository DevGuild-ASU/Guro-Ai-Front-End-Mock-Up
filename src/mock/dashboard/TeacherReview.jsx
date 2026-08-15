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

import './css/teacherReview.css';

export default function TeacherReview () {
    return (
        <section className="teacher-review">
            <h2>Teacher Review Queue</h2>
            <div className="student-table-container">
                <table className="student-table">
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Grade Level</th>
                            <th>AI Score</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Johan A.</td>
                            <td>Grade 9: 2</td>
                            <td>80</td>
                            <td>
                                <button className="student-review-btn">Review</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Amarida S.</td>
                            <td>Grade 9: 3</td>
                            <td>75</td>
                            <td>
                                <button className="student-review-btn">Review</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Alex C.</td>
                            <td>Grade 9: 1</td>
                            <td>91</td>
                            <td>
                                <button className="student-review-btn">Review</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Lenard O.</td>
                            <td>Grade 9: 1</td>
                            <td>95</td>
                            <td>
                                <button className="student-review-btn">Review</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Juan T.</td>
                            <td>Grade 9: 5</td>
                            <td>67</td>
                            <td>
                                <button className="student-review-btn">Review</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

