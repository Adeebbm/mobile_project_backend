<?php
require_once 'connection.php';

$user_id = $_GET['user_id'];

$sql = "SELECT E.estate_id, E.type, E.city, E.beds, E.baths, E.price, E.image_link,
               CASE WHEN F.favorite_id IS NOT NULL THEN 1 ELSE 0 END AS is_liked
        FROM ESTATE E
        LEFT JOIN FAVORITE F ON E.estate_id = F.estate_id AND F.user_id = ?
        ORDER BY views DESC
        LIMIT 8";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$estates = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $estates[] = $row;
    }
}

echo json_encode(["success" => true, "estates" => $estates]);

$conn->close();
?>

