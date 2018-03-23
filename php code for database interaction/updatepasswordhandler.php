<?php
include 'connect.php';

//gets the text from the html form
$email = $_POST["email"];
$oldPass = $_POST["oldpassword"];
$newPass = $_POST["newpassword"];

//creates a hash of the input password salt is auto included
$hash = password_hash($newPass, PASSWORD_BCRYPT, array('cost' => 10));

//if the important parts of the form are empty does not execute
if (!empty($email) || !empty($oldPass) || !empty($newPass))
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
  if(password_verify($oldPass, $result[0]))
  {
    //the sql to be executed
    //updates the password hash with the new one
    $update = "UPDATE Members
            SET Password_Hash = :new
            WHERE Email = :id
            LIMIT 1";

//preparing the sql to avoid sql injection
    $statement = $conn->prepare($update);
    $statement->execute(array(
        "id" => $email,
        "new" => $hash
        ));
    echo "Password updated";
  }
  else {
    echo "incorrect password" . "<br>";
    echo "Returning to the update password page";
    header('refresh:2; url=updatepassword.php'); //if the password is incorrect
  }
}
else {
  echo "Please fill the required fields" . "<br>";
  echo "Returning to the update password page";
  header('refresh:2; url=updatepassword.php'); // if the form has blanks
}

 ?>
