<?php
include 'connect.php';

//gets the text from the html form
$email = $_POST["email"];

//if the email part of the form is empty does not execute
if (!empty($email))
{

//the sql to be executed
$sql = "DELETE FROM Members
        WHERE Email = :email
        LIMIT 1
        ";

//preparing the sql to avoid sql injection
$statement = $conn->prepare($sql);
$statement->execute(['email' => $email]);
header('Location: index.php'); //return to index
}
else {
  echo "Please fill the required fields" . "<br>";
  echo "Returning to the delete member page";
  header('refresh:2; url=deletemember.php'); //prints message and then reloads
}
 ?>
