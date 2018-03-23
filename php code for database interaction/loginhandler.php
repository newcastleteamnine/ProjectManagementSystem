<?php
include 'connect.php';

//gets the text from the html form
$email = $_POST["email"];
$password = $_POST["password"];

//if the important parts of the form are empty does not execute
if (!empty($email) || !empty($password))
{

  //the sql to be executed
  //gets password hash to be checked
  $sql = "SELECT Password_Hash FROM Members
          WHERE Email = :id
          LIMIT 1";

//preparing the sql to avoid sql injection
  $statement = $conn->prepare($sql);
  $statement->execute(['id' => $email]);
  $result = $statement->fetch();

  //checks the password hash in the database against the password entered
  if(password_verify($password, $result[0]))
  {
    echo "correct password";
  }
  else {
  {
    echo "incorrect password";
  }

  }
}

?>
