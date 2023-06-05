<?php

// Set headers to allow cross-origin requests
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

// Database configuration
$host = 'localhost';
$username = 'your_username';
$password = 'your_password';
$database = 'your_database';

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);

    // Set PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // API endpoints
    if (isset($_GET['action'])) {
        $action = $_GET['action'];

        // Perform actions based on the requested action
        switch ($action) {
            case 'getData':
                // Fetch data from the database
                // Implement your own logic here to retrieve data from the desired table
                $query = "SELECT * FROM your_table";
                $stmt = $pdo->query($query);
                $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

                // Return the data as JSON response
                header("Content-Type: application/json");
                echo json_encode($data);
                break;

            case 'insertData':
                // Insert data into the database
                // Implement your own logic here to insert data into the desired table
                // You can access the values using $_POST['paramName']
                $value1 = $_POST['value1'];
                $value2 = $_POST['value2'];

                $query = "INSERT INTO your_table (column1, column2) VALUES (:value1, :value2)";
                $stmt = $pdo->prepare($query);
                $stmt->execute(['value1' => $value1, 'value2' => $value2]);

                // Return success message as JSON response
                header("Content-Type: application/json");
                echo json_encode(['message' => 'Data inserted successfully']);
                break;

            // Add more cases for other actions (e.g., updateData, deleteData) as needed

            default:
                // Invalid action requested
                header("HTTP/1.0 400 Bad Request");
                echo "Invalid action";
                break;
        }
    }
} catch (PDOException $e) {
    // Handle database connection errors
    header("HTTP/1.0 500 Internal Server Error");
    echo "Database connection failed: " . $e->getMessage();
}

