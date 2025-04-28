<?php
include 'connection.php';  // Include your database connection

// Check if all required POST data is received
if (isset($_POST['user_id'])) {
    $user_id = $_POST['user_id'];
    $firstname = isset($_POST['firstname']) ? $_POST['firstname'] : '';
    $lastname = isset($_POST['lastname']) ? $_POST['lastname'] : '';

    $password = isset($_POST['password']) ? $_POST['password'] : '';
    $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
    $email = isset($_POST['email']) ? $_POST['email'] : '';

    // Sanitize input to prevent SQL injection
    $user_id =(int) mysqli_real_escape_string($conn, $user_id);
    $firstname = mysqli_real_escape_string($conn, $firstname);
    $lastname = mysqli_real_escape_string($conn, $lastname);
    $password = mysqli_real_escape_string($conn, $password);
    $phone = mysqli_real_escape_string($conn, $phone);
    $email = mysqli_real_escape_string($conn, $email);

    // Prepare the SQL query to update user profile information
    $query = "UPDATE account SET ";

    // Add conditions to update only the fields that are provided
    if (!empty($firstname)) {
        $query .= "first_name = '$firstname', ";
    }
    if (!empty($lastname)) {
        $query .= "last_name = '$lastname', ";
    }
    if (!empty($password)) {
        $password_hash = password_hash($password, PASSWORD_DEFAULT);  // Hash the password before storing it
        $query .= "password = '$password_hash', ";
    }
    if (!empty($phone)) {
        $query .= "phone_number = '$phone', ";
    }
    if (!empty($email)) {
        $query .= "email = '$email', ";
    }

    // Remove the last comma and space
    $query = rtrim($query, ", ");

    // Add the WHERE condition to target the specific user by user_id
    $query .= " WHERE id = '$user_id'";

    // Debug: Print the query to check it
    echo $query;

    // Execute the query and check for errors
    if (mysqli_query($conn, $query)) {
        echo "Profile updated successfully.";
    } else {
        echo "Error updating profile: " . mysqli_error($conn);
    }

    // Close the database connection
    mysqli_close($conn);
} else {
    echo "User ID is missing.";
}
?>
