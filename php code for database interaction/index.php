<!DOCTYPE html>
<?php
include 'connect.php';
?>
<html>
<body>
<!-- This is just a basic html form for testing should be replaced-->
<form action="loginhandler.php" method="post">
  Email: <input type="text" name="email"><br>
  Password: <input type="text" name="password"><br>

<input type="submit"><br>
<br>
<a href="insertmember.php">Insert new member record </a>
<br>
<a href="deletemember.php">Delete a member record </a>
<br>
<a href="updatepassword.php">Change password </a>

</form>
</body>
</html>
