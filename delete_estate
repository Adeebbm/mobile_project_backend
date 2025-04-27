<?php
require_once 'connection.php';

if (isset($_POST['estate_id'])) {
    $estateId = intval($_POST['estate_id']);

    $query = "DELETE FROM estate WHERE estate_id = $estateId";
    if (mysqli_query($conn, $query)) {
        echo "Deleted successfully";
    } else {
        echo "Error deleting";
    }
} else {
    echo "Invalid request";
}
?>
