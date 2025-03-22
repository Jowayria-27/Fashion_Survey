const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// PostgreSQL Database Connection
const pool = new Pool({
    user: 'your_username',
    host: 'localhost',
    database: 'your_database',
    password: 'your_password',
    port: 5432, // Default PostgreSQL port
});

// API to store survey data
app.post('/save-survey', async (req, res) => {
    const { username, gender, education, age, startTime } = req.body;

    try {
        const result = await pool.query(
            `INSERT INTO survey_responses (username, gender, education, age, start_time) 
             VALUES ($1, $2, $3, $4, $5) RETURNING *`,
            [username, gender, education, age, startTime]
        );
        res.json({ success: true, data: result.rows[0] });
    } catch (error) {
        console.error(error);
        res.status(500).json({ success: false, message: 'Database error' });
    }
});

// Start Server
app.listen(port, () => {
    console.log(`Server running on http://localhost:${port}`);
});