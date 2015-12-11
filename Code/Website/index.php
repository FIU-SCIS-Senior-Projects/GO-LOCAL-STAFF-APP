<?php
//Start Session
session_start();
?>

<html>
<header>
  <title>Go Local App</title>
</header>
<body>

  <?php
  require_once "functions.php";

  //define variables used in the form
  $username;
  $password;
  $confirmPass;
  $email;
  $confirmEmail;
  $usernameError = "";
  $passwordError = "";
  $emailError = "";
  $passwordMatchError = "";
  $emailMatchError = "";
  $userType = "";
  $userTypeError = "";
  $existingUser = false;

  if( $_SERVER["REQUEST_METHOD"] == "POST" )
  {
    if( empty($_POST["userType"]) )
      $userTypeError = "This field is required";
    else
      $userType = $_POST["userType"];

    if( empty($_POST["username"]) )
      $usernameError = "Username is required";
    else
    {
      $username = test_input($_POST["username"]);
    }

    if( empty($_POST["password"]) || empty($_POST["confirmPass"]) )
      $passwordError = "Passowrd is required";
    else
    {
      if( $_POST["password"] != $_POST["confirmPass"] )
        $passwordMatchError = "The passwords don't match<br>";
    }

    if( empty($_POST["email"]) || empty($_POST["confirmEmail"]) )
      $emailError = "Email is required";
    else
    {
      if( $_POST["email"] != $_POST["confirmEmail"] )
        $emailMatchError = "Emails do not match<br>";
      else
      {
        $db = mysqli_connect("localhost", "root", "root", "golocalapp");
        //Check connection
        if( mysqli_connect_errno() )
          echo "Unable to connect to MySQL: ".mysqli_connect_error();
        else
        {
          $passwordHashed = password_hash($_POST['password'], PASSWORD_BCRYPT);
          $email = $_POST["email"];

          $query = "SELECT username FROM $userType WHERE username='".$username."'";
          $result = mysqli_query($db, $query);

          if( mysqli_num_rows($result) != 0 )
          {
            $existingUser = true;
            echo "Username is already in use";
          }

          $query = "SELECT email FROM $userType WHERE email='".$email."'";
          $result = mysqli_query($db, $query);

          if( mysqli_num_rows($result) != 0 )
          {
            $existingUser = true;
            echo "Email is already registered";
          }

          if( !$existingUser )
          {
            $hash = md5( rand(0, 1000) );
            $query = "INSERT INTO ".mysqli_real_escape_string($db, $userType). " (username, password, email, hash)
                      VALUES (
                        '".mysqli_real_escape_string($db, $username)."',
                        '".mysqli_real_escape_string($db, $passwordHashed)."',
                        '".mysqli_real_escape_string($db, $email)."',
                        '".mysqli_real_escape_string($db, $hash)."');";  
            $result = mysqli_query($db, $query);
            $_SESSION["username"] = mysqli_real_escape_string($db, $username);

            $to = $email;
            $subject = "GoLocalApp email verification";
            //message to be sent to verify the email address.
            $message = "            
 
              Thanks for signing up!
              Your account has been created, you can login with the following credentials after you have activated your account by pressing the url below.
               
              ------------------------
              Username: ".$username."
              ------------------------
               
              Please click this link to activate your account:
              http://45.55.208.175/Website/verify.php?type=".$userType."&email=".$email."&hash=".$hash."
               
              ";

            $headers = "From:noreply@golocalpromos.com"."\r\n";
            mail( $to, $subject, $message, $headers );

            if( $userType == "registeredstaff" )
            {
              //echo "It should redirect to the page now!!!";
              //header("Location: http://45.55.208.175/Website/staff_register.php");
              //header("Location: http://localhost:8888/GO-LOCAL-STAFF-APP/Website/staff_register.php");
              echo "<meta http-equiv='Location' content='http://localhost:8888/GO-LOCAL-STAFF-APP/Website/staff_register.php/'>";
            }
            else
            {
              //header("Location: http://45.55.208.175/Website/company_register.php");
              //header("Location: http://localhost/GO-LOCAL-STAFF-APP/website/company_register.php");
            }

          }
        }
      }
    }
  }
  
  ?>

  <!-- Create the form -->
  <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
    User Type: 
    <input type="radio" name="userType" value="registeredstaff">Staff
    <input type="radio" name="userType" value="registeredcompany">Company
    <span class="error" style="color:red">*
      <?php echo $userTypeError; ?>
    </span><br><br>
    
    Username: 
    <input type="text" name="username" value="<?php echo $username; ?>">
    <span class="error" style="color:red">*
      <?php echo $usernameError; ?>
    </span><br><br>
    <span class="error">
      <?php echo $passwordMatchError; ?>
    </span>
    
    Password: 
    <input type="password" name="password">
    <span class="error" style="color:red">*
      <?php echo $passwordError; ?>
    </span><br><br>
    
    Confirm Password: 
    <input type="password" name="confirmPass">
    <span class="error" style="color:red">*
      <?php echo $passwordError; ?>
    </span><br><br>
    <span class="error">
      <?php echo $emailMatchError; ?>
    </span>
    
    Email: 
    <input type="email" name="email">
    <span class="error" style="color:red">*
      <?php echo $emailError; ?>
    </span><br><br>
    
    Confirm Email: 
    <input type="email" name="confirmEmail">
    <span class="error" style="color:red">*
      <?php echo $emailError; ?>
    </span><br><br>
    
    <input type="submit" value="Sign up">
  </form>
  	
</body>
</html>
