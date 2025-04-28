<?php
include 'connection.php';  // Include the database connection

// Check if the user_id is passed in the URL
if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    // Sanitize the input to prevent SQL injection
    $user_id = mysqli_real_escape_string($conn, $user_id);

    // Query to retrieve the user's profile information
    $query = "SELECT first_name, last_name, email, phone_number FROM account WHERE id = '$user_id'";

    // Execute the query
    $result = mysqli_query($conn, $query);

    // Check if the user exists
    if (mysqli_num_rows($result) > 0) {
        // Fetch the user data
        $user = mysqli_fetch_assoc($result);

        // Return the user data as a JSON response
        echo json_encode([
            "status" => "success",
            "first_name" => $user['first_name'],
            "last_name" => $user['last_name'],
            "email" => $user['email'],
            "phone_number" => $user['phone_number']
        ]);
    } else {
        // If the user is not found, return an error message
        echo json_encode([
            "status" => "error",
            "message" => "User not found"
        ]);
    }

    // Close the database connection
    mysqli_close($conn);
} else {
    // If the user_id is not provided, return an error message
    echo json_encode([
        "status" => "error",
        "message" => "User ID is missing"
    ]);
}
?>
