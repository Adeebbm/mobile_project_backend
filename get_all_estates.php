<?php
  include 'connection.php';
  header('Content-Type: application/json');
  
  // Query to fetch all estates
  $res = mysqli_query($conn, "SELECT * FROM estate");
  
  $out = [];
  
  while($row = mysqli_fetch_assoc($res)) {
    $row['estate_id'] = (int) $row['estate_id'];
    $row['beds'] = (int) $row['beds'];
    $row['baths'] = (int) $row['baths'];
    $row['price'] = (float) $row['price']; 
    $row['views'] = (int) $row['views'];
    $row['area'] = (float) $row['area'];
    $row['owner_id'] = (int) $row['owner_id'];
    $row['date_build'] = $row['date_built'];  

    unset($row['date_built']);
    
    $out[] = $row;
  }
  
  echo json_encode($out);
?>
