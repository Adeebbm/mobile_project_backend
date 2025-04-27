<?php
// update_estate_with_image.php

header('Content-Type: application/json');
include 'connection.php'; 

$response = [];

// Check if the request is a POST request
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check if the image is uploaded
    if (isset($_FILES['image'])) {
        // Get the estate_id and image
        
        $image = $_FILES['image'];
        
        $imageName = $image['name'];
        $imageTmpName = $image['tmp_name'];
        $imageSize = $image['size'];
        $imageError = $image['error'];
        
        // Define the directory to save the image
        $uploadDir = 'images/';
        
        // Check for any error during upload
        if ($imageError === 0) {
            
            $imageNewName = uniqid('', true) . "." . pathinfo($imageName, PATHINFO_EXTENSION);
            $imageDestination = $uploadDir . $imageNewName;
            
            
            if ($imageSize < 5000000) {
                if (move_uploaded_file($imageTmpName, $imageDestination)) {
                    
                    $imageUrl = 'http://localhost/mobile_project_backend/' . $imageDestination;
                    
                   
                    
                        $response['success'] = true;
                        $response['message'] = 'Estate image updated successfully!';
                        $response['image_link'] = 'mobile_project_backend/' . $imageDestination;
                    
                    
                    
                } else {
                    $response['success'] = false;
                    $response['message'] = 'Failed to move the uploaded image.';
                }
            } else {
                $response['success'] = false;
                $response['message'] = 'Image size exceeds the limit (5MB).';
            }
        } else {
            $response['success'] = false;
            $response['message'] = 'Error uploading the image.';
        }
    } else {
        $response['success'] = false;
        $response['message'] = 'No image uploaded or missing estate ID.';
    }
} else {
    $response['success'] = false;
    $response['message'] = 'Invalid request method!';
}


echo json_encode($response);
?>
