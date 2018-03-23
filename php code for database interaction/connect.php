<?php
//These are the details of the uni database
$servername = "homepages.cs.ncl.ac.uk";
$username = "csc8005_team09";
$password = "ApedStunNeon";
$db = "csc8005_team09";

//I've used PDO not mysqli as it is more flexible google PDO vs mysqli for more info
try
{
  $conn = new PDO("mysql:host=$servername;dbname=$db", $username, $password);
}

catch(PDOException $e)
{
  print "Error!: " . $e->getMessage() . "<br/>";
}

 ?>
