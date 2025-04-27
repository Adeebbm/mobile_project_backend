<?php
require_once 'connection.php';

if (!isset($_POST['estate_id'])) { echo "error"; exit; }
$id = intval($_POST['estate_id']);

$fields = [];
foreach (['price','beds','baths','city','street','description'] as $f) {
    if (!empty($_POST[$f])) {
        $val = mysqli_real_escape_string($conn, $_POST[$f]);
        $fields[] = "$f='$val'";
    }
}
if (!$fields) { echo "nothing"; exit; }

$sql = "UPDATE estate SET ".implode(',', $fields)." WHERE estate_id=$id";
echo mysqli_query($conn,$sql) ? "ok" : "fail";
