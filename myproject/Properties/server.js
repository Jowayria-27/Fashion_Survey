const express = require('express');
const app = express();
const fs = require('fs');
const createCsvWriter = require('csv-writer').createObjectCsvWriter;
const path = require('path');

app.use(express.urlencoded({ extended: true }));
app.use(express.static('public')); // Serve static files (e.g., HTML, CSS, JS)

// Define the file path to save the CSV file
const csvFilePath = path.join(__dirname, 'data.csv');
console.log('CSV file path:', csvFilePath); // Add logging statement

// Create a CSV writer instance
const csvWriter = createCsvWriter({
    path: csvFilePath,
    header: [
        { id: 'username', title: 'Username' },
        { id: 'age', title: 'Age' },
        // Add more header fields as needed
    ],
    append: true // Append new records to existing file
});

// Endpoint to handle form submission
app.post('/submit-form', (req, res) => {
    const { username, age /* other form fields */ } = req.body;

    console.log('Received form data:', { username, age /* other form fields */ });

    // Example: Save form data to a CSV file
    const formData = { username, age /* other form fields */ };

    // Write the form data to the CSV file
    csvWriter.writeRecords([formData])
        .then(() => {
            console.log('Form data saved to CSV file');
            res.json({ success: true }); // Send response back to frontend
        })
        .catch(error => {
            console.error('Error writing form data to CSV file:', error);
            res.status(500).json({ error: 'Internal Server Error' });
        });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
