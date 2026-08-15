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

import './css/depEd.css';

export default function DepEd () {
    return (
        <section className="deped-form">
            <h2>DepEd Form Auto-fill</h2>
            <div className="report-container">
                <table className="report-table">
                    <thead>
                        <tr>
                            <th>Student</th>
                            <th>Type</th>
                            <th>Draft</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Johan A.</td>
                            <td>
                                <select>
                                    <option>SF9</option>
                                    <option>SF10</option>
                                </select>
                            </td>
                            <td>
                                <button className="report-btn">Ready</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Amarida S.</td>
                            <td>
                                <select>
                                    <option>SF9</option>
                                    <option>SF10</option>
                                </select>
                            </td>
                            <td>
                                <button className="report-btn">Generate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Alex C.</td>
                            <td>
                                <select>
                                    <option>SF9</option>
                                    <option>SF10</option>
                                </select>
                            </td>
                            <td>
                                <button className="report-btn">Generate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Lenard O.</td>
                            <td>
                                <select>
                                    <option>SF9</option>
                                    <option>SF10</option>
                                </select>
                            </td>
                            <td>
                                <button className="report-btn">Generate</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Juan T.</td>
                            <td>
                                <select>
                                    <option>SF9</option>
                                    <option>SF10</option>
                                </select>
                            </td>
                            <td>
                                <button className="report-btn">Generate</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    );
}

