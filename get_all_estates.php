<?php
  include 'connection.php';
  header('Content-Type: application/json');
  $res = mysqli_query($conn, "SELECT * FROM estate");
  $out = [];
  while($row = mysqli_fetch_assoc($res)) {
    $out[] = $row;
  }
  echo json_encode($out);
