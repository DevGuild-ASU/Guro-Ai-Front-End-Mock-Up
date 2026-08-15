// @ts-check
/// <reference types="vite/client" />

import './index.css';

export default function App () {
    return (
        <>
            <header>
                <img src="./logo.png" />
            </header>
            <main className="main-home">
                <section className="chatbox">
                    <div className="chatbox-container">
                        <div className="chatbox-information">
                            <img src="" alt="" />
                            <h3>Guro AI Chatbot</h3>
                        </div>
                        <div className="chatbox-message">
                            <img src="" alt="" />
                            <p>Based on current scan data, your student's scores are FAIR.</p>
                        </div>
                    </div>
                </section>
                <section className="summary">
                    <div className="summary-list-group">
                        <h2>Findings</h2>
                        <ul className="summary-list">
                            <li>
                                <h3>CRITICAL</h3>
                                <p>2</p>
                            </li>
                            <li>
                                <h3>HIGH</h3>
                                <p>7</p>
                            </li>
                            <li>
                                <h3>MEDIUM</h3>
                                <p>14</p>
                            </li>
                        </ul>
                    </div>
                    <div className="summary-box">

                    </div>
                </section>
            </main>
            <footer>
                <button type="button">Full Scan</button>
                <button type="button">Quick Scan</button>
                <button type="button">Report</button>
            </footer>
        </>
    );
}
