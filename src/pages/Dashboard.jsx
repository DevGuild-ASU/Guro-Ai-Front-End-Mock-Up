// @ts-check
/// <reference types="vite/client" />

import { IconFilePencil } from '@tabler/icons-react';
import './css/dashboard.css';

import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer } from 'recharts';

const data = [
    { name: 'Week 1', value: 55 },
    { name: 'Week 3', value: 62 },
    { name: 'Week 5', value: 65 },
    { name: 'Week 7', value: 60 },
    { name: 'Week 9', value: 65 },
    { name: 'Week 11', value: 68 },
    { name: 'Week 13', value: 69 },
    { name: 'Week 13', value: 65 },
    { name: 'Week 15', value: 75 }
];

export default function Dashboard () {
    return (
        <>
            <div className="summary-top">
                <section className="class-performance">
                    <div className="class-information">
                        <div className="class-title">
                            <h2>Class Performance Overview</h2>
                            <h3>Average Quiz Scores</h3>
                        </div>

                        <div className="class-section">
                            <p>Section:</p>
                            <select>
                                <option value="">Grade 9: Section 1</option>
                                <option value="">Grade 9: Section 2</option>
                                <option value="">Grade 9: Section 3</option>
                                <option value="">Grade 9: Section 4</option>
                                <option value="">Grade 9: Section 5</option>
                            </select>
                        </div>
                    </div>

                    <div className="graph">
                        <ResponsiveContainer>
                            <LineChart data={data}>
                                <CartesianGrid />
                                <XAxis dataKey="name" />
                                <YAxis domain={[40, 100]} />
                                <Tooltip isAnimationActive={false} />
                                <Line dataKey="value" stroke='green' strokeWidth={2} isAnimationActive={false}/>
                            </LineChart>
                        </ResponsiveContainer>
                    </div>
                </section>
                <section className="activity">
                    <h2>Recent Activity</h2>
                    <div className="activity-container">
                        <h3>Upcoming Quizzes</h3>

                        <div className="quiz-group">
                            <div className="quiz-information">
                                <IconFilePencil />
                                <h4>Grade 9: Section 5</h4>
                            </div>

                            <p>n/a</p>
                        </div>

                        <div className="quiz-group">
                            <div className="quiz-information">
                                <IconFilePencil />
                                <h4>Grade 9: Section 3</h4>
                            </div>

                            <p>n/a</p>
                        </div>

                        <div className="quiz-group">
                            <div className="quiz-information">
                                <IconFilePencil />
                                <h4>Grade 9: Section 2</h4>
                            </div>

                            <p>n/a</p>
                        </div>

                        <h3>Completed Quizzes</h3>

                        <div className="quiz-group">
                            <div className="quiz-information">
                                <IconFilePencil />
                                <h4>Grade 9: Section 4</h4>
                            </div>

                            <p>76.0</p>
                        </div>

                        <div className="quiz-group">
                            <div className="quiz-information">
                                <IconFilePencil />
                                <h4>Grade 9: Section 2</h4>
                            </div>

                            <p>63.0</p>
                        </div>
                    </div>
                </section>
            </div>
            <div className="summary-bottom">
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
                <section className="deped-form">

                </section>
            </div>
        </>
    );
}
