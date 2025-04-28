<?php
include 'connection.php';  


if (isset($_GET['user_id'])) {
    $user_id = $_GET['user_id'];

    
    $user_id = mysqli_real_escape_string($conn, $user_id);

    
    $query = "SELECT first_name, last_name, email, phone_number FROM account WHERE id = '$user_id'";

    
    $result = mysqli_query($conn, $query);

    
    if (mysqli_num_rows($result) > 0) {
        
        $user = mysqli_fetch_assoc($result);

        
        echo json_encode([
            "status" => "success",
            "first_name" => $user['first_name'],
            "last_name" => $user['last_name'],
            "email" => $user['email'],
            "phone_number" => $user['phone_number']
        ]);
    } else {
        
        echo json_encode([
            "status" => "error",
            "message" => "User not found"
        ]);
    }

    
    mysqli_close($conn);
} else {
    
    echo json_encode([
        "status" => "error",
        "message" => "User ID is missing"
    ]);
}
?>
