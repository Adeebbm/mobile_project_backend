<?php
require_once 'connection.php';


$user_id = (int)$_POST['user_id'];
$estate_id = (int)$_POST['estate_id'];
$action = $_POST['action']; 

if ($action === 'add') {
    $stmt = $conn->prepare("INSERT IGNORE INTO FAVORITE (user_id, estate_id) VALUES (?, ?)");
    $stmt->bind_param("ii", $user_id, $estate_id);
    $stmt->execute();
    $success = $stmt->affected_rows > 0;
    $stmt->close();
} elseif ($action === 'remove') {
    $stmt = $conn->prepare("DELETE FROM FAVORITE WHERE user_id = ? AND estate_id = ?");
    $stmt->bind_param("ii", $user_id, $estate_id);
    $stmt->execute();
    $success = $stmt->affected_rows > 0;
    $stmt->close();
} else {
    $success = false;
}

echo json_encode(["success" => $success]);

$conn->close();
?>
