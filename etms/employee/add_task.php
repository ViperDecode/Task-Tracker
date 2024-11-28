<?php
include 'connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $date = $_POST['date'];
  $task = $_POST['task'];

  $sql = "INSERT INTO tasks (task_date, task_description) VALUES (?, ?)";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("ss", $date, $task);

  if ($stmt->execute()) {
    echo "Task added successfully!";
  } else {
    echo "Error adding task.";
  }
}
?>
