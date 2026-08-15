// @ts-check
/// <reference types="vite/client" />

import '../css/dashboard/classPerformance.css';
import { Area, AreaChart, CartesianGrid, Line, LineChart, ResponsiveContainer, Tooltip, XAxis, YAxis } from "recharts";

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

export default function ClassPerformance () {
    return (
        <section className="class-performance">
            <div className="class-information">
                <div className="class-title">
                    <h2>Class Performance Overview</h2>
                    <h3>Average Quiz Scores</h3>
                </div>

                <div className="class-section">
                    <p>Section:</p>
                    <select>
                        <option>Grade 9: Section 1</option>
                        <option>Grade 9: Section 2</option>
                        <option>Grade 9: Section 3</option>
                        <option>Grade 9: Section 4</option>
                        <option>Grade 9: Section 5</option>
                    </select>
                </div>
            </div>

            <div className="graph">
                <ResponsiveContainer width="100%" height="100%">
                    <AreaChart data={data}>
                        <defs>
                            <linearGradient id="fillGradient" x1="0" y1="0" x2="0" y2="1">
                                <stop offset="0%" stopColor="green" stopOpacity={0.4} />
                                <stop offset="100%" stopColor="green" stopOpacity={0} />
                            </linearGradient>
                        </defs>

                        <CartesianGrid vertical={false}/>
                        <XAxis dataKey="name" />
                        <YAxis domain={[40, 100]} />
                        <Tooltip isAnimationActive={false} />

                        <Area
                            dataKey="value"
                            stroke="green"
                            strokeWidth={2}
                            fill="url(#fillGradient)"
                            fillOpacity={1}
                            dot
                            isAnimationActive={false}
                        />
                    </AreaChart>
                </ResponsiveContainer>
            </div>
        </section>
    );
}
