<?php require_once('../Private/initialise.php');?>
<?php $page_title = "Login Page"; ?>
<?php include('../private/shared/header.php');?>
<section class="loginblock">
  <div class="row justify-content-center">
    <div class="col-md-6">
    <form class="loginform">
      <h3><?php echo $page_title ?></h3>
      <hr>
  <div class="form-group">
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email Address">
  </div>
  <div class="form-group">
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <hr>
  <button type="submit" class="btn btn-primary">Login</button>
</form>
</div>
  </div>
</section>
<?php include('../private/shared/footer.php');?>
