<?php
include 'connect.php';

//gets the text from the html form
$email = $_POST["email"];
$fname = $_POST["fname"];
$sname = $_POST["sname"];
$department = $_POST["department"];
$jtitle = $_POST["job_title"];
$level = $_POST["level"];
$password = $_POST["password"];

//creates a hash of the input password salt is auto included
$hash = password_hash($password, PASSWORD_BCRYPT, array('cost' => 10));

//if the important parts of the form are empty does not execute
if (!empty($email) || !empty($fname) || !empty($sname) || !empty($level) || !empty($password))
{

//the sql to be executed
$sql = "INSERT INTO Members (Email, First_Name, Surname, Department, Job_Title, Level, Password_Hash)
        VALUES (:email, :fname, :sname, :depart, :job, :lev, :hash)";

//preparing the sql to avoid sql injection
$statement = $conn->prepare($sql);
$statement->execute(array(
  "email" => $email,
  "fname" => $fname,
  "sname" => $sname,
  "depart" => $department,
  "job" => $jtitle,
  "lev" => $level,
  "hash" => $hash
));
header('Location: index.php');//return to index
}
else {
  echo "Please fill the required fields" . "<br>";
  echo "Returning to the insert member page";
  header('refresh:2; url=insertmember.php'); //prints message and then reloads
}

 ?>
