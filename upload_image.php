<?php
header("Content-Type: application/json");
require_once 'connection.php';  // Make sure this file contains your database connection setup

if (!isset($_FILES['image'])) {
    echo json_encode(["success" => false, "message" => "No image uploaded"]);
    exit;
}

$imageFile = $_FILES['image'];
$imageFileName = uniqid() . "_" . basename($imageFile['name']); // Generate unique filename
$uploadDir = "./images/"; // Specify the image upload directory
$uploadFile = $uploadDir . $imageFileName;

if ($imageFile['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(["success" => false, "message" => "Error uploading file"]);
    exit;
}

if (!move_uploaded_file($imageFile['tmp_name'], $uploadFile)) {
    echo json_encode(["success" => false, "message" => "Failed to move uploaded file"]);
    exit;
}

if (isset($_POST['owner_id'], $_POST['type'], $_POST['beds'], $_POST['baths'], 
    $_POST['price'], $_POST['city'], $_POST['street'], $_POST['area'], 
    $_POST['description'], $_POST['date_built'])) {
    
    $query = "INSERT INTO ESTATE (
        owner_id, type, beds, baths, price, city, image_link, street, 
        area, description, date_built
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param(
        "isiidsssdss",
        $_POST['owner_id'],
        $_POST['type'],
        $_POST['beds'],
        $_POST['baths'],
        $_POST['price'],
        $_POST['city'],
        $uploadFile, 
        $_POST['street'],
        $_POST['area'],
        $_POST['description'],
        $_POST['date_built']
    );

    if ($stmt->execute()) {
        $estate_id = $stmt->insert_id;
        echo json_encode([
            "success" => true,
            "estate_id" => $estate_id,
            "message" => "Property added successfully"
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Error adding property: " . $stmt->error
        ]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Missing required fields"]);
}

$stmt->close();
$conn->close();
?>
