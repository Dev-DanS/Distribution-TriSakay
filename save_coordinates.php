<?php
include '../db/dbconn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'));

    if ($data && isset($data->coordinates)) {
        $coordinates = $data->coordinates;

        $query = "INSERT INTO route (borders, status, datecreated) VALUES (?, 'active', NOW())";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("s", $coordinates);

        if ($stmt->execute()) {
            $response = array('success' => true);
            echo json_encode($response);
        } else {
            $response = array('success' => false);
            echo json_encode($response);
        }
    } else {
        $response = array('success' => false);
        echo json_encode($response);
    }
} else {
    $response = array('success' => false);
    echo json_encode($response);
}
?>