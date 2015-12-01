<html>
<header>
  <title>Go Local App</title>
</header>
<body>

  <?php

  $username;
  $password;
  $usernameError;
  $passwordError;

  if( $_SERVER["REQUEST_METHOD"] == "POST" )
  {
    if( empty($_POST["username"]) )
    {
      $usernameError = "You must enter a username";
    }

    if( empty($_POST["password"]) )
    {
      $passwordError = "You must enter a password";
    }
  }

  ?>

  <!-- Create the form -->
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    Username: 
    <input type="text" name="username">
    <span class="error" style="color:red">*
      <?php echo $usernameError; ?>
    </span><br><br>
    
    Password: 
    <input type="password" name="password">
    <span class="error" style="color:red">*
      <?php echo $passwordError; ?>
    </span><br>

    <input type="submit" value="Log in">
  </form>
    
</body>
</html>