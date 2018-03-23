<!DOCTYPE html>
<?php
include 'connect.php';
?>
<html>
<body>
<!-- This is just a basic html form for testing should be replaced-->
<form action="insertmemberhandler.php" method="post">
  Email: <input type="text" name="email"><br>
  First Name: <input type="text" name="fname"><br>
  Surname: <input type="text" name="sname"><br>
  Department: <input type="text" name="department"><br>
  Job title: <input type="text" name="job_title"><br>
  Level: <input type="text" name="level"><br>
  Password: <input type="text" name="password"><br>

<input type="submit">
</form>
</body>
</html>
