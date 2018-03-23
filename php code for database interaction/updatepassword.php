<!DOCTYPE html>
<?php
include 'connect.php';
?>
<html>
<body>
<!-- This is just a basic html form for testing should be replaced-->
<form action="updatepasswordhandler.php" method="post">
  Email: <input type="text" name="email"><br>
  Old Password: <input type="text" name="oldpassword"><br>
  New Password: <input type="text" name="newpassword"><br>

<input type="submit">
</form>
</body>
</html>
