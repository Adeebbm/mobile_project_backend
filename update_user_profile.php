<?php
require_once 'connection.php';   // ← your DB connection

header('Content-Type: application/json; charset=utf-8');

if (empty($_POST['user_id']) || !is_numeric($_POST['user_id'])) {
    echo json_encode(["success"=>false,"message"=>"Missing user_id"]);
    exit;
}

$user_id = intval($_POST['user_id']);

/* only update the fields that are actually sent */
$fields = [];
foreach (['name','about','phone','email'] as $f) {
    if (isset($_POST[$f]) && $_POST[$f] !== '') {
        $val = mysqli_real_escape_string($conn, $_POST[$f]);
        $fields[] = "$f = '$val'";
    }
}

if (!$fields) {
    echo json_encode(["success"=>false,"message"=>"No data to update"]);
    exit;
}

$sql = "UPDATE users SET " . implode(',', $fields) . " WHERE user_id = $user_id";
if (mysqli_query($conn, $sql)) {
    echo json_encode(["success"=>true]);
} else {
    echo json_encode(["success"=>false,"message"=>"DB error"]);
}
