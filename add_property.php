<?php
header("Content-Type: application/json");
require_once 'connection.php';

// Validate required fields
if (!isset($_POST['owner_id'], $_POST['type'], $_POST['beds'], $_POST['baths'], 
    $_POST['price'], $_POST['city'], $_FILES['image'], $_POST['street'], 
    $_POST['area'], $_POST['description'], $_POST['date_built'])) {
    
    echo json_encode(["success" => false, "message" => "Missing fields"]);
    exit;
}

// Validate image upload
$image = $_FILES['image'];
$imageFileName = uniqid() . "_" . basename($image['name']);
$uploadDir = "./images/"; // Make sure this folder exists and is writable
$uploadFile = $uploadDir . $imageFileName;

// Validate image file type (only allowing JPG, PNG, GIF)
$imageFileType = strtolower(pathinfo($uploadFile, PATHINFO_EXTENSION));
$allowedTypes = ['jpg', 'png', 'gif'];

if (!in_array($imageFileType, $allowedTypes)) {
    echo json_encode(["success" => false, "message" => "Only JPG, PNG, and GIF files are allowed"]);
    exit;
}

// Check if the image was successfully uploaded
if ($image['error'] !== UPLOAD_ERR_OK) {
    echo json_encode(["success" => false, "message" => "Error uploading image"]);
    exit;
}

// Move the uploaded image to the target directory
if (!move_uploaded_file($image['tmp_name'], $uploadFile)) {
    echo json_encode(["success" => false, "message" => "Failed to upload image"]);
    exit;
}

// Prepare the SQL statement
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
    $uploadFile, // Store the path to the uploaded image
    $_POST['street'],
    $_POST['area'],
    $_POST['description'],
    $_POST['date_built']
);

// Execute and respond
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

// Close the statement and connection
$stmt->close();
$conn->close();
?>
