<?php
require_once 'connection.php';

if (isset($_GET['owner_id'])) {
    $owner_id = intval($_GET['owner_id']);

    $query = "SELECT * FROM estate WHERE owner_id = $owner_id";
    $result = mysqli_query($conn, $query);

    $estates = array();

    while ($row = mysqli_fetch_assoc($result)) {
        $estates[] = $row;
    }

    echo json_encode($estates);
} else {
    echo json_encode([]);
}
?>
