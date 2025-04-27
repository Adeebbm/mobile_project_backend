<?php
// add_property.php

header('Content-Type: application/json');
include 'connection.php'; // assume you have a connection file

$response = [];

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $type = $_POST['type']; 
    $beds = (int)$_POST['beds']; 
    $baths = (int)$_POST['baths']; 
    $price = (double)$_POST['price'];
    $city = $_POST['city'];
    $street = $_POST['street'];
    $area = (double)$_POST['area']; 
    $description = $_POST['description']; 
    $date_built = $_POST['date_built'];
    $owner_id = (int)$_POST['owner_id']; 
    $image_link = $_POST['image_link'];

 



    $stmt = $conn->prepare("INSERT INTO ESTATE (type, beds, baths, price, city, image_link, street, area, description, date_built, owner_id) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("siidsssdssi", 
$type, 
$beds, 
    $baths, 
    $price, 
    $city, 
    $image_link, 
    $street, 
    $area, 
    $description, 
    $date_built, 
    $owner_id
    );

    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = "Property added successfully!";
        $response['estate_id'] = $stmt->insert_id; // Return the new estate_id if needed later
    } else {
        $response['success'] = false;
        $response['message'] = "Database error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
} else {
    $response['success'] = false;
    $response['message'] = "Invalid request method!";
}

echo json_encode($response);
?>
