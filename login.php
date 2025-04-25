<?php
//CHANGE ALL GET TO POST AFTER TESTING 
    require_once 'connection.php';
    $user = $_GET["username"];
    $pass = $_GET["password"];

    $stmt = $conn->prepare("SELECT * FROM ACCOUNT WHERE (username = ? OR email = ?)");
    $stmt->bind_param("ss",$user,$user);
    $stmt->execute();
    $res = $stmt->get_result();

    $responce["success"] = false;
    if($row = $res->fetch_assoc()){
        if(password_verify($pass,$row["password"])){
            $responce["success"] = true;
            $responce["message"] = $row["id"];
            session_start();
            $_SESSION['user_id'] = $row["id"];
        }
    }
    echo json_encode($responce);
    $stmt->close();
    $conn->close();
?>