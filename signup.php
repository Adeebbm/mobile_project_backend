<?php
require 'connection.php';

// TEMPORARY: Using GET for testing, but switch to POST in production

$username    = $_GET["username"];
$email       = $_GET["email"];
$phonenb     = $_GET["phonenb"];
$first_name  = $_GET["first_name"];
$last_name   = $_GET["last_name"];
$password    = $_GET["password"];

$response = array("success" => false);

$check_stmt = $conn->prepare("SELECT id FROM ACCOUNT WHERE username = ? OR email = ?");
$check_stmt->bind_param("ss", $username,$email);
$check_stmt->execute();
$res = $check_stmt->get_result();

if($res->num_rows > 0) {
    echo json_encode($response);
    $check_stmt->close();
    $conn->close();
    die();
}


$hashed = password_hash($password, PASSWORD_DEFAULT);

$stmt = $conn->prepare("INSERT INTO ACCOUNT (first_name, last_name, username, email, phone_number, password) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssss", $first_name, $last_name, $username, $email, $phonenb, $hashed);





if ($stmt->execute()) {
    $response["success"] = true;
}


echo json_encode($response);


$stmt->close();
$conn->close();
?>
