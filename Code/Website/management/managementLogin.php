<?php
  // Start the session
  session_start();
?>

<html>
<header>
  <title>Go Local App</title>
   <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
      <ul class="nav navbar-nav navbar-right">
        <li class=active>
          <a>Admin</a>
        </li>
      </ul>
  </div><!-- /.container-fluid -->
</nav>

</header>
<body>

  <div class="row">
            <!-- left side-->
         <div class="col-md-4">
         </div>

            <!-- center -->
         <div class="col-md-4">
              <form method ="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">@</span>
                    <input type="text" name="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                </div>
                <div class="input-group">
                    <span class="input-group-addon" id="basic-addon1">@</span>
                    <input type="password" name="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1">
                </div>                
                  <input type="submit" class="btn btn-primary pull-right" value="Submit"/>               
              </form>
         </div>
            <!-- right side-->
         <div class="col-md-4">
          </div>
    </div>




  <?php

  require "../functions.php";

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
    else
    {
      $username = $_POST["username"];
    }

    if( empty($_POST["password"]) )
    {
      $passwordError = "You must enter a password";
    }
    else
    {
      $password = $_POST["password"];
    }

    $passwordHashed = password_hash($password, PASSWORD_BCRYPT);

    $query = "SELECT password
              FROM management_login
              WHERE username='".$username."'";

    $result = queryDB( $query );

    if( mysqli_num_rows($result) != 0 )
    {
      //Valid username.

      //echo "Valid username";

      $row = mysqli_fetch_assoc($result);

      $passwordInDb = $row["password"];

      if( password_verify($password, $passwordInDb) )
      {
        //echo "You have been successfully logged in";

        //echo "It should redirect now!";

        $_SESSION["active"] = "yes";
  ?>

    <!--Redirect page-->
    <script type="text/javascript">location.href = 'http://45.55.240.59/Website/management/displayAllUsers.php';</script>
    <!--<script type="text/javascript">location.href = 'http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/displayAllUsers.php';</script>-->

  <?php
        // echo "<meta http-equiv='Location' content='http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/displayAllUsers.php'>";

        //header("Location: http://localhost:8888/GO-LOCAL-STAFF-APP/Website/management/displayAllUsers.php");

      }
      else
      {
        echo "password is wrong";
      }
    }
    else
    {
      echo "Username and/or password are incorrect";
    }

  }

  ?>
    
</body>
</html>