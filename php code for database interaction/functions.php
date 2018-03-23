<?php
//This fuction should be used when database is queried and output within html
//This prevents xss attacks
function e($value){
  return htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
}
?>
