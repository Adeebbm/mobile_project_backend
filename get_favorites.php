<?php
header("Content-Type: application/json");
require_once 'connection.php';

$user_id = isset($_GET['user_id']) ? (int)$_GET['user_id'] : 0;

if ($user_id <= 0) {
    echo json_encode(["success" => false, "message" => "Invalid user ID"]);
    exit;
}

// Query to get only needed property information
$query = "SELECT 
            e.estate_id,
            e.type,
            e.city,
            e.street,
            e.beds,
            e.baths,
            e.price,
            e.image_link,
            e.area,
            e.description,
            e.date_built
          FROM ESTATE e
          JOIN FAVORITE f ON e.estate_id = f.estate_id
          WHERE f.user_id = ?";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$favorites = array();
while ($row = $result->fetch_assoc()) {
    $favorites[] = $row;
}

echo json_encode([
    "success" => true,
    "favorites" => $favorites
]);

$stmt->close();
$conn->close();
?>