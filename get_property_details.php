<?php
header("Content-Type: application/json");
require_once 'connection.php';

// Get property ID from request
$property_id = isset($_GET['property_id']) ? intval($_GET['property_id']) : 0;

if ($property_id <= 0) {
    echo json_encode(["success" => false, "message" => "Invalid property ID"]);
    exit;
}

// Query to get property details and owner information
$query = "SELECT e.*, 
          a.first_name, a.last_name, a.phone_number, a.email
          FROM ESTATE e
          JOIN ACCOUNT a ON e.owner_id = a.id
          WHERE e.estate_id = ?";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $property_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $property = $result->fetch_assoc();
    
    // Update view count
    $update_query = "UPDATE ESTATE SET views = views + 1 WHERE estate_id = ?";
    $update_stmt = $conn->prepare($update_query);
    $update_stmt->bind_param("i", $property_id);
    $update_stmt->execute();
    $update_stmt->close();
    
    echo json_encode([
        "success" => true,
        "property" => $property
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Property not found"
    ]);
}

$stmt->close();
$conn->close();
?>